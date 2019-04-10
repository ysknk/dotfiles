const is_windows = process.platform === 'win32';
const exec_sync = require('child_process').execSync;

const cmd = is_windows ? 'cd .install && windows.bat'
                       : 'cd .install && sh mac.sh';

const result = exec_sync(cmd, (err, stdout, stderr) => {
  if (err) { console.log(`err: ${err}`); }
  console.log(`stdout: ${toString(stdout)}`);
  console.log(`strerr: ${toString(strerr)}`);
});

console.log(`> ${cmd}`);

console.log('Success.');