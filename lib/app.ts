import * as Koa from 'koa';

const app = new Koa();

app.use(async function(ctx) {
  ctx.body = 'Hello World';
});

export const server = app.listen(3000);
