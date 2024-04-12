
# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# .zshrc
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
ZSH_COMPDUMP=${ZSH_COMPDUMP:-${ZDOTDIR:-~}/.zcompdump}

# cache .zcompdump for about a day
if [[ $ZSH_COMPDUMP('#qNmh-20') ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
else
  compinit -i -d "$ZSH_COMPDUMP"; touch "$ZSH_COMPDUMP"
fi
{
  # compile .zcompdump
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



export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export PATH="/opt/homebrew/opt/ed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/file-formula/bin:$PATH"
export PATH="/opt/homebrew/opt/m4/bin:$PATH"
export PATH="/opt/homebrew/opt/flex/bin:$PATH"
export PATH="/opt/homebrew/opt/libressl/bin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"



export MODULAR_HOME="$HOME/.modular"
export VCPKG_ROOT="$HOME/vcpkg"
export LIBRARY_PATH="/opt/homebrew/opt/lib:$LIBRARY_PATH"
export ZSH_CACHE_DIR="$HOME/.cache/zshcache"



#---------------------------------------exports-----------------------------------------------#


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi




export PYTHONDEBUG=1
export BETTER_EXCEPTIONS=1





export SCCACHE_ERROR_LOG=/tmp/sccache_log.txt
export SCCACHE_DIRECT=true

export RUST_BACKTRACE=full
export CARGO_INCREMENTAL=0
export RUSTC_WRAPPER=sccache

export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache


#make ninja default for make
export CMAKE_GENERATOR=Ninja
export CMAKE_EXPORT_COMPILE_COMMANDS=1




# force C colored diagnostic output
export CFLAGS="${CFLAGS} -fdiagnostics-color=always"
# force C++ colored diagnostic output
export CXXFLAGS="${CXXFLAGS} -fdiagnostics-color=always"
export CCFLAGS="${CCFLAGS} -fdiagnostics-color=always"
# force C, C++, Cpp (pre-processor) colored diagnostic output
export CPPFLAGS="${CPPFLAGS} -fdiagnostics-color=always"



export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/bison/lib"
  
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/lib"
export CFLAGS="${CFLAGS} -I/opt/homebrew/include" 
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/include"


export CFLAGS="${CFLAGS} -I/opt/homebrew/opt/zlib/include"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/zlib/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/openssl/lib"
export CFLAGS="${CFLAGS} -I/opt/homebrew/opt/openssl/include"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/openssl/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/postgresql@16/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/mysql-client/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/mysql-client/include"



export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/sqlite/include"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/curl/include"


export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/flex/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/flex/include"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/libressl/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/libressl/include"



export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/binutils/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/binutils/include"


export PKG_CONFIG_PATH="/opt/homebrew/opt/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libressl/lib/pkgconfig:$PKG_CONFIG_PATH"









#------------------------------------plugin exports-------------------------------------#





export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="\#*"



export CLICOLOR=1
export LESS="$LESS -R"
export LESSOPEN="|~/.lessfilter %s"
export LESSCOLORIZER="bat"
export MANPAGER="manpager | less --pattern=^\\S+"


export warhol_ignore_curl=1
export warhol_ignore_du=1
export warhol_ignore_df=1
export warhol_ignore_diff=1
export warhol_ignore_ls=1
export warhol_ignore_ps=1





# ########################################################################################################################













# ########################################################################################################################
# sourcing and plugins
# ########################################################################################################################




### ANTIDOTE PLUGIN LOADING


# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
  (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
fi

source $zsh_plugins
####


source $HOME/.iterm2_shell_integration.zsh


# Append a command directly
zvm_after_init_commands+=(
    'eval "$(atuin init zsh)"'
)









# appearance
autoload -Uz promptinit && promptinit && prompt powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh





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


# -------------------------------------fun--------------------------#



# ##########################################[Lazy Loading scripts ]###############################################################


#macchina
[ "$(date +%j)" != "$(cat ~/.mf.prevtime 2>/dev/null)" ] && { macchina > ~/.mf; date +%j > ~/.mf.prevtime; cat ~/.mf; } || cat ~/.mf


# git repository greeter aka onefetch
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

lcd() {
        cd $1 && la
}
mcd (){
    mkdir -p -- "$1" &&
    z "$1"
}




# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
