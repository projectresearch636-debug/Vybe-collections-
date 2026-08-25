export default {
  async fetch(request, env) {
    return new Response(
      "Vybe Collections — Cloudflare deployment is active.",
      {
        headers: {
          "content-type": "text/plain; charset=UTF-8"
        }
      }
    );
  }
};
