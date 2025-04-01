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
alias ls="eza -a --sort=extension --no-time --color=always --long --git --no-filesize --icons=always --no-user"
alias vi="nvim ."
alias cat="bat"
alias show="kitten icat"
alias cd="z"
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
# export PATH="$(/usr/libexec/java_home):$PATH"
export CLASSPATH=$CLASSPATH:$HOME/XML/xerces-2_12_2/xercesSamples.jar:$HOME/XML/xerces-2_12_2/xml-apis.jar:$HOME/XML/xerces-2_12_2/xercesImpl.jar:

# llvm for language server
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# for java
# export path and home for java's version control
export JAVA_HOME=$(/usr/libexec/java_home -v 21)
# export JAVA_HOME=/opt/homebrew/opt/openjdk@21
export PATH=$JAVA_HOME/bin:$PATH

# for C
# makes my local/include directory part of C's libs. Eg: #include <rand.h> is a valid include since rand.h is inside .local/include
export C_INCLUDE_PATH=/usr/local/include:
export C_INCLUDE_PATH=/opt/homebrew/include:$C_INCLUDE_PATH
export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH
export CPLUS_INCLUDE_PATH=/opt/homebrew/include:$CPLUS_INCLUDE_PATH

prueba() {
    nvim $HOME/prueba.c
}
# clang compilation with flags -> address sanitizer works different from gcc's address sanitizer
compile() {
    clang -fsanitize=address -Wall -pedantic -std=c99 -g "$@"
}

# for pampero.itba.edu.ar
pampero() {
    ssh jgarciavautrinraggi@pampero.itba.edu.ar
}
# compilation and execution of small C proyects in pampero
pgcc() {
    LOCAL_FILE="$1"
    REMOTE_USER="jgarciavautrinraggi"
    REMOTE_HOST="pampero.itba.edu.ar"
    REMOTE_PATH="/home/jgarciavautrinraggi/codigos-pi"
    FILE_NAME=$(basename "$LOCAL_FILE")
    COMPILE_CMD="gcc /home/jgarciavautrinraggi/codigos-pi/include/rand.c /home/jgarciavautrinraggi/codigos-pi/include/getline.c /home/jgarciavautrinraggi/codigos-pi/include/getnum.c -Wall -pedantic -std=c99 -g -fsanitize=address -lm $FILE_NAME"
    RUN_CMD="./a.out"

    echo "Copiando archivo a servidor..."
    scp "$LOCAL_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

    echo "Compilando y ejecutando en el servidor..."
    ssh -t "$REMOTE_USER@$REMOTE_HOST" "cd $REMOTE_PATH && $COMPILE_CMD && $RUN_CMD"
}


source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
