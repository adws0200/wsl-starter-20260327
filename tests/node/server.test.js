const test = require('node:test');
const assert = require('node:assert/strict');

const { startServer, SERVICE_NAME } = require('../../src/server.js');

test('GET /health returns service payload', async (t) => {
  const server = await startServer({ port: 0 });
  t.after(() => server.close());

  const { port } = server.address();
  const response = await fetch(`http://127.0.0.1:${port}/health`);
  const payload = await response.json();

  assert.equal(response.status, 200);
  assert.equal(payload.ok, true);
  assert.equal(payload.service, SERVICE_NAME);
});

test('GET / returns hello text', async (t) => {
  const server = await startServer({ port: 0 });
  t.after(() => server.close());

  const { port } = server.address();
  const response = await fetch(`http://127.0.0.1:${port}/`);
  const body = await response.text();

  assert.equal(response.status, 200);
  assert.match(body, /Hello from wsl-starter-20260327/);
});
