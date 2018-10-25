// See https://hyper.is#cfg for all currently supported options.
const colors = {
  black: "#51595e",
  red: "#e47e71",
  green: "#90cba6",
  yellow: "#f6c693",
  blue: "#8aa9d1",
  magenta: "#bf94c3",
  cyan: "#9edad6",
  white: "#94a1a8",
  lightBlack: "#7e898e",
  lightRed: "#f6819e",
  lightGreen: "#80b7a0",
  lightYellow: "#f9997e",
  lightBlue: "#97c3d3",
  lightMagenta: "#c5a2c0",
  lightCyan: "#b5ede6",
  lightWhite: "#c5c8c6"
};
const otherColors = {
  camel: "#f5e6c2",
  backgroundColor: "#464d51",
  cursorColor: "#4ea37e",
  selectionColor: "rgba(196, 161, 191, 0.5)"
};
const UIConstants = {
  navHeight: "28px",
  font: '"Brass Mono"'
};

module.exports = {
  config: {
    updateChannel: "canary",
    shell: "zsh",
    shellArgs: ["--login"],
    fontSize: 11,
    fontFamily: UIConstants.font,
    fontWeight: "400",
    fontWeightBold: "700",
    uiFontFamily: UIConstants.font,
    cursorShape: "BLOCK",
    cursorBlink: true,
    cursorColor: otherColors.cursorColor,
    foregroundColor: otherColors.camel,
    backgroundColor: otherColors.backgroundColor,
    borderColor: otherColors.backgroundColor,
    selectionColor: otherColors.selectionColor,

    padding: "12px",
    colors: colors,

    css: `
      footer.footer_footer {
        font-family: ${UIConstants.font};
        font-size: 10px;
        background-color: ${otherColors.backgroundColor};
      }
      footer.footer_footer .footer_group {
        color: white;
      }
      header {
        font-family: ${UIConstants.font};
        border: none;
      }
      header.header_header {
        top: 0;
        left: 0;
        width: 100%;
      }
      nav.tabs_nav {
        height: ${UIConstants.navHeight};
        line-height: ${UIConstants.navHeight};
      }
      ul.tabs_list {
        max-height: ${UIConstants.navHeight};
        background: ${colors.black};
      }
      div.terms_terms {
        margin-top: ${UIConstants.navHeight};
      }
      .tab_hasActivity {
        color: ${colors.camel};
      }
      .tab_active {
        background: ${otherColors.backgroundColor};
      }
      .tab_tab {
        border: none;
      }
    `,
    termCSS: "",

    env: {},
    bell: false,
    copyOnSelect: false,
    showHamburgerMenu: "",
    showWindowControls: "",

    // Plugins
    hyperStatusLine: {
      footerTransparent: false,
      dirtyColor: colors.yellow,
      aheadColor: colors.magenta
    },

    tabIcons: {
      processNameRegex: /^([\w\-]+)/, // first word
      mapIcons: {
        atom: ["atom", "apm"],
        bq: ["ag", "grep", "search"],
        git: ["git", "gs", "gl", "gr"],
        python: ["py", "python", "django", "ipython"],
        ruby: ["rb", "pry", "rake", "irb", "ruby", "rake"],
        make: ["make", "remake", "work-up"]
      },
      mapColors: {
        ag: colors.green,
        grep: colors.green,
        search: colors.green,
        apm: colors.lightGreen,
        atom: colors.lightGreen,
        bash: colors.lightMagenta,
        zsh: colors.green,
        git: colors.red,
        gs: colors.red,
        gl: colors.red,
        gr: colors.red,
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
        "docker-compose": colors.lightBlue,
        npm: colors.red,
        node: colors.lightGreen,
        grunt: colors.yellow,
        http: colors.yellow,
        curl: colors.yellow,
        vi: colors.green,
        vim: colors.green,
        make: colors.yellow,
        remake: colors.yellow,
        "work-up": colors.cyan
      }
    }
  },

  plugins: [
    "hyper-statusline",
    "hyperterm-cursor",
    "hyperterm-alternatescroll",
    "hyper-nobold",
    "hyper-tab-icons",
    "hypercwd",
    "hyper-search",
    "hyper-font-smoothing"
  ],
  localPlugins: [],
  keymaps: {}
};
