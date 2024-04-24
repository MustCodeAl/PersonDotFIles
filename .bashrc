# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.pre.bash"


#!/usr/bin/env bash


export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/ed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/libressl/bin:$PATH"

#export PATH="/opt/homebrew/opt/man-db/libexec/bin:$PATH"
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"


export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"



export CLICOLOR=1
export LESS="$LESS -R"
export LESSOPEN="|~/.lessfilter %s"
export LESSCOLORIZER="bat"
export MANPAGER="manpager | less --pattern=^\\S+"

if ! [[ $__CFBundleIdentifier == "com.googlecode.iterm2" || $__CFBundleIdentifier == "com.github.wez.wezterm" ]]; then
    # Bash-specific initialization
    unset MANPAGER
fi


export PYTHONDEBUG=1
export BETTER_EXCEPTIONS=1

export RUST_BACKTRACE=full

export CARGO_INCREMENTAL=0
export SCCACHE_ERROR_LOG=/tmp/sccache_log.txt 
export SCCACHE_DIRECT=true

export RUSTC_WRAPPER=sccache
export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache

#make ninja default for make
export CMAKE_GENERATOR=Ninja
export CMAKE_EXPORT_COMPILE_COMMANDS=1

export PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix krb5)/lib/pkgconfig:$(brew --prefix libedit)/lib/pkgconfig:$(brew --prefix libxml2)/lib/pkgconfig:$(brew --prefix openssl)/lib/pkgconfig"


export CFLAGS="${CFLAGS} -I$(brew --prefix)/include" 
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/include"
export LDFLAGS="${LDFLAGS} -L$(brew --prefix)/lib"

#export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"





#export FZF_BASE="/opt/homebrew/bin/fzf"
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


export VCPKG_ROOT="$HOME/vcpkg"


# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME="bobby"

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
#THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING="git@git.domain.com"

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT="irssi"

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# integrations
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  ##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW
  	test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi






eval "$(/opt/homebrew/bin/brew shellenv)"

#eval "$(starship init bash)"
eval "$(atuin init bash)"
eval "$(mise activate bash)"



ble-face auto_complete="fg=gray"
bleopt complete_ambiguous=""


bleopt prompt_ps1_transient="always:trim"

alias "g++"="/opt/homebrew/bin/grc --colour=auto g++"
alias head="/opt/homebrew/bin/grc --colour=auto head"
alias make="/opt/homebrew/bin/grc --colour=auto make"
alias ld="/opt/homebrew/bin/grc --colour=auto ld"
alias ping6="/opt/homebrew/bin/grc --colour=auto ping6"
alias tail="/opt/homebrew/bin/grc --colour=auto tail"
alias traceroute6="/opt/homebrew/bin/grc --colour=auto traceroute6"
alias curl="/opt/homebrew/bin/grc --colour=auto curl"
alias df="/opt/homebrew/bin/grc --colour=auto df"
alias diff="/opt/homebrew/bin/grc --colour=auto diff"
alias dig="/opt/homebrew/bin/grc --colour=auto dig"
alias du="/opt/homebrew/bin/grc --colour=auto du"
alias env="/opt/homebrew/bin/grc --colour=auto env"
alias fdisk="/opt/homebrew/bin/grc --colour=auto fdisk"
alias gcc="/opt/homebrew/bin/grc --colour=auto gcc"
alias id="/opt/homebrew/bin/grc --colour=auto id"
alias ifconfig="/opt/homebrew/bin/grc --colour=auto ifconfig"
alias ip="/opt/homebrew/bin/grc --colour=auto ip"
alias last="/opt/homebrew/bin/grc --colour=auto last"
alias log="/opt/homebrew/bin/grc --colour=auto log"
alias lsof="/opt/homebrew/bin/grc --colour=auto lsof"
alias mount="/opt/homebrew/bin/grc --colour=auto mount"
alias mvn="/opt/homebrew/bin/grc --colour=auto mvn"
alias netstat="/opt/homebrew/bin/grc --colour=auto netstat"
alias nmap="/opt/homebrew/bin/grc --colour=auto nmap"
alias php="/opt/homebrew/bin/grc --colour=auto php"
alias ping="/opt/homebrew/bin/grc --colour=auto ping"
alias ps="/opt/homebrew/bin/grc --colour=auto ps"
alias pv="/opt/homebrew/bin/grc --colour=auto pv"
alias showmount="/opt/homebrew/bin/grc --colour=auto showmount"
alias stat="/opt/homebrew/bin/grc --colour=auto stat"
alias sysctl="/opt/homebrew/bin/grc --colour=auto sysctl"
alias tcpdump="/opt/homebrew/bin/grc --colour=auto tcpdump"
alias tail="/opt/homebrew/bin/grc --colour=auto tail"
alias traceroute="/opt/homebrew/bin/grc --colour=auto traceroute"
alias ulimit="/opt/homebrew/bin/grc --colour=auto ulimit"
alias uptime="/opt/homebrew/bin/grc --colour=auto uptime"
alias whois="/opt/homebrew/bin/grc --colour=auto whois"


alias bashconfig="bash ~/.bashrc"



# Overwrite existing commands for better defaults
alias cp="cp -i"

alias mv="mv -i"
alias rm="rm -i"
alias rf="rm -ird"

alias mkdir="mkdir -p"
alias rmdir="rmdir -p"




alias csvutil="qsv"
alias ch="cht.sh"
alias code="code-insiders"
alias dox="sn0int"
alias hp="http-prompt"
alias int="interpreter"
alias listalias="als"
alias lte="eza --tree"
alias ltd="tldr -p linux"
alias lv="lnav"
alias sl="ls"


alias brc="cot ~/.bashrc"

update_mf() {
  local mf_file="$1"
  local prev_time_file="$2"
  local time_format="$3"

  # Check if the previous time exists and is different from the current time
  if [ "$(date +"$time_format")" != "$(cat "$prev_time_file" 2>/dev/null)" ]; then
    macchina >"$mf_file"
    date +"$time_format" >"$prev_time_file"
  fi

  # Output the contents of the file
  cat "$mf_file"
}
update_mf ~/.mf ~/.mf.prevweek "%U"

last_repository=""

check_directory_for_new_repository() {
	current_repository=$(git rev-parse --show-toplevel 2> /dev/null)
	
	if [ "$current_repository" ] && \
	   [ "$current_repository" != "$last_repository" ]; then
		onefetch
	fi
	last_repository=$current_repository
}
cd() {
	z "$@"
	check_directory_for_new_repository
}







# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.post.bash"
