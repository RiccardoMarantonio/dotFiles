

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# In ~/.zshrc
precmd() { print '' }
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim

alias nv='nvim'

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
  cd "$(find ~/Documents/Coding ~/.config ~/.local ~/Documents/Università ~/dotFiles -mindepth 1 -type d | fzf)"
}

function juceinit () {
    git clone --recursive https://github.com/Marantz01/JuceProjectTemplate .
    rm -rf .git readme.md
    git init

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
bindkey -s ^f "~/.local/scripts/tmux-sessionizer\n"
# eval "$(starship init zsh)"
