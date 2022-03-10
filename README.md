### インストール
インストールコマンドを実行することでシンボリックリンクが展開される。

``` bash
❯ ~/dotfiles/install.sh
.bash_history
.vscode
.zsh_history
.zshrc
```

### zsh
zshの初回起動時に各種インストールコマンドが走る。

themeはicebargを使っている。好きなものに変えてもいい。

インストールしてからitermの設定にimportする。
```
・ インストール
curl -O https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors

・ itermから設定
iTerm >> Preferences >> Profiles >> Colors tab >> Color Presets.. 
```

### fzf
cdコマンドがM1でエラー。　
```
❯ cd
(eval):1: bad CPU type in executable: fzf
```


fzfは対応済みのようなので、仕方なくbrewで入れてみる。
`brew install fzf`

すると、ローカルの.zinit側のfzfを見に行ってエラーとなるようなメッセージに変わった。
```
❯ cd
/opt/homebrew/bin/fzf-tmux: line 134: /Users/xxxxxxxxx/.zinit/plugins/junegunn---fzf-bin/fzf: Bad CPU type in executable
```

`rm -r  /Users/xxxxxxxxx/.zinit/plugins/junegunn---fzf-bin/fzf`で削除することで動くようになった。

一旦はこれでお茶を濁す。



### vscode
command + shift + p をして、バーに `show recommended extensions` を入力するとワークスペースの推奨事項へ飛べる。 プラグインをALLで入れる。

フォントは `JetBrains Mono` を利用しているので、とってこよう。 https://www.jetbrains.com/lp/mono/

### brew
未整理なのでメモ書きのみ

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install --cask google-chrome
brew install git
brew install --cask visual-studio-code
brew install --cask docker
```



