# PersonDotFiles
zsh etc for mac
use [brew](https://brew.sh/) to install every needed tool 

get [EnvPane](https://github.com/hschmidt/EnvPane)

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

`brew install mise`

*do this command to keep your binarys automatically detected by ides*

`sudo ln -s ~/.local/share/mise/shims /usr/local/bin`
**if it exists copy the files from bin folder into the shims folder, remove the bin folder, then symlink**

Do: 

`cargo install cargo-binstall`

then do:

`cargo binstall sccache`

***before you install anything***


MAKE SURE TO INSTALL AS MUCH SOFTWARE YOU THREW BREW, MISE, AND CARGO FOR MAXIMUM PERFORMANCE GAINS ON MAC



`brew install dfs atuin bat tlrc sd fd just bingrep ripgrep ripgrep-all git-delta procs grex starship just dust code-minimap mdbook ast-grep cherrybomb bacon fclones trippy gitui lemmeknow macchina onefetch tokei bottom qsv hyperfine mdcat hexyl`


then `cargo bininstall atuin bat eza tlrc bottom git-delta fd-find macchina qsv tokei sd procs hexyl du-dust onefetch dtool huniq bingrep grex lemmeknow ripsecrets cargo-show-asm mdcat gitui starship glow curl doggo`
`brew install libplist`

brew cask installs (do `$ brew install --no-qurantine` if some of them wont open)

```sh-session

$ brew install raycast alt-tab brave-browser hiddenbar jetbrains-toolbox iterm2 codewhisperer
$ brew install anki linear-linear provisionql switchhosts rapidapi
$ brew install apparency exifcleaner linkliar qlimagesize syntax-highlight
$ brew install background-music github masscode google-chrome
$ brew install betterzip google-chrome qlzipinfo utm coteditor
$ brew install cakebrew handbrake obs quicklookase visual-studio-code-insiders
$ brew install chromedriver orion warp devutils stats displaylink swift-quit
$ brew install diffusionbee iina pencil librewolf powershell wezterm
$ brew install textmate pgadmin4 superproductivity sony-ps-remote-play
$ brew install cutter keycastr platypus suspicious-package mullvadvpn homebrew/cask/docker zed pieces
```
make sure you do `brew outdated --greedy` to check for updates as some applications like brave-browser to self update and brew ignores them

`brew upgrade brave-browser --greedy`

`brew upgrade --greedy` to update all casks at the same time (NOT RECOMMENDED )

`brew install man-db cppman moreutil gnu-sed`

`brew install logi-options-plus`
`brew install clipgrab`

install your fonts through `oh-my-posh font install` and themes through `gogh`


replace built in mac default commands as many are dated
```sh

$ brew install
    "zsh"
    "bash"
    "coreutils"
    "binutils"
    "diffutils"
    "ed"
    "findutils"
    "gawk"
    "gnu-indent"
    "gnu-sed"
    "gnu-tar"
    "gnu-which"
    "grep"
    "gzip"
    "screen"
    "openssh"
    "perl"
    "rsync"
    "unzip"
    "libressl"
    "git"
    "file-formula"
    "watch"
    "wget"
    "wdiff"
  ```
    
    
