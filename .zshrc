# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi









# ########################################################################################################################
# environment variables
# ########################################################################################################################
export PATH="/opt/homebrew/opt/libgit2@1.6/bin:$PATH"

#MANROFFOPT="-c"
export MANPATH="/usr/local/man:$MANPATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


export MANPAGER="sh -c 'col -bx | bat --paging=always --theme=Dracula -l man --style=plain'"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export RUST_BACKTRACE=1
export RUSTC_WRAPPER=~/.cargo/bin/sccache
#export BATPIPE=color



#fpath=(~/zsh-completions/src $fpath)
#if type brew &>/dev/null; then
 # FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  #autoload -Uz compinit
  #compinit
#fi



#batman() {
#    BAT_THEME="Dracula" batman "$@"
 #   return $?
#}

FZF_TAB_GROUP_COLORS=(
    $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
)



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

# optional, greet also when opening shell directly in repository directory
# adds time to startup
check_directory_for_new_repository

# ########################################################################################################################













# ########################################################################################################################
# sourcing and plugins
# ########################################################################################################################

#source ~/zsh-async/async.zsh


# integrations
source ~/.iterm2_shell_integration.zsh
source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Append a command directly
zvm_after_init_commands+=(
    'eval "$(atuin init zsh)"'
    '[ -f /opt/homebrew/share/zsh-autopair/autopair.zsh ] && source /opt/homebrew/share/zsh-autopair/autopair.zsh'
    '[ -f ~/fzf-tab/fzf-tab.plugin.zsh ] && source ~/fzf-tab/fzf-tab.plugin.zsh'
)



#    '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'



# utilities
#source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-you-should-use/you-should-use.plugin.zsh




# appearance

#source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
source ~/hackerquote/hacker-quotes.plugin.zsh
source ~/mysqlcolorize/mysql-colorize.plugin.zsh
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

autoload -Uz compinit
compinit




# basic file preview for ls (you can replace with something more sophisticated than head)
#zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'
# set list-colors to enable filename colorizing
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'





# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"




# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true


# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false



# disable sort when completing options of any command
#zstyle ':completion:complete:*:options' sort false




# switch group using `,` and `.`

zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS


# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input


# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'



zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
  ¦ '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'
  
  
# this is an example
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'batman $word'
#now, they can work, because (\\|*/|)man can match them.


# it is an example. you can change it
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
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





# ########################################################################################################################







# ########################################################################################################################
# -------aliases---------
# ########################################################################################################################

[[ -s "/opt/homebrew/etc/grc.zsh" ]] && source /opt/homebrew/etc/grc.zsh

for cmd in g++ gas head make ld ping6 tail traceroute6 $( ls /opt/homebrew/share/grc/ ); do
  cmd="${cmd##*conf.}"
  type "${cmd}" >/dev/null 2>&1 && alias "${cmd}"="$( which grc ) --colour=auto ${cmd}"
done






# --------------------------------appearance-------------------------------#


alias cat="bat --paging=never --theme=Dracula"
alias -g -- --help="--help 2>&1 | bat --theme=OneHalfDark --language=help -pp"

alias ls="eza --icons --classify --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
alias l="ls --grid"
alias la="ls -a"
alias ll="eza -lah --icons"
alias lt="ls --tree"
alias sl='ls'
# Save from mistyping



# -------------------------------------commands--------------------------#
alias grep=rg
alias curl=curlie
alias find=fd
alias ps=procs
alias sudo="sudo "
# work around for grc


# Overwrite existing commands for better defaults
alias mv="mv -i"
# -i prompts before overwrite
alias mkdir="mkdir -p"
# -p make parent dirs as needed
alias df="df -h"
# -h prints human readable format

eval "$(thefuck --alias)"
alias tldrl="tldr -p linux" 


neofetch

# ########################################################################################################################

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

































[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion





# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
