# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi






# .zshrc
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




#export NVM_DIR="$HOME/.nvm"


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi



# remove duplicat entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path



#export PATH="$(yarn global bin):$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


export ANTIDOTE_HOME="$HOME/.cache/antidote"
export ZSH_CACHE_DIR="$HOME/.cache/zshcache"


export LANG=en_US.UTF-8
# You don't strictly need this collation, but most technical people
# probably want C collation for sane results
export LC_COLLATE=C








export RUST_BACKTRACE=full

export CARGO_INCREMENTAL=0
export SCCACHE_ERROR_LOG=/tmp/sccache_log.txt
#export SCCACHE_LOG=debug

export RUSTC_WRAPPER=~/.cargo/bin/sccache
export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache




#export PYTHONSTARTUP=$HOME/.pythonstartup
#export PYTHONVERBOSE=1
export PYTHONDEBUG=1
export BETTER_EXCEPTIONS=1



export CLICOLOR=1
export LESS="$LESS -R"
export LESSOPEN='|~/.lessfilter %s'
export LESSCOLORIZER='bat'
#export BATPIPE='color'

export MANPAGER='manpager --theme=\"Monokai Extended\" --style=plain | less --pattern=^\\S+'






export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"
export VCPKG_ROOT="$HOME/vcpkg"




export FZF_BASE="/opt/homebrew/bin/fzf"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"







# git repository greeter
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
	builtin cd "$@"
	check_directory_for_new_repository
}


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
#source $HOME/.iterm2_shell_integration.zsh

#zstyle ':antidote:bundle' use-friendly-names 'yes'

# Append a command directly
zvm_after_init_commands+=(
    '_evalcache atuin init zsh'
    '[ -f /opt/homebrew/share/zsh-autopair/autopair.zsh ] && source /opt/homebrew/share/zsh-autopair/autopair.zsh'
)

#zvm_after_init_commands+=(
#    '_evalcache atuin init zsh'
#    '[ -f /opt/homebrew/share/zsh-autopair/autopair.zsh ] && source /opt/homebrew/share/zsh-autopair/autopair.zsh'
#    '[ -f ~/fzf-tab/fzf-tab.plugin.zsh ] && source ~/fzf-tab/fzf-tab.plugin.zsh'
#)




#ZSH_AUTOSUGGEST_STRATEGY=(completion match_prev_cmd history)
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="\#*"






# appearance
autoload -Uz promptinit && promptinit && prompt powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh





#source /opt/homebrew/etc/grc.zsh

source ~/zsh-help/help.plugin.zsh


# ########################################################################################################################






















# ########################################################################################################################
# binds
# ########################################################################################################################

ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE



# ########################################################################################################################






# ########################################################################################################################
# completion stuff
# ########################################################################################################################



# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}




# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # remember to use single quote here!!!

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'


# preview stuff with lesspiper
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'

# disable preview for options and subcommands
zstyle ':fzf-tab:complete:*:options' fzf-preview 
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview



# for killl give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'





# for env variables
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'


# homebrew competion
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'

# for man pagesf
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

# for tldr
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'



# for command completions
zstyle ':fzf-tab:complete:-command-:*' fzf-preview \ ¦ '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'




# for git completions it is an example. you can change it
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'
	
	




# for other completions
zstyle ':fzf-tab:user-expand:*' fzf-preview 'less ${(Q)word}'





FZF_TAB_GROUP_COLORS=(
    $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
)

zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS







# ########################################################################################################################





# ########################################################################################################################
# -------aliases---------
# ########################################################################################################################

_evalcache manpager
#_evalcache batpipe
_evalcache thefuck --alias FUCK
_evalcache direnv hook zsh
#_evalcache dircolors -b
lesspipe.sh | source /dev/stdin

# --------------------------------appearance-------------------------------#



alias cat="bat --paging=never"

alias lt="ls --tree"
alias sl='ls'
# Save from mistyping




# -------------------------------------commands--------------------------#
alias grep="rg --color=auto"
alias curl=curlie
alias find=fd
alias ps=procs


# Overwrite existing commands for better defaults
alias mv="mv -i"
# -i prompts before overwrite
alias mkdir="mkdir -p"
# -p make parent dirs as needed
alias df="df -h"
# -h prints human readable format


alias tldrl="tldr -p linux"


alias zshconfig="cot ~/.zshrc"
alias zshplugins="cot ~/.zsh_plugins.txt"
#alias log="/opt/homebrew/bin/grc --colour=auto log"




#macchina
[ "$(date +%j)" != "$(cat ~/.mf.prevtime 2>/dev/null)" ] && { macchina > ~/.mf; date +%j > ~/.mf.prevtime; cat ~/.mf; } || cat ~/.mf

# neofetch
#[ "$(date +%j)" != "$(cat ~/.nf.prevtime 2>/dev/null)" ] && { neofetch > ~/.nf; date +%j > ~/.nf.prevtime; cat ~/.nf; } || cat ~/.nf
# ########################################################################################################################





































alias code=code-insiders


PYENV_ROOT="${HOME}/.pyenv"
if [[ -d "$PYENV_ROOT}" ]]; then
  pyenv () {
    if ! (($path[(Ie)${PYENV_ROOT}/bin])); then
      path[1,0]="${PYENV_ROOT}/bin"
    fi
    eval "$(command pyenv init -)"
    pyenv "$@"
    unfunction pyenv
  }
else
  unset PYENV_ROOT
fi




# Add any commands which depend on conda here
lazy_conda_aliases=('python' 'conda')

load_conda() {
  for lazy_conda_alias in $lazy_conda_aliases
  do
    unalias $lazy_conda_alias
  done

  __conda_prefix="$HOME/.miniconda3" # Set your conda Location

  # >>> conda initialize >>>
  __conda_setup="$("$__conda_prefix/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "$__conda_prefix/etc/profile.d/conda.sh" ]; then
          . "$__conda_prefix/etc/profile.d/conda.sh"
      else
          export PATH="$__conda_prefix/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<

  unset __conda_prefix
  unfunction load_conda
}

for lazy_conda_alias in $lazy_conda_aliases
do
  alias $lazy_conda_alias="load_conda && $lazy_conda_alias"
done









# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"

