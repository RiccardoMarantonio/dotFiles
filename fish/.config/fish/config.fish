fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx SCRIPTS $HOME/dev/scripts
set -gx BUN_INSTALL $HOME/.bun
set -gx JAVA_HOME /opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home

set -gx ANTLR4_JAR $HOME/.local/lib/antlr-runtime-4.13.2.jar
set -gx MINTED_PYTHON /opt/homebrew/bin/python3.12
set -gx STARSHIP_CONFIG $HOME/.config/starship.toml

set -gx CLASSPATH .:$HOME/.local/lib/bcel.jar:$HOME/aspectj1.9/lib/aspectjrt.jar

fish_add_path $JAVA_HOME/bin
fish_add_path ~/.local/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path ~/.opencode/bin
fish_add_path ~/aspectj1.9/bin

fish_add_path $SCRIPTS/bin

set -g fish_greeting ""

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    if set cwd (cat $tmp); and test -n "$cwd"; and test "$cwd" != "$PWD"
        cd $cwd
    end
    rm -f $tmp
end

function fd
    cd (string join \n \
        (find $HOME/.config -maxdepth 1 \( -type d -o -type l \)) \
        (find $HOME/dev -maxdepth 2 -type d) \
        | fzf)
end

function bi
    set selection (begin; brew formulae; brew casks; end \
        | fzf --multi --height 40% --layout=reverse --border --prompt="Install> ")
    if test -n "$selection"
        brew install $selection
    end
end

function bu
    set selection (begin; brew list --formula; brew list --cask; end \
        | fzf --multi --height 40% --layout=reverse --border --prompt="Uninstall> ")
    if test -n "$selection"
        brew uninstall $selection
    end
end

# Set up fzf key bindings
fzf --fish | source

alias t="tmux new-session -A -s main"
alias nv="nvim"

alias aph="/Applications/JUCE/extras/AudioPluginHost/Builds/MacOSX/build/Debug/AudioPluginHost.app/Contents/MacOS/AudioPluginHost"
starship init fish | source
fish_vi_key_bindings
set -g fish_cursor_default     block      blink
set -g fish_cursor_insert      line       blink
set -g fish_cursor_replace_one underscore blink
set -g fish_cursor_visual      block


# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/riccardomarantonio/.lmstudio/bin
# End of LM Studio CLI section

