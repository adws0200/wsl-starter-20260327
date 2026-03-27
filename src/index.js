function buildStatusLines(now = new Date()) {
  return [
    '✅ Node starter is ready.',
    `Time: ${now.toISOString()}`,
  ];
}

function run() {
  for (const line of buildStatusLines()) {
    console.log(line);
  }
}

if (require.main === module) {
  run();
}

module.exports = {
  buildStatusLines,
  run,
};
