#!/usr/bin/env bash
set -euo pipefail

# CEO HQ — GitHub Controlled Workflow P0 Verification
#
# Purpose:
#   1. Create a DRAFT Pull Request:
#        agent/github-link01-controlled-workflow -> main
#   2. Inspect GitHub Actions runs
#   3. Inspect check-runs for the tested commit
#   4. Post a benign PR comment
#
# Safety:
#   - NEVER hard-code a GitHub token.
#   - GHTOKEN must be supplied through the environment.
#   - NEVER merges the PR.
#   - NEVER pushes directly to main.
#   - Keep the PR in DRAFT state for governance review.

OWNER="projectresearch636-debug"
REPO="Vybe-collections-"
BRANCH="agent/github-link01-controlled-workflow"
BASE="main"
HEAD_COMMIT="116b3e5ea6b9e502009cf3204361ddb941b493cc"

GHTOKEN="${GHTOKEN:-}"

if [ -z "$GHTOKEN" ]; then
    echo "ERROR: GHTOKEN is not set."
    echo
    echo "Set the token locally:"
    echo '  export GHTOKEN="YOUR_TOKEN"'
    echo
    echo "Do NOT put the token in this file or commit it to GitHub."
    exit 2
fi

API="https://api.github.com"

AUTH_HEADER="Authorization: Bearer $GHTOKEN"
ACCEPT="Accept: application/vnd.github+json"
API_VERSION="X-GitHub-Api-Version: 2022-11-28"

echo "=============================================="
echo " CEO HQ — GitHub P0 Verification"
echo "=============================================="
echo
echo "Repository : $OWNER/$REPO"
echo "Head       : $BRANCH"
echo "Base       : $BASE"
echo "Commit     : $HEAD_COMMIT"
echo

# ------------------------------------------------
# 1. CREATE DRAFT PR
# ------------------------------------------------

echo "1) Creating Draft Pull Request..."

create_resp=$(
    curl -sS -w "\n%{http_code}" \
        -X POST \
        -H "$AUTH_HEADER" \
        -H "$ACCEPT" \
        -H "$API_VERSION" \
        "$API/repos/$OWNER/$REPO/pulls" \
        -d @- <<EOF
{
  "title": "P0: Controlled workflow branch creation test",
  "head": "$BRANCH",
  "base": "$BASE",
  "body": "CEO HQ controlled-workflow verification. The branch contains a benign test artifact. This Pull Request is draft-only and must not be merged without governance approval.",
  "draft": true
}
EOF
)

http_code=$(echo "$create_resp" | tail -n 1)
body=$(echo "$create_resp" | sed '$d')

echo "HTTP status: $http_code"
echo

if [ "$http_code" != "201" ]; then
    echo "❌ Draft PR creation failed."
    echo
    echo "Response:"
    echo "$body" | jq .
    echo
    echo "STOP — investigate the GitHub permission boundary."
    exit 3
fi

pr_number=$(echo "$body" | jq -r '.number')
pr_url=$(echo "$body" | jq -r '.html_url')

echo "✅ Draft PR created successfully."
echo "PR Number : #$pr_number"
echo "PR URL    : $pr_url"
echo

# ------------------------------------------------
# 2. LIST ACTIONS RUNS
# ------------------------------------------------

echo "2) Checking GitHub Actions runs..."

encoded_branch=$(
    printf '%s' "$BRANCH" | jq -s -R -r @uri
)

curl -sS \
    -H "$AUTH_HEADER" \
    -H "$ACCEPT" \
    -H "$API_VERSION" \
    "$API/repos/$OWNER/$REPO/actions/runs?branch=$encoded_branch" \
    | jq .

echo

# ------------------------------------------------
# 3. LIST CHECK-RUNS
# ------------------------------------------------

echo "3) Checking check-runs for HEAD commit..."

curl -sS \
    -H "$AUTH_HEADER" \
    -H "$ACCEPT" \
    -H "$API_VERSION" \
    "$API/repos/$OWNER/$REPO/commits/$HEAD_COMMIT/check-runs" \
    | jq .

echo

# ------------------------------------------------
# 4. POST BENIGN PR COMMENT
# ------------------------------------------------

echo "4) Testing PR comment/write capability..."

comment_resp=$(
    curl -sS -w "\n%{http_code}" \
        -X POST \
        -H "$AUTH_HEADER" \
        -H "$ACCEPT" \
        -H "$API_VERSION" \
        "$API/repos/$OWNER/$REPO/issues/$pr_number/comments" \
        -d '{
          "body": "CEO HQ controlled-workflow verification comment. Benign test only. Do not merge."
        }'
)

comment_code=$(echo "$comment_resp" | tail -n 1)
comment_body=$(echo "$comment_resp" | sed '$d')

echo "Comment HTTP status: $comment_code"
echo "$comment_body" | jq .
echo

# ------------------------------------------------
# 5. MERGE SAFETY
# ------------------------------------------------

echo "=============================================="
echo " MERGE SAFETY"
echo "=============================================="
echo

echo "🟢 No merge operation was performed."
echo "🟢 main was not directly modified by this script."
echo "🟢 Draft PR remains available for governance review."
echo "🟢 Branch remains in place."
echo

echo "=============================================="
echo " CEO HQ P0 VERIFICATION COMPLETE"
echo "=============================================="
echo

echo "PR #$pr_number"
echo "$pr_url"
echo
