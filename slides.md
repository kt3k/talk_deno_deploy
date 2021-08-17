class: middle, center

<img src="./assets/deno_logo_3.svg" align="center" width="300" />

# Deno Deploy の話

---

# 話す人

<img src="./assets/hinosawa.jpg" align="right" width="300" />

ひのさわ twitter @kt3k

Deno Land Inc. (2021年1月 ~)

- Deno Deploy の<br />フロントエンド周り開発
- Deno 自体の開発<br />(主に標準モジュール)

---

class: inverse, center, middle
# Deno Deploy <br />というサービスについて

---
class: middle
# Deno Deploy とは

- 2021年5月に Deno の会社 Deno Land Inc. より<br />ベータリリースされた Web サービス
- サーバーレス関数を提供するプラットフォーム
  - AWS Lambda、Google Cloud Functions、Cloudflare Workers などと競合するサービス

---
class: middle
# Deno Deploy とは

- Deno Deploy に紐付けた github repository に push すると自動的にそのブランチがデプロイされる (URL 直指定でデプロイするオプションもあり)
- アップロードされたサーバーレス関数は世界25リージョンに自動的に分散デプロイされる
- ベータ期間中は無料。正式リリース後もある程度の無料枠がある予定。

---

class: center
# Deno と Deno Deploy の関係

<img src="./assets/schema.png" width="600" />

Deno の architecture

---

# Deno と Deno Deploy の関係

```
Deno =
  deno_core
  + ops for deno
  + tools

Deno Deploy =
  deno_core
  + ops for deploy
  + builtin server
```

大雑把にいうと deno_core の ops 部分を差し替えたものが Deno Deploy

---

# Deno と Deno Deploy の関係

共通すること
- モジュール解決 (URL import)
- TS サポート
- Web API ex. fetch, WebSocket, etc

---

# Deno と Deno Deploy の関係

違うこと
- OS の機能を直接使うような API は Deno Deploy にはない。 例. ファイル操作, サブプロセス起動 etc

---

# サンプルコード

```ts
addEventListener("fetch", (e) => {
  e.respondWith(new Response("Hello, world!", {
    status: 200
  }));
});
```

---

# サンプルコード sift

---

# サンプルコード oak

---

# Deno Deploy の立ち位置

- AWS Lambda
- AWS Lambda@Edge
- Cloudflare Workers

---

## vs AWS Lambda

- Lambda は他の AWS の種々のサービスと組み合わせて使うものなので、単純な比較は出来ない。
- API Gateway + Lambda という使い方と Deno Deploy を比較すると、Lambda が1リージョンに限定されるのに対して、Deno Deploy は25リージョンに自動分散される点がアドバンテージ

---

## vs AWS Lambda@Edge

- Lambda@Edge は Deno Deploy と同じく 20+リージョンに自動分散デプロイされる点で Deploy に似ている。
- が、Lambda@Edge はあくまで Cloudfront ありき、オリジンありきのサービスなので、Lambda@Edge だけでアプリケーションを作る事はできない。
- Deno Deploy は Heroku のように、それ単体で完結したアプリケーションのプラットフォームになることを志向したサービス。

---

## vs Cloudflare Workers

- 一番 Deno Deploy に似ているサービスで、本当の意味での競合と言えるサービス
- リージョン数 (POP数) も全世界200+箇所に自動デプロイされる (Deno Deploy は25)
- import の解決はされない、TS はサポートされていない (ので、自前でビルドが必要) など、開発体験の面で機能差分がある。

---

class: middle, center

ご清聴ありがとうございました。

<img src="./assets/deno_logo_3.svg" align="center" width="300" />

---