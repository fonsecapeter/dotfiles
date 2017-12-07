// See https://hyper.is#cfg for all currently supported options.
const colors = {
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
}
const otherColors = {
  camel: '#f5e6c2',
  darkBlack: '#393f49'
}

module.exports = {
  config: {
    // Choose either "stable" for receiving highly polished,
    // or "canary" for less polished but more frequent updates
    updateChannel: 'stable',
    shell: '/usr/local/bin/zsh',
    shellArgs: ['--login'],
    fontSize: 12,
    fontFamily: '"Peter Mono"',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',
    cursorBlink: true,
    cursorColor: '#4ea37e',
    foregroundColor: otherColors.camel,
    backgroundColor: '#464d51',
    borderColor: otherColors.darkBlack,

    padding: '5px',
    colors: colors,

    // UI
    css: `
      .hyper_main {
        border: none;
      }
      footer.footer_footer {
        font-family: "Peter Mono";
        -webkit-font-smoothing: subpixel-antialiased;
        font-size: 10px;
        background-color: ${otherColors.darkBlack};
      }
      footer.footer_footer .footer_group {
        color: white;
      }
      header {
        font-family: "Peter Mono";
        -webkit-font-smoothing: subpixel-antialiased;
        background: ${otherColors.darkBlack};
        border: none;
      }
      header.header_i1rech {
        top: 0;
        left: 0;
        width: 100%;
      }
      ul.tabs_list > li.tab_tab: {
        border: none !important;
      }
      .tab_hasActivity {
        color: ${otherColors.camel};
      }
      .tab_active {
        background: #40484d;
      }
    `,

    // Syntax
    termCSS: `
      x-screen {
        -webkit-font-smoothing: subpixel-antialiased !important;
      }
    `,

    env: {},
    bell: false,
    copyOnSelect: false,
    showHamburgerMenu: '',
    showWindowControls: '',

    // Plugins
    hyperStatusLine: {
      footerTransparent: false,
      dirtyColor: colors.yellow,
      aheadColor: colors.magenta
    },

    tabIcons: {
      processNameRegex: /^([\w\-]+)/,  // first word
      mapIcons: {
        python: [
          'py',
          'python',
          'django',
          'ipython'
        ],
        ruby: [
          'rb',
          'pry',
          'rake',
          'irb',
          'ruby',
          'rake'
        ],
        make: [
          'make',
          'work-up'
        ]
      },
      mapColors: {
        bash: colors.lightMagenta,
        zsh: colors.blue,
        git: colors.red,
        py: colors.blue,
        python: colors.blue,
        ipython: colors.blue,
        django: colors.blue,
        rb: colors.red,
        pry: colors.red,
        rake: colors.red,
        irb: colors.red,
        ruby: colors.red,
        rails: colors.red,
        docker: colors.lightBlue,
        npm: colors.red,
        node: colors.lightGreen,
        grunt: colors.yellow,
        http: colors.yellow,
        curl: colors.yellow,
        make: 'white',
        'work-up': colors.cyan
      }
    }
  },

  plugins: [
    'hyper-statusline',
    'hyperterm-cursor',
    'hyperterm-alternatescroll',
    'hyper-nobold',
    'hyper-tab-icons',
    'hypercwd'
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
