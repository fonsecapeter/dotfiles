import sys
from colorama import (
    init as init_colorama,
    Fore as ColorFore,
    Style as ColorStyle
)
from IPython.terminal.prompts import Prompts, Token as IPythonToken

from pygments.style import Style
from pygments.token import (
    Keyword, Name, Comment, String, Error,
    Number, Operator, Text, Literal, Token
)

init_colorama()
c.TerminalIPythonApp.display_banner = True
py_version = '.'.join(
    map(str, sys.version_info[:3])
)
c.InteractiveShell.banner1 = "%s%s%s" % (
    ColorFore.BLUE,
    py_version,
    ColorStyle.RESET_ALL,
)

if (sys.version_info > (3, 0)):
    BRIGHT_BLUE = 'ansibrightblue'
    BRIGHT_CYAN = 'ansibrightcyan'
    BRIGHT_GREEN = 'ansibrightgreen'
    BRIGHT_MAGENTA = 'ansibrightmagenta'
    BRIGHT_RED = 'ansibrightred'
    BRIGHT_YELLOW = 'ansibrightyellow'
    YELLOW = 'ansiyellow'
    GRAY = 'ansigray'
else:
    BRIGHT_BLUE = '#97c3d3'
    BRIGHT_CYAN = '#b5ede6'
    BRIGHT_GREEN = '#90cba6'
    BRIGHT_MAGENTA = '#bf94c3'
    BRIGHT_RED = '#f6819e'
    BRIGHT_YELLOW = '#f9997e'
    YELLOW = '#f6c693'
    GRAY = '#7e898e'


class Shellectric(Style):
    # http://pygments.org/docs/styles/#creating-own-styles
    # http://pygments.org/docs/tokens/#name-tokens
    default_style = ""
    styles = {
        Text: BRIGHT_MAGENTA,
        Comment: GRAY,
        Keyword: BRIGHT_GREEN,
        Keyword.Constant: BRIGHT_CYAN,
        Keyword.Namespace: GRAY,
        Keyword.Pseudo: GRAY,
        Name.Builtin.Pseudo: GRAY,
        Name.Function: BRIGHT_CYAN,
        Name.Class: BRIGHT_CYAN,
        Name.Exception: BRIGHT_CYAN,
        Name.Decorator: BRIGHT_CYAN,
        String: BRIGHT_RED,
        Literal: BRIGHT_RED,
        Number: BRIGHT_BLUE,
        Operator: GRAY,
        Error: BRIGHT_YELLOW,
    }


overrides = {
    Token.Prompt: YELLOW,
    Token.PromptNum: BRIGHT_BLUE,
    Token.OutPrompt: YELLOW,
    Token.OutPromptNum: BRIGHT_BLUE,
    Token.Menu.Completions.Completion: BRIGHT_YELLOW,
    Token.Menu.Completions.Completion.Current: BRIGHT_YELLOW,
    Token.MatchingBracket.Other: BRIGHT_YELLOW,
}

c.TerminalInteractiveShell.highlighting_style = Shellectric
c.TerminalInteractiveShell.highlighting_style_overrides = overrides


class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(IPythonToken.Prompt, ' > ')]

    def out_prompt_tokens(self, cli=None):
        return [(IPythonToken.Prompt, ' < ')]

    def continuation_prompt_tokens(self, *args, **kwargs):
        return [(IPythonToken.Prompt, ' * ')]

    def rewrite_prompt_tokens(self, cli=None):
        return [(IPythonToken.Prompt, ' - ')]


c.TerminalInteractiveShell.prompts_class = MyPrompt

