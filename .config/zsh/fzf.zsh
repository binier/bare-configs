# Setup fzf
# ---------
if [[ ! "$PATH" == */home/puser/.fzf/bin* ]]; then
  export PATH="$PATH:/home/puser/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/puser/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/puser/.fzf/shell/key-bindings.zsh"

