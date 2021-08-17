DEPLOY_DIR=deno run --allow-read=. --allow-write=. https://deno.land/x/deploy_dir@v0.3.2/cli.ts

dist:
	npm run dist
	$(DEPLOY_DIR) docs -o deploy.js -y
