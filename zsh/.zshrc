export EDITOR=nvim
export VISUAL=nvim


# ######################
# #                    #
# #  CUSTOM FUNCTIONS  #
# #                    #
# ######################
function fh(){
    cat ~/.zsh_history | fzf --multi --height 40% --layout=reverse --border 
}
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function nvconfig(){
  cd ~/.config/nvim/
  nv
}



function fd ()
{
  cd "$({find ~/.config -maxdepth 1 -type d -o -type l; find ~/Projects -maxdepth 2 -type d } | fzf)"
}

function fv ()
{
  cd "$({find ~/.config -maxdepth 1 -type d -o -type l; find ~/Projects -maxdepth 2 -type d } | fzf)"
  nv
}

function juceinit () {
    git clone --recursive https://github.com/marantz-dev/JuceProjectTemplate .
    rm -rf .git readme.md
    git init

}

function javainit () {
    git clone --recursive https://github.com/marantz-dev/JavaPlaygroundTemplate .
    rm -rf .git readme.md
    git init
    gradle build 
    gradle run
}

function tmuxSessionizer() {
  if [ -z "$TMUX" ]; then
      echo "Not in a tmux session."
      t
  else
    tmux display-popup -E -w 60% -h 30% "~/.local/scripts/tmux-sessionizer"
  fi
}

alias t="tmux new-session -A -s main"
function tmuxInit(){
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


alias ls="eza --show-symlinks -a --tree --level=0  --icons --git"
alias nu="$HOME/.local/scripts/nvim-userconfig.sh"
alias nv='nvim'
alias aph="/Applications/JUCE/extras/AudioPluginHost/Builds/MacOSX/build/Debug/AudioPluginHost.app/Contents/MacOS/AudioPluginHost"
alias bi='selection=$((brew formulae; brew casks) | fzf --multi --height 40% --layout=reverse --border --prompt="Install> "); \
[ -n "$selection" ] && brew install $selection'
alias bu='selection=$((brew list --formula; brew list --cask) | fzf --multi --height 40% --layout=reverse --border --prompt="Uninstall> "); \
[ -n "$selection" ] && brew uninstall $selection'


source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

export CLASSPATH="$CLASSPATH:$HOME/.local/lib/bcel.jar"

eval "$(oh-my-posh init zsh --config robbyrussell)"
eval "tmuxInit"

export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/riccardomarantonio/.bun/_bun" ] && source "/Users/riccardomarantonio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/Users/riccardomarantonio/.opencode/bin:$PATH
