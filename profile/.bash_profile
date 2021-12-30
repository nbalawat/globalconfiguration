[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source "$HOME/.cargo/env"
export JAVA_HOME=`/usr/libexec/java_home -v 11`

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
