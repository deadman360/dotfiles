# Environment Variables

# Java (JBang)
if test -d $HOME/.jbang/currentjdk
    set -gx JAVA_HOME $HOME/.jbang/currentjdk
end

# Android SDK
set -gx ANDROID_HOME $HOME/Android/Sdk

# SDKMAN
if test -d $HOME/.sdkman
    set -gx SDKMAN_DIR $HOME/.sdkman
end
