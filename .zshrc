
# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"



# .zshrc
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
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

# ########################################################################################################################
# environment variables
# ########################################################################################################################



# remove duplicat entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path



export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

#export FPATH="~/eza/completions/zsh:$FPATH"





#For compilers to find readline you may need to set:
#  export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
#  export CPPFLAGS="-I/opt/homebrew/opt/readline/include"

#export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig"


export ANTIDOTE_HOME="$HOME/.cache/antidote"
export ZSH_CACHE_DIR="$HOME/.cache/zshcache"

export HOMEBREW_PREFIX=/opt/homebrew

#---------------------------------------exports-----------------------------------------------#


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi




export PYTHONDEBUG=1
export BETTER_EXCEPTIONS=1





export SCCACHE_ERROR_LOG=/tmp/sccache_log.txt


export RUST_BACKTRACE=full
export CARGO_INCREMENTAL=0
export RUSTC_WRAPPER=~/.cargo/bin/sccache

export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache



export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

export CFLAGS="-I$(brew --prefix)/include" 
export CPPFLAGS="-I/opt/homebrew/include"
export LDFLAGS="-L$(brew --prefix)/lib"




#export LDFLAGS="-L/opt/homebrew/lib"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/postgresql@16/include"


export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig:$PKG_CONFIG_PATH"

#export PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix krb5)/lib/pkgconfig:$(brew --prefix libedit)/lib/pkgconfig:$(brew --prefix libxml2)/lib/pkgconfig:$(brew --prefix openssl)/lib/pkgconfig:$(brew --prefix)/opt/mysql-client/lib/pkgconfig:/opt/homebrew/opt/readline/lib/pkgconfig:/opt/homebrew/opt/zlib/lib/pkgconfig:/opt/homebrew/opt/curl/lib/pkgconfig:/opt/homebrew/opt/openssl@3/lib/pkgconfig"











#------------------------------------plugin exports-------------------------------------#


export FZF_BASE="/opt/homebrew/bin/fzf"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"



export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="\#*"



export CLICOLOR=1
export LESS="$LESS -R"
export LESSOPEN='|~/.lessfilter %s'
export LESSCOLORIZER='bat'
export MANPAGER='manpager --style=plain | less --pattern=^\\S+'


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

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote)
autoload -Uz $fpath[-1]/antidote


# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
  (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
fi

source $zsh_plugins
####



# integrations
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
alias cloc="tokei"
alias curl="curlie"
alias cp="xcp"
alias df="duf"
alias du="dust"
alias diff="delta"
alias find="fd"
alias grep="rga --color=auto"
alias hexadump="hexyl"
alias ps="procs"
alias sed="sd"
alias timer="hyperfine"
alias top="btm"
alias uniq="huniq"

# -------------------------------------commands--------------------------#



# Overwrite existing commands for better defaults
alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias mkdir="mkdir -p"

# -------------------------------------utitlies--------------------------#

alias csvutil="qsv"
alias ch="cht.sh"
alias code="code-insiders"
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





# ##########################################[Lazy Loading scripts ]###############################################################



#macchina
[ "$(date +%j)" != "$(cat ~/.mf.prevtime 2>/dev/null)" ] && { macchina > ~/.mf; date +%j > ~/.mf.prevtime; cat --style=plain ~/.mf; } || cat --style=plain ~/.mf


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



# bun completions
#[ -s "/opt/homebrew/share/zsh/site-functions/_bun" ] && source "/opt/homebrew/share/zsh/site-functions/_bun"


#[ -s "/opt/homebrew/share/zsh/site-functions/_mise" ] && source "/opt/homebrew/share/zsh/site-functions/_mise"





# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"



