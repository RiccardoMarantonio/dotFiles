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
  cd "$(find ~/Documents/Coding ~/.config ~/.local ~/Documents/Università ~/dotFiles -mindepth 1 -type d | fzf)"
}

function fw() {
  # Pick a project directory
  selected_dir=$(find ~/Documents/Coding ~/.config ~/.local ~/Documents/Università ~/dotFiles -mindepth 1 -type d | fzf)

  if [[ -z "$selected_dir" ]]; then
    echo "No directory selected. Exiting."
    return 1
  fi

  # Create new session config
  sed -e "s|/Users/riccardomarantonio|$selected_dir|" \
      -e "s|default|BANANAA|" \
      "$HOME/.warp/launch_configurations/default.yaml" \
      > "$HOME/.warp/launch_configurations/session.yaml"

  # Launch new Warp session in background after a short delay
  (sleep 1 && open -a "Warp" --args --launch-config "$HOME/.warp/launch_configurations/session.yaml") &

  # Quit current Warp app (including this window)
  osascript -e 'tell application "Warp" to quit'
}
function juceinit () {
    git clone --recursive https://github.com/Marantz01/JuceProjectTemplate .
    rm -rf .git readme.md
    git init

}
function zl() {
  zellij --layout ~/.config/zellij/layouts/session.kdl
  zellij action go-to-previous-tab
  zellij action close-tab
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

function type_zellij_sessionizer_command() {
  LBUFFER="~/.scripts/zellij-sessionizer.sh"
  zle accept-line
}
zle -N type_zellij_sessionizer_command
bindkey '^f' type_zellij_sessionizer_command


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/riccardomarantonio/.lmstudio/bin"
# End of LM Studio CLI section
