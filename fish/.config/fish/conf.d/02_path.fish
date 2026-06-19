# PATH Configuration
# Using fish_add_path for idempotent, safe PATH additions

# User local binaries
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin

# Cargo (Rust)
if test -d $HOME/.cargo/bin
    fish_add_path $HOME/.cargo/bin
end

# JBang
if test -d $HOME/.jbang/bin
    fish_add_path $HOME/.jbang/bin
end
if test -d $HOME/.jbang/currentjdk/bin
    fish_add_path $HOME/.jbang/currentjdk/bin
end

# Android SDK
if test -d $ANDROID_HOME
    fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
    fish_add_path $ANDROID_HOME/platform-tools
    fish_add_path $ANDROID_HOME/emulator
end
