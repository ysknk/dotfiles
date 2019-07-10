const is_windows = process.platform === `win32`;
const exec_sync = require(`child_process`).execSync;

const cmd = is_windows ? `cd _setup && windows.bat`
                       : `cd _setup && sh mac.sh`;

const color_reset = `\u001b[0m`;
const font_bold = `\u001b[1m`;
const set_font = (color, str, is_bold) => {
  return `${color}${is_bold ? font_bold : ''}${str}${color_reset}`;
};
const colors = {
  red: (str, is_bold) => { return set_font(`\u001b[31m`, str, is_bold); },
  green: (str, is_bold) => { return set_font(`\u001b[32m`, str, is_bold); },
  white: (str, is_bold) => { return set_font(`\u001b[37m`, str, is_bold); },
};

console.log(colors.white(`> ${cmd}`, true));

const result = exec_sync(cmd, {stdio:[0,1,2]}, (err, stdout, stderr) => {
  if (err) { console.log(colors.red(`err: ${err}`, true)); }
  console.log(colors.red(`stdout: ${toString(stdout)}`, true));
  console.log(colors.red(`strerr: ${toString(strerr)}`, true));
});

console.log(colors.green(`Setup Success.`, true));

