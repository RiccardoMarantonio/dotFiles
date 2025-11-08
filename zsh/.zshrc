export EDITOR=nvim
export VISUAL=nvim
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
export SCRIPTS=$HOME/.local/scripts
export CLASSPATH="$CLASSPATH:$HOME/.local/lib/javassist.jar"
export ASPECTJ_HOME=$HOME/.local/lib
export PATH=$ASPECTJ_HOME/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=/Users/riccardomarantonio/.opencode/bin:$PATH
export PATH="$HOME/.local/scripts/tmux:$PATH"

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
  cd "$({find $HOME/.config -maxdepth 1 -type d -o -type l; find $HOME/Projects -maxdepth 2 -type d; find $HOME/.local/scripts  -maxdepth 2 -type d -o -type l} | fzf)"
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

alias z="zed"


source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh



eval "$(oh-my-posh init zsh --config robbyrussell)"

[ -s "/Users/riccardomarantonio/.bun/_bun" ] && source "/Users/riccardomarantonio/.bun/_bun"



