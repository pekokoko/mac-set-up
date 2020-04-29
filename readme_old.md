setup.sh
default.sh

日本語を追加
カタカナ・英数のチェックを外す
ライブ変換・タイプミスを修正を外す

ショートカット -> 入力ソース
前の入力ソースを選択 を ⌘スペース
SpotlightnのSpotlight検索を表示を ^スペース

Finder->環境設定->サイドバー
最近使ったタグ意外にチェックを入れる

三本指ドラッグ
https://support.apple.com/ja-jp/HT204609

Dock
最近使ったアプリケーションをDockに表示を非表示に

Texshop
http://osksn2.hep.sci.osaka-u.ac.jp/~taku/osx/install_ptex.html
upTexはコンパイル通らなかった
ヒラギノはここを参考にしているが情報が古そう
https://qiita.com/Mizuto_Kadowaki/items/f8878140125ad40ac56e
$ sudo cjk-gs-integrate --link-texmf --force
$ sudo mktexlsr
$ sudo kanji-config-updmap-sys hiragino-elcapitan-pron
の3行はいらないかも

#dot fileの作り方
https://note.com/tkugimot/n/n66f49057d213
$ mkdir dotfiles
$ cd dotfiles
$ git init
$ cd ~/dotfiles
$ git submodule add -f https://github.com/sorin-ionescu/prezto.git .zprezto
$ git submodule update --init --recursive
$ ln -sf ~/dotfiles/.zprezto ~/.zprezto
$ cd ~/
$ setopt EXTENDED_GLOB 
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ここで一旦反映される

$ cd dotfiles
$ cp ~/.zpreztorc .zpreztorc
$ ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
$ cp ~/.zshrc .zshrc
$ ln -sf ~/dotfiles/.zshrc ~/.zshrc

Vimrc
https://qiita.com/north_redwing/items/46dc61c2bdd60f6bf544
# プラグインのinstall
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
$ sh ./install.sh
# キャッシュの削除
$ rm -rf install.sh
$ mv ~/.vim .vim
$ ln -sf ~/dotfiles/.vim ~/.vim
$ git submodule add https://github.com/Shougo/neobundle.vim.git .vim/bundle/neobundle.vim

1password 7をアクティベート
Alfredをアクティベート
Alfredから1Passwordを使えるようにする
https://www.macessence.com/alfred-1password/

TimeMashinの設定
- Formatどうするか?