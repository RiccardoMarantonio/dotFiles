export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
function nvconfig(){
  cd ~/.config/nvim
  nv .
}

function jmake ()
{
   cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1
   cp build/compile_commands.json .
}
function apr ()
{
  pkill AudioPluginHost
  open -a AudioPluginHost
}
function fd ()
{
  cd ~/Documents/
  fcd
}
function juceinit () {
    git clone --recursive https://github.com/Marantz01/JuceProjectTemplate .
    rm -rf .git readme.md
    git init

}

[ -s "/Users/riccardomarantonio/.bun/_bun" ] && source "/Users/riccardomarantonio/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"

export PATH="$HOME/.local/scripts:$PATH"
bindkey -s ^f "tmux-sessionizer\n"

log_dir() {
  builtin cd "$@" && {
    local path="${PWD/#$HOME/~}"
    echo "$path" >> ~/.dir_history
  }
}
alias cd=log_dir

cdhist() {
  if [[ ! -f ~/.dir_history ]]; then
    echo "No directory history found." >&2
    return 1
  fi

  local dir
  dir=$(tail -r ~/.dir_history | awk '!seen[$0]++' | fzf --reverse --prompt="Jump to dir > ")
  
  if [[ -n $dir && -d $dir ]]; then
    cd "$dir"
  else
    echo $dir
    echo "Invalid or no directory selected." >&2
  fi
}

# First unbind Zsh line-editor versions (optional but helpful)
bindkey -r '^l'   # Unbind Ctrl+L
bindkey -r '^h'   # Unbind Ctrl+H
bindkey -r '^a'   # Unbind Ctrl+A

# Now rebind your actions
bindkey -s '^a' 'cdhist\n'
bindkey -s '^h' 'cd ~\n'
bindkey -s '^l' 'clear\n'
