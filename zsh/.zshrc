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
    git clone --recursive https://github.com/Marantz01/JuceProjectTemplate .
    rm -rf .git readme.md
    git init

}

function tmuxSessionizer() {
  if [ -z "$TMUX" ]; then
      echo "Not in a tmux session."
      t
  else
    tmux display-popup -E -w 60% -h 30% "~/.local/scripts/tmux-sessionizer"
  fi
}

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
alias t="tmux new-session -A -s main"
alias nv='nvim'
bindkey -s ^f "tmuxSessionizer\n"
bindkey -s ^g "lazygit\n"


source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(oh-my-posh init zsh --config robbyrussell)"
eval "tmuxInit"

