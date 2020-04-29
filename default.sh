#!/bin/bash
cat << EOS
 Setup Mac
EOS

echo " ----- setup default setting ------"

####################
# Mac defaults setup
###################

# スクロールバーを常に表示
defaults write -g AppleShowScrollBars -string "Always"

###################
# トラックパッドの設定
###################

# 現在のキーボードやトラックパッドの設定を表示するコマンド
plutil -p ~/Library/Preferences/ByHost/.GlobalPreferences.*.plist
# トラックパッドの軌跡の速さ slow 0-3 fast
# defaults read -g com.apple.trackpad.scaling
defaults write -g com.apple.trackpad.scaling 1.5

# トラックパッド
defaults write -g com.apple.mouse.tapBehavior 1
defaults write -g com.apple.trackpad.enableSecondaryClick 1
defaults write -g com.apple.trackpad.fiveFingerPinchSwipeGesture 2
defaults write -g com.apple.trackpad.fourFingerHorizSwipeGesture 2
defaults write -g com.apple.trackpad.fourFingerPinchSwipeGesture 2
defaults write -g com.apple.trackpad.fourFingerVertSwipeGesture 2
defaults write -g com.apple.trackpad.momentumScroll 1
defaults write -g com.apple.trackpad.pinchGesture 1
defaults write -g com.apple.trackpad.rotateGesture 1
defaults write -g com.apple.trackpad.scrollBehavior 2
defaults write -g com.apple.trackpad.threeFingerDragGesture 1
defaults write -g com.apple.trackpad.threeFingerHorizSwipeGesture 0
defaults write -g com.apple.trackpad.threeFingerTapGesture 0
defaults write -g com.apple.trackpad.threeFingerVertSwipeGesture 0
defaults write -g com.apple.trackpad.twoFingerDoubleTapGesture 1
defaults write -g com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture 3
defaults write -g com.apple.trackpad.version 5
defaults write -g PKSecureElementAvailableFlagsByHost 3


###################
# デスクトップの設定
###################
# デスクトップに表示する項目 ハードディスク（内蔵 SSD） 表示する
defaults write com.apple.finder ShowHardDrivesOnDesktop 1
# デスクトップに表示する項目 外部ディスク 表示する
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop 1
# デスクトップに表示する項目 CD、DVD、iPod 表示する
defaults write com.apple.finder ShowRemovableMediaOnDesktop 1
# デスクトップに表示する項目 接続中のサーバ 表示する
defaults write com.apple.finder ShowMountedServersOnDesktop 1

###################
# Finderの設定
###################
# Finderの設定を確認する
defaults read com.apple.finder
# Finder 隠しファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true
# すべての拡張子を表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder サイドバー 最近使ったタグ 表示しない
defaults write com.apple.finder ShowRecentTags 0
# Finderのデフォルトはカラムビュー表示
defaults write com.apple.finder FXPreferredViewStyle clmv
# Finderのタイトルバーにフルパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Finderのステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
# ボリュームをマウントした時に Finderを自動的に表示
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# サイドバーのアイコンサイズを中にする（1=小、2=中、3=大）
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
# ~/Library を常に表示する
chflags nohidden ~/Library
#DS_STOREを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores True


###################
# Dockの設定
###################
# Dockの表示位置 左端
defaults write com.apple.dock orientation -string "bottom"
# Dockを隠す(自動的に隠す）
defaults write com.apple.dock autohide -bool True
# Dockをすぐに表示する
defaults write com.apple.dock autohide-delay -float 0
# Dockでオンマウスでのアイコンをズームする
defaults write com.apple.dock magnification -bool True
# Dockに表示するアイコンサイズの変更 36
defaults write com.apple.dock tilesize -int 36
# iPhoneを接続した時に写真アプリを自動起動しない
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
# LaunchPadに表示するアイコンの数 横 10個、縦 6個
defaults write com.apple.dock springboard-columns -int 10
defaults write com.apple.dock springboard-rows -int 6
# ウィンドウ拡大縮小アニメーションを高速化
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# Fnキーを標準のファンクションキーとして使用
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
# 保存ダイアログを詳細設定で表示
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -boolean true
# 印刷ダイアログを詳細設定で表示
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -boolean true
# ファイルの保存場所のデフォルトをiCloud以外にする
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# スクロールバーの現在の設定内容を取得
# defaults read -g AppleShowScrollBars
# Always
# スクロールバーを常に表示
# Automatic = 自動的に表示
# WhenScrolling = スクロール時に表示
# Always = 常に表示
defaults write -g AppleShowScrollBars "Always"
# 下記でも同じ意味
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# 外部ディスプレイでアンチエイリアスを有効（サブピクセルレンダリング「中」レベル）
defaults -currentHost write -g AppleFontSmoothing -int 2

# 設定を反映する
killall Dock
killall Finder

###################
# TextEditor
###################
defaults read com.apple.TextEdit
# CheckSpellingWhileTyping = 0
# SmartCopyPaste = 0
#defaults read com.apple.TextEdit RichText
# 0
# TextEdit テキストエディットを「標準テキスト」にする
# テキストエディットで「リッチテキスト」を使用しない
defaults write com.apple.TextEdit RichText -int 0

###################
# メニューバーの設定
###################

# メニューバーのバッテリー残量の表示の現在の設定内容を取得
defaults read com.apple.menuextra.battery ShowPercent
# YES
# メニューバーにバッテリーの残量をパーセント表示する YES/NO
defaults write com.apple.menuextra.battery ShowPercent YES
# メニューバーの右端にアカウント名を表示しない
# ユーザとグループ ファストユーザスイッチメニューを非表示
# defaults write -g MultipleSessionEnabled -bool false
# メニューバーの右端の時刻表示、12月23日 23:45
# defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5 H:mm"
# \u6708は 月の Unicode
# \u65e5は 日の Unicode
# メニューバーの右端の時刻表示、12月23日(水) 23:45:01
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE) H:mm:ss"
# メニューバーの右側のアイコン類の表示設定 IME、音量、Bluetooth等
defaults read ~/Library/Preferences/com.apple.systemuiserver.plist
defaults write com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/TextInput.menu" \
"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
"/System/Library/CoreServices/Menu Extras/Script Menu.menu" \
"/System/Library/CoreServices/Menu Extras/RemoteDesktop.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
"/System/Library/CoreServices/Menu Extras/Battery.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu" \
"/System/Library/CoreServices/Menu Extras/Clock.menu"
# メニューバーを再起動する
killall SystemUIServer

echo " ------------ END ------------"