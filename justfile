set windows-shell := ["C:\\Program Files\\Git\\bin", "pwsh", "-noprofile", "-nologo", "-c"]

Name := "Flow-Twitch"

help:
    just --list --unsorted

# Pack .exe
compile:
    deno compile --no-check -A --target x86_64-pc-windows-msvc -o plugin.exe src/main.ts
compile-ci:
    deno compile --no-check -A --target x86_64-pc-windows-msvc -o plugin.exe src/main.ts --frozen

# Install locally into your Flow Launcher
install: compile
    mkdir -f "~/AppData/Roaming/FlowLauncher/Plugins/{{Name}}/Images"
    cp -recurse -force plugin.exe,plugin.json,Images "~/AppData/Roaming/FlowLauncher/Plugins/{{Name}}/"

# Package .zip on CI for release
pack: compile-ci
    zip -r Flow.Launcher.Plugin.FlowTwitch.zip . -x '*.git*'