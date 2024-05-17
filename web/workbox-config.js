module.exports = {
  globDirectory: 'build/web/',
  globPatterns: ['**/*.{json,otf,ttf,js,wasm,png,html}'],
  swSrc: 'web/service-worker.js',
  swDest: 'build/web/service-worker.js',
  maximumFileSizeToCacheInBytes: 10000000,
};
