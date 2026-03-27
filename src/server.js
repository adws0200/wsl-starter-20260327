const http = require('http');

const SERVICE_NAME = 'wsl-starter-20260327';

function requestListener(req, res) {
  if (req.url && req.url.startsWith('/health')) {
    const payload = JSON.stringify({ ok: true, service: SERVICE_NAME });
    res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
    res.end(payload);
    return;
  }

  res.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' });
  res.end('Hello from wsl-starter-20260327\n');
}

function createServer() {
  return http.createServer(requestListener);
}

function startServer({ host = '127.0.0.1', port = Number(process.env.PORT || 3000) } = {}) {
  const server = createServer();

  return new Promise((resolve, reject) => {
    server.once('error', reject);
    server.listen(port, host, () => resolve(server));
  });
}

if (require.main === module) {
  startServer()
    .then((server) => {
      const address = server.address();
      const displayPort = typeof address === 'object' && address ? address.port : process.env.PORT || 3000;
      console.log(`🚀 Server listening on http://127.0.0.1:${displayPort}`);
    })
    .catch((err) => {
      console.error('❌ Failed to start Node server:', err.message);
      process.exit(1);
    });
}

module.exports = {
  SERVICE_NAME,
  createServer,
  startServer,
};
