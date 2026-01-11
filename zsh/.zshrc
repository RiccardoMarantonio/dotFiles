export EDITOR=nvim
export VISUAL=nvim
export SCRIPTS=$HOME/dev/scripts
export BUN_INSTALL="$HOME/.bun"
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH=$ASPECTJ_HOME/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/aspectj1.9/bin:$PATH"
export MINTED_PYTHON=/opt/homebrew/bin/python3.12
export CLASSPATH=".:$HOME/.local/lib/bcel.jar"
export CLASSPATH=".:$HOME/aspectj1.9/lib/aspectjrt.jar"
# Add all subdirectories of $SCRIPTS to PATH
if [ -d "$SCRIPTS" ]; then
  for dir in $(find "$SCRIPTS" -type d); do
    PATH="$dir:$PATH"
  done
fi

export PATH
export PATH=/Users/riccardomarantonio/.opencode/bin:$PATH

# ######################
# #                    #
# #  CUSTOM FUNCTIONS  #
# #                    #
# ######################

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

function fd () {
  cd "$({find $HOME/.config -maxdepth 1 -type d -o -type l; find $HOME/dev -maxdepth 2 -type d; } | fzf)"
}


function tmuxInit() {
    if [ -z "$TMUX" ]; then
        t
    else
    fi
}

# ##############
# #            #
# #  KEYBINDS  #
# #            #
# ##############


alias t="tmux new-session -A -s main"
alias ls="eza --show-symlinks -a --tree --level=0  --icons --git"
alias nu="$HOME/.local/scripts/nvim-userconfig.sh"
alias nv='nvim'
alias aph="/Applications/JUCE/extras/AudioPluginHost/Builds/MacOSX/build/Debug/AudioPluginHost.app/Contents/MacOS/AudioPluginHost"
alias bi='selection=$((brew formulae; brew casks) | fzf --multi --height 40% --layout=reverse --border --prompt="Install> "); [ -n "$selection" ] && brew install $selection'
alias bu='selection=$((brew list --formula; brew list --cask) | fzf --multi --height 40% --layout=reverse --border --prompt="Uninstall> "); [ -n "$selection" ] && brew uninstall $selection'
alias zo='zed -r $({find $HOME/.config -maxdepth 1 -type d -o -type l; find $HOME/dev -maxdepth 2 -type d; } | fzf)'
alias ct='cd $(tmux run "echo '#{session_path}'")'
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -s "/Users/riccardomarantonio/.bun/_bun" ] && source "/Users/riccardomarantonio/.bun/_bun"

export STARSHIP_CONFIG=$HOME/.config/starship.toml
eval "$(starship init zsh)"
