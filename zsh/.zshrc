export EDITOR=nvim
export VISUAL=nvim


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
alias clearnvimswap="rm -rf ~/.local/state/nvim/swap"
alias clearnvimcache="rm -rf ~/.local/state/nvim"
alias asperite="/Users/riccardomarantonio/Documents/Coding/Playground/aseprite/build/bin/aseprite"
alias nu="$HOME/.local/scripts/nvim-userconfig.sh"
alias nv='nvim'
alias apl="/Applications/JUCE/extras/AudioPluginHost/Builds/MacOSX/build/Debug/AudioPluginHost.app/Contents/MacOS/AudioPluginHost"
bindkey -s ^f "tmuxSessionizer\n"
bindkey -s ^g "lazygit\n"


source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh



# opencode
export PATH=/Users/riccardomarantonio/.opencode/bin:$PATH

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/riccardomarantonio/.lmstudio/bin"
# End of LM Studio CLI section
#
#
#
# For OpenJDK installed via Homebrew
# export JAVA_HOME=/opt/homebrew/opt/openjdk@21
# OR for the latest version:
# export JAVA_HOME=/opt/homebrew/opt/openjdk
# export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
# Add to PATH
export PATH="$JAVA_HOME/bin:$PATH"
#
#
#

eval "$(oh-my-posh init zsh --config robbyrussell)"
eval "tmuxInit"

export PATH="$HOME/.local/bin:$PATH"
