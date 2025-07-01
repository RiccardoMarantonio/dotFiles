export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# In ~/.zshrc
precmd() { print '' }
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval $(thefuck --alias)
alias nv='nvim'

# ###############
# #             #
# #  FZF STUFF  #
# #             #
# ###############

alias fo='fzf | xargs open'  # fzf open
alias fcd='cd "$(find . -type d | fzf)"'  # fzf cd
alias fv='nvim $(fzf)'  # fzf vim
alias fvs='code $(fzf)'  # fzf vscode

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

function jmake ()
{
   cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1
   cp build/compile_commands.json .
}
function fd ()
{
  cd "$(find ~/Documents/Coding ~/.config ~/.local ~/Documents/Università -mindepth 1 -type d | fzf)"
}
function juceinit () {
    git clone --recursive https://github.com/Marantz01/JuceProjectTemplate .
    rm -rf .git readme.md
    git init

}

[ -s "/Users/riccardomarantonio/.bun/_bun" ] && source "/Users/riccardomarantonio/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# ##############
# #            #
# #  KEYBINDS  #
# #            #
# ##############


alias ls="eza --show-symlinks -a --tree --level=0  --icons --git"
alias clearnvimswap="rm -rf ~/.local/state/nvim/swap"
alias clearnvimcache="rm -rf ~/.local/state/nvim"
alias asperite="/Users/riccardomarantonio/Documents/Coding/Playground/aseprite/build/bin/aseprite"



# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/riccardomarantonio/.lmstudio/bin"
# End of LM Studio CLI section

