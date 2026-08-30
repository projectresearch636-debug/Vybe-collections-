# Vybe Collections — CEO-OS-013
## Data Governance, KPI Dictionary & Actual-Data Cutover

**Status:** ACTIVE / CONTROL STANDARD  
**Date:** 2026-08-30  
**Authority:** CEO Headquarters

> CONTROL NOTICE: Demo data remains synthetic. This document defines governance; it does not create actual company records or financial results.

## 1. Objective

Establish a single, controlled framework for KPI definitions, source ownership, validation, reconciliation, reporting status and transition from demo data to verified actual data.

## 2. Data Status Classes

- **DEMO:** Synthetic values used for system testing only.
- **PENDING:** Data received but not yet validated.
- **VERIFIED ACTUAL:** Reconciled business data approved for executive reporting.
- **ESTIMATE:** Explicitly modelled value based on documented assumptions.
- **ARCHIVED:** Historical data retained for audit/reference but not used as current KPI actuals.

## 3. KPI Dictionary

| KPI | Definition | Primary Source | Owner | Frequency | Validation |
|---|---|---|---|---|---|
| Revenue | Recognized sales for defined reporting period | Finance/order system | Finance | Weekly/Monthly | Reconcile orders, returns, taxes as applicable |
| Gross Margin | (Revenue − COGS) / Revenue | Finance | Finance | Monthly | P&L reconciliation |
| Operating Profit | Revenue − COGS − operating expenses | Finance | Finance | Monthly | Management P&L reconciliation |
| Cash Position | Available cash at reporting cut-off | Bank/Finance | Finance | Weekly | Bank reconciliation |
| Orders | Count of valid completed orders in period | Order system | E-commerce/Sales | Daily/Weekly | Deduplicate/cancel validation |
| AOV | Revenue / valid orders | Order system + Finance | E-commerce | Weekly | Reconcile revenue/orders |
| Conversion Rate | Orders / defined eligible sessions or visits | Analytics platform | E-commerce | Weekly | Analytics integrity check |
| ROAS | Attributed revenue / advertising spend | Ad platforms + Finance | Marketing | Weekly | Attribution and spend reconciliation |
| Return Rate | Returned units or orders / defined denominator | Order/returns system | Customer Service | Weekly/Monthly | Return authorization reconciliation |
| Defect Rate | Defective units / inspected or produced units, per approved definition | QA/Production | QA | Weekly | QA sample/production reconciliation |
| OTIF | Orders delivered on time and in full / eligible orders | Logistics/order system | Supply Chain | Weekly | Delivery-event reconciliation |
| Inventory Value | Valuation of inventory at cut-off | Inventory/Finance | Supply Chain + Finance | Weekly/Monthly | Physical/system/valuation reconciliation |
| Inventory Turnover | COGS / average inventory for defined period | Finance + Inventory | Finance | Monthly | Period reconciliation |
| CSAT | Average customer satisfaction score under approved survey method | Customer Service | Customer Service | Weekly/Monthly | Survey/data-quality review |

Definitions must be finalized against the company's actual systems before the KPI is classified as VERIFIED ACTUAL.

## 4. Source-of-Truth Rules

1. Each KPI has one primary authoritative source.
2. Secondary sources may validate but cannot silently override the primary source.
3. Material discrepancies require investigation and documented resolution.
4. Reporting periods must use explicit cut-off dates and time zones where relevant.
5. Metric definitions cannot change mid-period without documented governance approval.
6. Demo values must never be merged with actual values.

## 5. Actual-Data Cutover Procedure

### Step 1 — Intake
Collect actual records from approved business systems.

### Step 2 — Classification
Mark records PENDING until validation is complete.

### Step 3 — Validation
Check completeness, duplicates, dates, units, currency, source integrity and definitions.

### Step 4 — Reconciliation
Finance reconciles financial figures; operational owners reconcile operational metrics.

### Step 5 — Approval
Responsible department owner confirms validity; CEO HQ authorizes use for executive reporting where appropriate.

### Step 6 — Activation
Promote validated records to VERIFIED ACTUAL.

### Step 7 — Dashboard Cutover
Executive dashboards use VERIFIED ACTUAL data; DEMO remains archived and visibly labelled.

### Step 8 — Baseline Reset
Recalculate targets, OKRs, risks, forecasts and strategic priorities using the validated baseline.

## 6. Data Quality Gates

A KPI cannot become VERIFIED ACTUAL if there is a material unresolved issue involving:
- Missing records
- Duplicate records
- Incorrect period
- Unreconciled financial totals
- Ambiguous definition
- Unsupported manual adjustment
- Unexplained material variance

## 7. Data Ownership

**Department owner:** Responsible for source accuracy.  
**Data/BI:** Responsible for definitions, lineage, quality monitoring and reporting logic.  
**Finance:** Responsible for financial reconciliation and financial-control integrity.  
**IT/Automation:** Responsible for system reliability, access and automated pipelines.  
**CEO HQ:** Responsible for executive governance, escalation and final reporting policy.

## 8. Actual Baseline Checklist

Before official CEO reporting begins:

- [ ] Real prospect/customer records loaded
- [ ] Real order data loaded
- [ ] Real revenue reconciled
- [ ] Real COGS established
- [ ] Real expenses established
- [ ] Real inventory established
- [ ] Real production/quality data established
- [ ] Real logistics data established
- [ ] Real marketing spend/attribution established
- [ ] Real returns/service data established
- [ ] KPI definitions approved
- [ ] Data owners confirmed
- [ ] Dashboard switched from DEMO to VERIFIED ACTUAL

## 9. Governance Decision

**KPI dictionary:** ESTABLISHED  
**Source-of-truth framework:** ESTABLISHED  
**Validation controls:** ESTABLISHED  
**Demo/actual segregation:** ESTABLISHED  
**Actual cutover process:** ESTABLISHED  
**Actual baseline:** PENDING BUSINESS DATA

## 10. Next Program

**CEO-OS-014 — CEO Master Operating Calendar & Reporting Pack**

Objective: establish the recurring daily/weekly/monthly/quarterly CEO reporting calendar and standard executive pack used across all departments.
