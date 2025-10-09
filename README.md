# PersonDotFiles
zsh etc for mac
use [brew](https://brew.sh/) to install every needed tool 

get [EnvPane](https://github.com/hschmidt/EnvPane)

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

`brew install mise usage`


*do this command to keep your binarys automatically detected by ides*

`sudo ln -s ~/.local/share/mise/shims /usr/local/bin`
**if it exists copy the files from bin folder into the shims folder, remove the bin folder, then symlink**

Do: 

```console

##allow mise to use go and cargo installers
$ mise settings set experimental true

# install fast and standard build tools
$ mise use -g go:https://github.com/rs/curlie
$ mise use -g cargo:cargo-binstall
$ mise use -g cmake just make maven sccache
```
***before you install anything***

```console
# languages to install
$ mise use -g deno dotnet go java kotlin lua maven nim node python zig

# tools to install

# package managers to install
$ mise use -g bun conan pipx pnpm yarn
```




MAKE SURE TO INSTALL AS MUCH SOFTWARE YOU THREW BREW, MISE, AND CARGO FOR MAXIMUM PERFORMANCE GAINS ON MAC



`brew install bfs atuin bat curlie tlrc sd fd just bingrep ripgrep ripgrep-all git-delta procs grex starship just dust code-minimap mdbook ast-grep cherrybomb bacon fclones trippy gitui lemmeknow macchina onefetch tokei bottom qsv hyperfine mdcat hexyl`


***if you are on linux use **[this](https://github.com/MustCodeAl/Settings4G)** instead***

brew cask installs (do `$ brew install --no-qurantine` if some of them wont open)

```console
$ brew install alt-tab displaylink hiddenbar raycast stats swift-quit
$ brew install codewhisperer devutils jetbrains-toolbox iterm2 iina
$ brew install coteditor switchhosts rapidapi requestly warp utm
$ brew install anki chatgpt linear-linear platypus superproductivity 
$ brew install apparency betterzip qlimagesize qlzipinfo provisionql syntax-highlight suspicious-package
$ brew install clipgrab diffusionbee handbrake keycastr obs 
$ brew install google-chrome librewolf microsoft-edge orion
$ brew install homebrew/cask/docker github masscode pgadmin4  
$ brew install background-music exifcleaner linkliar mullvadvpn textmate
$ brew install cakebrew powershell chromedriver wezterm zed vimr

```
make sure you do `brew outdated --greedy` to check for updates as some applications like brave-browser to self update and brew ignores them

`brew upgrade brave-browser --greedy --no-quarantine`

`brew upgrade --greedy` to update all casks at the same time (NOT RECOMMENDED )

### extras 

`brew install man-db cppman`

`brew install logi-options-plus sony-ps-remote-play`

`brew install libplist`

`brew install llvm` 

`brew install lld` 

`brew install gdb`


`mise use -g cargo:ubi cargo:syncat cargo:paper-terminal`


install your fonts through `oh-my-posh font install` and themes through `gogh`


replace built in mac default commands as many are dated
```console

$ brew install antidote bash zsh binutils bison cmake coreutils diffutils ed file-formula findutils flex gawk git gnu-indent gnu-sed gnu-tar gnu-which gpatch grep gzip less libressl m4 make openssh perl rsync screen unzip watch wdiff wget nano nanorc
  ```


Notes for MacOS Users
Starting with Mac OS X Mavericks, a feature named App Nap has been introduced to the operating system. This feature causes certain applications which are open (but not visible) to be placed in a suspended state. As this behavior causes Anki-Connect to stop working while you have another window in the foreground, App Nap should be disabled for Anki:

Start the Terminal application.
Execute the following commands in the terminal window:
`defaults write net.ankiweb.dtop NSAppSleepDisabled -bool true`
`defaults write net.ichi2.anki NSAppSleepDisabled -bool true`
`defaults write org.qt-project.Qt.QtWebEngineCore NSAppSleepDisabled -bool true`

Restart Application
    
