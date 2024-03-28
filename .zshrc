
# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"



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
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"





export ZSH_CACHE_DIR="$HOME/.cache/zshcache"

export HOMEBREW_PREFIX=/opt/homebrew

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
export RUSTC_WRAPPER=~/.cargo/bin/sccache
#export RUSTC_WRAPPER=sccache

export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache

#make ninja default for make
export CMAKE_GENERATOR=Ninja


# force C colored diagnostic output
export CFLAGS="${CFLAGS} -fdiagnostics-color=always"
# force C++ colored diagnostic output
export CXXFLAGS="${CXXFLAGS} -fdiagnostics-color=always"
export CCFLAGS="${CCFLAGS} -fdiagnostics-color=always"
# force C, C++, Cpp (pre-processor) colored diagnostic output
export CPPFLAGS="${CPPFLAGS} -fdiagnostics-color=always"



export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

export CFLAGS="-I/opt/homebrew/include" 
export CPPFLAGS="-I/opt/homebrew/include"
export LDFLAGS="-L/opt/homebrew/lib"

export CFLAGS="${CFLAGS} -I$(brew --prefix openssl)/include"
export CFLAGS="${CFLAGS} -I$(brew --prefix openssl)/include"
export LDFLAGS="${LDFLAGS} -L$(brew --prefix openssl)/lib"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix openssl)/include"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix zlib)/include"


#export SONAR_HOME=/opt/homebrew/Cellar/sonarqube/10.4.1.88267/libexec
#export SONAR=$SONAR_HOME/bin 
#export PATH=$SONAR:$PATH

#export LDFLAGS="-L/opt/homebrew/lib"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/postgresql@16/include"
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/mysql-client/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/mysql-client/include"
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/sqlite/include"


export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"

export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"

#For compilers to find readline you may need to set:
#  export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
#  export CPPFLAGS="-I/opt/homebrew/opt/readline/include"

#export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig"

export VCPKG_ROOT="$HOME/vcpkg"


#export PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix krb5)/lib/pkgconfig:$(brew --prefix libedit)/lib/pkgconfig:$(brew --prefix libxml2)/lib/pkgconfig:$(brew --prefix openssl)/lib/pkgconfig:$(brew --prefix)/opt/mysql-client/lib/pkgconfig:/opt/homebrew/opt/readline/lib/pkgconfig:/opt/homebrew/opt/zlib/lib/pkgconfig:/opt/homebrew/opt/curl/lib/pkgconfig:/opt/homebrew/opt/openssl@3/lib/pkgconfig"




#------------------------------------plugin exports-------------------------------------#


export FZF_BASE="/opt/homebrew/bin/fzf"
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"



export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="\#*"



export CLICOLOR=1
export LESS="$LESS -R"
export LESSOPEN="|~/.lessfilter %s"
export LESSCOLORIZER="bat"
export MANPAGER="manpager | less --pattern=^\\S+"

#export LSCOLORS=""

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



# integrations
#if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
#fi

source $HOME/.iterm2_shell_integration.zsh


# Append a command directly
zvm_after_init_commands+=(
    'eval "$(atuin init zsh)"'
)









# appearance
autoload -Uz promptinit && promptinit && prompt powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh





# ########################################################################################################################






















# ########################################################################################################################
# binds
# ########################################################################################################################

# ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
# ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
# ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE



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
# alias cp="xcp"
alias df="duf"
alias du="dust"
alias diff="batdiff"
alias find="fd"
alias grep="rga --color=auto"
alias egrep="rga -F"
alias hexadump="hexyl"
alias ps="procs"
alias prettier="prettybat"
# alias sed="sd"
alias timer="hyperfine"
alias top="btm --basic"
alias uniq="huniq"


# -------------------------------------commands--------------------------#



# Overwrite existing commands for better defaults
alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias rf="rm -ird"

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
alias int="interpreter"
alias listalias="als"
alias lte="ls --tree"
alias ltd="tldr -p linux"
alias lv="lnav"
alias sl="ls"
alias szrc="source ~/.zshrc"
alias wt="wezterm"
alias zplug="cot ~/.zsh_plugins.txt"
alias zpro="cot ~/.zprofile"
alias zrc="cot ~/.zshrc"


# -------------------------------------fun--------------------------#

alias wtf="dmesg"
#alias onoz="cat /var/log/errors.log"
alias rtfm="man"

alias :3="echo"
alias anoy="yes"
alias visible="echo"
alias invisible="cat"
alias moar="more"
alias alwayz="tail -f"

alias hai="cd"
alias iz="ls"
alias plz="pwd"
#alias ihasbucket='df -h'

alias inur="locate"
alias iminurbase="finger"

alias btw="nice"
alias obtw="nohup"

alias nomz="ps aux"
alias nomnom="killall"

alias byes="exit"
alias cya="reboot"
alias kthxbai="halt"

alias pwned="ssh"

# ##########################################[Lazy Loading scripts ]###############################################################


#macchina
[ "$(date +%j)" != "$(cat ~/.mf.prevtime 2>/dev/null)" ] && { macchina > ~/.mf; date +%j > ~/.mf.prevtime; cat ~/.mf; } || cat ~/.mf


# git repository greeter aka onefetch
last_repository=
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


mcd (){
    mkdir -p -- "$1" &&
    z "$1"
}

#
## Add any commands which depend on conda here
##lazy_conda_aliases=('python' 'conda')
#
#load_conda() {
#  for lazy_conda_alias in $lazy_conda_aliases
#  do
#    unalias $lazy_conda_alias
#  done
#
#  __conda_prefix="/opt/homebrew/Caskroom/miniconda/base" # Set your conda Location
##  __conda_prefix="$HOME/.miniconda3" # Set your conda Location
#
#  # >>> conda initialize >>>
#  __conda_setup="$("$__conda_prefix/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
#  if [ $? -eq 0 ]; then
#      eval "$__conda_setup"
#  else
#      if [ -f "$__conda_prefix/etc/profile.d/conda.sh" ]; then
## . "$__conda_prefix/etc/profile.d/conda.sh"  # commented out by conda initialize
#      else
#          export PATH="$__conda_prefix/bin:$PATH"
#      fi
#  fi
#  unset __conda_setup
#  # <<< conda initialize <<<
#
#  unset __conda_prefix
#  unfunction load_conda
#}
#
#for lazy_conda_alias in $lazy_conda_aliases
#do
#  alias $lazy_conda_alias="load_conda && $lazy_conda_alias"
#done




# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
