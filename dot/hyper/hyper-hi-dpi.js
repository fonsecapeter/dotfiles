// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    hyperTabs: {
      trafficButtons: true,
      tabIconsColored: true,
      activityColor: '#f9997e'
    },

    hyperStatusLine: {
      footerTransparent: false,
      dirtyColor: '#f6c693',
      aheadColor: '#bf94c3'
    },

    // Choose either "stable" for receiving highly polished,
    // or "canary" for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 10,

    // font family with optional fallbacks
    fontFamily: '"Peter Mono"',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#4ea37e',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // set to true for blinking cursor
    cursorBlink: true,

    // color of the text
    foregroundColor: '#f5e6c2',

    // terminal background color
    backgroundColor: '#464d51',

    // border color (window, tabs)
    borderColor: '#464d51',

    // custom css to embed in the main window
    css: 'footer {font-family: "Peter Mono"; -webkit-font-smoothing: subpixel-antialiased !important; font-size: 10px !important;} header {font-family: "Peter Mono";}',

    // custom css to embed in the terminal window
    termCSS: 'x-screen {-webkit-font-smoothing: subpixel-antialiased !important;}',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '5px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#51595e',
      red: '#e47e71',
      green: '#90cba6',
      yellow: '#f6c693',
      blue: '#8aa9d1',
      magenta: '#bf94c3',
      cyan: '#9edad6',
      white: '#94a1a8',
      lightBlack: '#7e898e',
      lightRed: '#f6819e',
      lightGreen: '#80b7a0',
      lightYellow: '#f9997e',
      lightBlue: '#97c3d3',
      lightMagenta: '#c5a2c0',
      lightCyan: '#b5ede6',
      lightWhite: '#c5c8c6'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '/usr/local/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'false',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyper-statusline',
    'hyperterm-cursor',
    'hyperterm-alternatescroll',
    'hyper-nobold',
    'hyper-tabs-enhanced'
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  }
};
