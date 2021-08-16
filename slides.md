class: middle, center

<img src="./assets/deno_logo_3.svg" align="center" width="300" />

# Deno Deploy の話

---

# Deno と Deno Deploy の関係

---

# Deno Deploy の立ち位置

- Cloudflare Workers
- AWS Lambda
- AWS Lambda@Edge

---

# Deno Deploy のサンプルコード

```ts
addEventListener("fetch", (e) => {
  e.respondWith(new Response("Hello, world!", {
    status: 200
  }));
});
```
