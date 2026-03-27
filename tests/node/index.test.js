const test = require('node:test');
const assert = require('node:assert/strict');

const { buildStatusLines } = require('../../src/index.js');

test('buildStatusLines returns two readable lines', () => {
  const fixed = new Date('2026-01-01T00:00:00.000Z');
  const lines = buildStatusLines(fixed);

  assert.equal(lines.length, 2);
  assert.equal(lines[0], '✅ Node starter is ready.');
  assert.match(lines[1], /^Time: 2026-01-01T00:00:00\.000Z$/);
});
