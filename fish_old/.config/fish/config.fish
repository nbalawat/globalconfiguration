function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR $HOME/.nvm
nvm use default --silent
fish_vi_key_bindings

set -x PATH "$HOME/.cargo/bin"  "$PATH"
set -x PATH "$HOME/.cargo" "$PATH"
set -x PATH "$ES_HOME/bin" "$PATH"
set -x PATH "$JAVA_HOME/bin" "$PATH"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
