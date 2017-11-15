// See https://gist.github.com/bahmutov/448f73b49914d1981643
console.log('docker_node_fun reporting for duty! Current working directory is', process.cwd());
var read = require('fs').readFileSync;
console.log(read('./hello.txt', 'utf8'));

// See https://nodejs.org/api/console.html
var x = 3;
console.warn(`x=${x}`);
