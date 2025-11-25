# CodeWhisperer pre block. Keep at the top of this file.
#[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

export OPENAI_API_KEY="ADD_YOUR_KEY_HERE"
export ANTHROPIC_API_KEY="ADD_YOUR_KEY_HERE"

# for devin
export WORKSPACE_BASE="$HOME/Documents/devin/workspace"

export SANDBOX_TYPE="exec"


# Added by Toolbox App

export PATH="$PATH:~/.local/bin"

export PATH="$PATH:~/Library/Application Support/JetBrains/Toolbox/scripts"

# CodeWhisperer post block. Keep at the bottom of this file.
#[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.post.zsh"

source ~/.orbstack/shell/init.zsh 2>/dev/null || :
