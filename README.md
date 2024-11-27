# Tracking my `.`s

## Run on new computer
  - First set up [ssh for GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
    - manually copy `dot/ssh/config` to `~/.ssh/config` and update as needed
  - Clone this repo `git clone git@github.com:fonsecapeter/dotfiles.git`
  - Run `./bin/init/osx` or `ubuntu`
    - `from_flash_drive/` is meant to be run from a snapshot of this repo that
    lives on a flash drive
    - all scripts in `/bin` are idempotent

## Repo layout
- Dotfiles are in `dot/`
  - this will be symlinked to the right places
- Script executables are in `bin/`
- Source code for scripts in `src/`
  - Most updates to this repo will happen here
