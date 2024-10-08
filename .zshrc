
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# shellcheck disable=SC1072
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
ZSH_COMPDUMP=${ZSH_COMPDUMP:-${ZDOTDIR:-$HOME}/.zcompdump}

# cache .zcompdump for about a day
if [[ -n $(find "$ZSH_COMPDUMP" -mtime -1 2>/dev/null) ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
else
  compinit -i -d "$ZSH_COMPDUMP"
  touch "$ZSH_COMPDUMP"
fi

{
  #   compile .zcompdump
  if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
    zcompile "$ZSH_COMPDUMP"
  fi
} &! 

setopt COMBINING_CHARS
HISTSIZE=100000

# ########################################################################################################################
# environment variables
# ########################################################################################################################

# remove duplicat entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path



export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/ed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/libressl/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"





export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

export MODULAR_HOME="$HOME/.modular"
export VCPKG_ROOT="$HOME/vcpkg"
export ZSH_CACHE_DIR="$HOME/.cache/zshcache"

#---------------------------------------exports-----------------------------------------------#

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

#export PYTHONDEBUG=1
export BETTER_EXCEPTIONS=1

export SCCACHE_ERROR_LOG=/tmp/sccache_log.txt
export SCCACHE_DIRECT=true

export RUST_BACKTRACE=full
export CARGO_INCREMENTAL=0
export RUSTC_WRAPPER=sccache
export RUSTFLAGS="-C link-arg=-fuse-ld=lld ${RUSTFLAGS:-}"

export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache

#use as ninja default for make
export CMAKE_GENERATOR=Ninja
export CMAKE_EXPORT_COMPILE_COMMANDS=1

# force C colored diagnostic output
export CFLAGS="${CFLAGS} -fdiagnostics-color=always"
# force C++ colored diagnostic output
export CXXFLAGS="${CXXFLAGS} -fdiagnostics-color=always"
export CCFLAGS="${CCFLAGS} -fdiagnostics-color=always"
# force C, C++, Cpp (pre-processor) colored diagnostic output
export CPPFLAGS="${CPPFLAGS} -fdiagnostics-color=always"




#export LDFLAGS="${LDFLAGS} -fuse-ld=sold" # add to your .profile
#export LDFLAGS="${LDFLAGS} -fuse-ld=mold" # add to your .profile

export LDFLAGS="${LDFLAGS} -fuse-ld=lld" # add to your .profile


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/lib"
#export CPATH="${CPATH} -L/opt/homebrew/include"
#export CFLAGS="${CFLAGS} -I/opt/homebrew/include"

export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/include"
# only use these when necessary for building
#export CFLAGS="-O2 -arch $(uname -m)"



export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/bison/lib"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/postgresql@16/include"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/mysql-client/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/mysql-client/include"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/sqlite/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/flex/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/flex/include"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/libressl/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/libressl/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/libxslt/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/libxslt/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/binutils/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/binutils/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/bzip2/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/bzip2/include"



export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/llvm/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/curl/include"

export LDFLAGS="${LDFLAGS}} -L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/zlib/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/readline/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/openssl/include"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/openssl@1.1/include"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/openssl@3/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/libffi/include"



export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/ncurses/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/ncurses/include"








export PKG_CONFIG_PATH="/opt/homebrew/opt/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libressl/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ncurses/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/share/pkgconfig:$PKG_CONFIG_PATH"

#------------------------------------plugin exports-------------------------------------#

export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="\#*"

export CLICOLOR=1
export LESS="$LESS -R --use-color"
export LESSOPEN="|$HOME/.lessfilter %s"
export LESSCOLORIZER="bat"
export MANPAGER="~/.local/bin/manpager | less --pattern=^\\S+"

#lessc () { /usr/share/vim/vim90/macros/less.sh "$@"}

if ! [[ $__CFBundleIdentifier == "com.googlecode.iterm2" || $__CFBundleIdentifier == "com.github.wez.wezterm" || $__CFBundleIdentifier == "dev.warp.Warp-Stable" ]]; then
    # Bash-specific initialization
    unset MANPAGER
fi


export warhol_ignore_curl=1
export warhol_ignore_du=1
export warhol_ignore_df=1
export warhol_ignore_diff=1
export warhol_ignore_ls=1
export warhol_ignore_ps=1

export ZSH_LS_BACKEND=eza

export MISE_PYTHON_COMPILE=true

# ########################################################################################################################

# ########################################################################################################################
# sourcing and plugins
# ########################################################################################################################

### ANTIDOTE PLUGIN LOADING

# Determine the zsh plugins file based on the terminal program.
if [[ $TERM_PROGRAM == "WarpTerminal" ]]; then
  zsh_plugins=${ZDOTDIR:-~}/warp.zsh_plugins.zsh
else
  zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh
fi

# Ensure you have a corresponding .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
  (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
fi

source $zsh_plugins

export PATH="/usr/local/bin:$PATH"

# Integrations
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # Commands to disable for Warp - below
  autoload -Uz promptinit && promptinit && prompt powerlevel10k
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  # Commands to disable for Warp - above
  autoload -Uz async && async

fi

# Append a command directly
#zvm_after_init_commands+=(
#  'eval "$(atuin init zsh)"'
#)


# appearance





# ########################################################################################################################

# ########################################################################################################################
# binds
# ########################################################################################################################

# ########################################################################################################################

# #############################################[ Evals ]###########################################################

# ########################################################################################################################
# -------aliases---------
# ########################################################################################################################

# -------------------------------------replacements--------------------------#
alias aggregate="rs-aggregate"
alias cat="bat"
alias catn="bat --style=auto"
alias cloc="tokei"
alias curl="curlie"
alias df="duf"
alias du="dust"
alias diff="batdiff"
alias find="bfs"
alias grep="rga --color=auto"
alias egrep="rga -F"
alias hexadump="hexyl"
alias ps="procs"
alias timer="hyperfine"
alias top="btm --basic"
alias asdf="mise"

# -------------------------------------commands--------------------------#

# Overwrite existing commands for better defaults
alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias rf="rm -frd"

alias mkdir="mkdir -p"

alias rmdir="rmdir -p"

alias sudo="sudo "

# -------------------------------------utitlies--------------------------#



alias csvutil="qsv"
alias ch="cht.sh"

alias clang="grc --colour=auto --config=conf.gcc clang"
alias "clang++"="grc --colour=auto --config=conf.gcc clang++"
alias cpp="grc --colour=auto --config=conf.gcc cpp"

alias code="code-insiders"
alias dedupe="fclones group --cache . | fclones remove --priority newest"
alias dups="fclones group . | fclones remove --priority newest --dry-run 2>/dev/null"
alias dox="sn0int"
alias hp="http-prompt"
alias hgrep="fc -El 0 | rg"
alias int="interpreter"
alias listalias="als"
alias ltd="tldr -p linux"
alias lv="lnav"
alias sl="ls"
alias szrc="exec zsh" # better then sourcezing
alias wt="wezterm"
alias zplug="cot ~/.zsh_plugins.txt"
alias zpro="cot ~/.zprofile"
alias zrc="cot ~/.zshrc"

# ##########################################[Lazy Loading scripts ]###############################################################

# git repository greeter aka onefetch
last_repository=""

check_directory_for_new_repository() {
  current_repository=$(git rev-parse --show-toplevel 2>/dev/null)

  if [ "$current_repository" ] &&
    [ "$current_repository" != "$last_repository" ]; then
    onefetch
  fi
  last_repository=$current_repository
}
cd() {
  z "$@"
  check_directory_for_new_repository
}

lcd() {
  cd "$1" && la
}
mcd() {
  mkdir -p -- "$1" &&
    z "$1"
}
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

export PATH="$PATH:$HOME/.modular/bin"
