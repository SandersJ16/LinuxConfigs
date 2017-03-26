# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Enable 256 Color scheme for all terminals
if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

export NPM_CONFIG_PREFIX="/opt/npm/"

if [ -d "${NPM_CONFIG_PREFIX}" ]; then
  export PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"
fi

# Add RBENV to path and setup shims and autocomplete
export RBENV_ROOT="/opt/rbenv/"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# Add PHPENV to path and setup shims and autocomplete
export PHPENV_ROOT="/opt/phpenv/"

if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi

# Add PYENV to path and setup shims and autocomplete
export PYENV_ROOT="/opt/pyenv/"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/Code/bin" ] ; then
    PATH="$HOME/Code/bin:$PATH"
fi

export GIMP2_DIRECTORY="$HOME/.config/gimp"

