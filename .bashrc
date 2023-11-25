# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.pre.bash"
# bashrc


[ -n "$PS1" ] && source ~/.bash_profile;
GRC_ALIASES=true
[[ -s "/opt/homebrew/etc/profile.d/grc.sh" ]] && source /opt/homebrew/etc/grc.sh
alias g++='/opt/homebrew/bin/grc --colour=auto g++'
alias head='/opt/homebrew/bin/grc --colour=auto head'
alias make='/opt/homebrew/bin/grc --colour=auto make'
alias ld='/opt/homebrew/bin/grc --colour=auto ld'
alias ping6='/opt/homebrew/bin/grc --colour=auto ping6'
alias tail='/opt/homebrew/bin/grc --colour=auto tail'
alias traceroute6='/opt/homebrew/bin/grc --colour=auto traceroute6'
alias curl='/opt/homebrew/bin/grc --colour=auto curl'
alias df='/opt/homebrew/bin/grc --colour=auto df'
alias diff='/opt/homebrew/bin/grc --colour=auto diff'
alias dig='/opt/homebrew/bin/grc --colour=auto dig'
alias du='/opt/homebrew/bin/grc --colour=auto du'
alias env='/opt/homebrew/bin/grc --colour=auto env'
alias fdisk='/opt/homebrew/bin/grc --colour=auto fdisk'
alias gcc='/opt/homebrew/bin/grc --colour=auto gcc'
alias id='/opt/homebrew/bin/grc --colour=auto id'
alias ifconfig='/opt/homebrew/bin/grc --colour=auto ifconfig'
alias ip='/opt/homebrew/bin/grc --colour=auto ip'
alias last='/opt/homebrew/bin/grc --colour=auto last'
alias log='/opt/homebrew/bin/grc --colour=auto log'
alias lsof='/opt/homebrew/bin/grc --colour=auto lsof'
alias mount='/opt/homebrew/bin/grc --colour=auto mount'
alias mvn='/opt/homebrew/bin/grc --colour=auto mvn'
alias netstat='/opt/homebrew/bin/grc --colour=auto netstat'
alias nmap='/opt/homebrew/bin/grc --colour=auto nmap'
alias php='/opt/homebrew/bin/grc --colour=auto php'
alias ping='/opt/homebrew/bin/grc --colour=auto ping'
alias ps='/opt/homebrew/bin/grc --colour=auto ps'
alias pv='/opt/homebrew/bin/grc --colour=auto pv'
alias showmount='/opt/homebrew/bin/grc --colour=auto showmount'
alias stat='/opt/homebrew/bin/grc --colour=auto stat'
alias sysctl='/opt/homebrew/bin/grc --colour=auto sysctl'
alias tcpdump='/opt/homebrew/bin/grc --colour=auto tcpdump'
alias traceroute='/opt/homebrew/bin/grc --colour=auto traceroute'
alias ulimit='/opt/homebrew/bin/grc --colour=auto ulimit'
alias uptime='/opt/homebrew/bin/grc --colour=auto uptime'
alias whois='/opt/homebrew/bin/grc --colour=auto whois'


[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach
# Add this lines at the top of .bashrc:
# Add this line at the end of .bashrc:
[[ ${BLE_VERSION-} ]] && ble-attach
ble-face auto_complete='fg=gray'
bleopt complete_ambiguous=


bleopt prompt_ps1_transient=always:trim
#bleopt exec_restore_pipestatus=1
eval "$(zoxide init bash)"
eval "$(thefuck --alias)"
eval "$(/opt/homebrew/bin/brew shellenv)"

neofetch

[ -f ~/.inshellisense/key-bindings.bash ] && source ~/.inshellisense/key-bindings.bash

export RUST_BACKTRACE=1

export RUSTC_WRAPPER=~/.cargo/bin/sccache

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/bashrc.post.bash"
