# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'

eval "$(zoxide init zsh)"
# personal preferences
alias rm="trash"
alias ls="eza --sort=extension --no-time --color=always --long --git --no-filesize --icons=always --no-user"
alias vi="nvim ."
alias cat="bat"
alias show="kitten icat"
alias cdi="zi"

# for current working proyect
alias cwp="z /Users/juaniraggio/workspace/Proyects/duolingo-for-programming"
alias itba="z /Users/juaniraggio/workspace/itbaworkspace/objetos/java-itba/ejercicios"

# for python
alias mkvenv='python3 -m venv venv && source venv/bin/activate'

# for emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# XML
export PATH="$HOME/XML/xercesSamples.jar:$PATH"
export PATH="$HOME/XML/xml-apis.jar:$PATH"
export PATH="$HOME/XML/xercesImpl.jar:$PATH"
export CLASSPATH=$CLASSPATH:$HOME/XML/xerces-2_12_2/xercesSamples.jar:$HOME/XML/xerces-2_12_2/xml-apis.jar:$HOME/XML/xerces-2_12_2/xercesImpl.jar:

# llvm for language server
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# for java
# export path and home for java's version control
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# for C
# makes my local/include directory part of C's libs. Eg: #include <rand.h> is a valid include since rand.h is inside .local/include
export C_INCLUDE_PATH=/usr/local/include:
export C_INCLUDE_PATH=/opt/homebrew/include:$C_INCLUDE_PATH
export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH
export CPLUS_INCLUDE_PATH=/opt/homebrew/include:$CPLUS_INCLUDE_PATH

# clang compilation with flags -> address sanitizer works different from gcc's address sanitizer
compile() {
    clang -fsanitize=address -Wall -pedantic -std=c99 -g "$@"
}

# Yazi setup
export EDITOR="nvim"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

