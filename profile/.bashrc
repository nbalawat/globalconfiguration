set -o vi
source "$HOME/.cargo/env"
export ES_HOME=~/softwarelocal/elasticsearch-5.6.0
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_77/Contents/Home
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
