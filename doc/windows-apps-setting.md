Windows application settings
============================

OneDrive
--------

### アカウント

* フォルダーの選択
  * ※必要なもののみにする

### バックアップ

* 重要なPCのフォルダー
  * バックアップを管理
    * デスクトップ: `バックアップを停止`
    * ドキュメント: `バックアップを停止`
    * 写真: `バックアップを停止`


Windows Terminal
----------------

### スタートアップ

* 既定のプロファイル: `コマンドプロンプト`
* 既定のターミナルアプリケーション (11 only): `Windowsターミナル`
* 新しいインスタンスの動作: `最近使用したウィンドウに接続する`

### 操作

* コピー時のテキスト形式: `プレーンテキストのみ`
* URLを自動的に検出して、クリックできるようにする: `OFF`

### プロファイル

#### 既定値

* 外観
  * フォントフェイス: `PlemolJP HS`
  * フォントサイズ: `11`
* 詳細設定
  * プロファイルの終了動作: `プロセスの終了、失敗、クラッシュ時に閉じる`
  * ベル通知スタイル: `フラッシュウィンドウ`

#### Windows PowerShell

* ドロップダウンからプロファイルを非表示にする: `ON`

#### Ubuntu

* 開始ディレクトリ: `~`
* 外観
  * 配色: `One Half Dark`


Google日本語入力
---------------

* 一般
  * キー設定
    * キー設定の選択: `MS-IME`
    * 編集
      * 以降、すべてのモードの該当する入力キーに対して設定する（入力キーでソートするとわかりやすい）
      * 入力キー: `Henkan` -> `IMEを有効化`
      * 入力キー: `Muhenkan` -> `IMEを無効化`


FontBase
---------

* フォント追加
  * [windows-settings内の追加フォントの項](windows-settings.md) 参照
* Text samples
  * `あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、`
* App behavior
  * Hide to tray on close: `ON`
  * Start on system start: `ON`
  * Start hidden: `ON`


PowerToys
---------

以下は無効化する

* FancyZones
* Keyboard Manager (10 only)
* PowerToys Run

### Color Picker

* エディター
  * HEX: `ON`
  * RGB: `ON`
  * これ以外は `OFF`

### Keyboard Manager (11 only)

* キーの再マップ ※Google日本語入力の設定をおこなっていること
  * `Alt (Right)` から `IME Convert`
  * `Shift (Right)` から `IME Non-Convert`

### マウスユーティリティ

* アクティブ化の方法: `マウスをシェイクする`


Microsoft Edge
--------------

### 外観

#### ツールバーのカスタマイズ

* タブ操作メニューを表示: `OFF`
* お気に入りバーの表示: `なし`
* お気に入りボタンの表示: `OFF`

#### ショートカットメニュー

* テキスト選択時のミニメニュー
  * テキストを選択したときにミニメニューを表示する: `OFF`

### [スタート]、[ホーム]、および[新規]タブ

#### [ホーム]ボタン

* ツールバーに[ホーム]ボタンを表示: `ON`

### Microsoft Edge Addon

| 名前 | 固定 | 常時有効 | 備考 |
| - | - | - | - |
| [Create Link](https://chrome.google.com/webstore/detail/create-link/gcmghdmnkfdbncmnmlkkglmnnhagajbm) | o | o | Chrome拡張 |
| [Microsoft Outlook](https://microsoftedge.microsoft.com/addons/detail/microsoft-outlook/kkpalkknhlklpbflpcpkepmmbnmfailf) | o | o | - |


QuickLook
---------

### Plugins

* [adyanth/QuickLook.Plugin.FolderViewer](https://github.com/adyanth/QuickLook.Plugin.FolderViewer)


Flow Launcher
-------------

### General

* Hide Flow Launcher on startup: `ON`
* Last Query Style: `Empty last Query`
* Maximum results show: `9`

### Plugins (Pre-install)

* Enable `OFF` plugins
  * Browser Bookmarks
  * Explorer
  * Process Killer
  * URL
  * Web Searches

#### Program

* Enable Program Description: `OFF`

#### Shell

* Replace Win + R: `OFF`
* Always run as administrator: `OFF`

### Plugins (Third party)

| Plugin | Install command |
|--------|-----------------|
| [Color](https://github.com/Flow-Launcher/Flow.Launcher.Plugin.Color) | `pm install color` |
| [Desktop Cleanup](https://github.com/umi-uyura/Flow.Launcher.Plugin.DesktopCleanup) | `pm install desktop cleanup` |
| [DevToys Launcher](https://github.com/umi-uyura/Flow.Launcher.Plugin.DevToysLauncher) | `pm install devtoys launcher` |
| [Number Converter](https://github.com/liberize/Flow.Launcher.Plugin.NumberConverter) | `pm install number` |
| [WebApp Launcher](https://github.com/gissehel/BarLauncher-WebApp) | `pm install WebApp launcher` |

#### WebApp Launcher settings

```
wap import <setting.wap.txt>
```

setting.wap.txt

```
# launcher: chrome.exe
# argumentsPattern: --app="{0}" --profile-directory="Default"
# launcher[incognito]: chrome.exe
# argumentsPattern[incognito]: --incognito "{0}"
http://localhost:3000 (local) [incognito]
http://localhost:4000 (local) [incognito]
http://localhost:8000 (local) [incognito]
http://localhost:8080 (local) [incognito]
```

### Appearance

* Window Width Size: `700`
* Theme: `Darker`
* Query Box Font: `PlemolJP HS`, `Regular`
* Result Item FOnt: `PlemolJP HS`, `Regular`


Path Copy Copy
--------------

### Commands

| Command | Main menu |
|---------|-----------|
| Copy Long Path  | ○ |
| Copy WSL Path | ○ |

### Options

* Always show submenu: `OFF`


Simplenote
----------

* View
  * Note Display: `Condensed`


Tweeten
-------

### App

* Allow Tweeten to track basic app usage

### Notifications

* Use custom Tweeten notifications: `off`

### Advanced

* Custom CSS
  * ```
    body {
      font-family: 'IBM Plex Sans JP'
    }
    ```


IntelliJ IDEA Community
------------------------

### Plugins

| 名前 | 備考 |
| - | - |
| [Videobug](https://plugins.jetbrains.com/plugin/18529-videobug) | - |


SylphyHornPlus
--------------

* [hwtnb/SylphyHornPlusWin11](https://github.com/hwtnb/SylphyHornPlusWin11)

### 一般

* 通知
  * 仮想デスクトップ切り替え時に通知を表示する: `ON`
    * 通知メッセージを表示する時間: `1000` ミリ秒
* トレイアイコン
  * デスクトップの番号をタスクトレイに表示する: `ON`
  * 現在のデスクトップ番号のみ表示する（シンプルモード）: `ON`
* 起動
  * ログオン時に自動的に起動する: `ON`

### 通知

* 通知ウィンドウの配置: `中央上部`
* 通知ウィンドウのフォントファミリ: `JetBrains Mono Italic`
* シンプルな通知モード: `ON`

### キー設定１

* アクティブウィンドウを隣接した仮想デスクトップへ移動
  * 左へ移動して切り替え: `Left Ctrl + Left Alt + ←`
  * 右へ移動して切り替え: `Left Ctrl + Left Alt + →`


Core Temp
---------

### 全般

* 温度の取得間隔: `9000`
* 温度の取得間隔: `60`
* Windows起動時にCore Tempを実行: `ON`

### 表示

* Core Tempを最小化して開始: `ON`
* Core Tempをシステムトレイに閉じる: `ON`

### 通知領域

* 通知領域のアイコン: `最高温度`
* 追加のアイコン
  * プロセッサの負荷: `ON`
  * RAM使用量: `ON`


Adobe Acrobat Reader DC
-----------------------

### 文書

* ツールパネルの現在の状態を記憶: `ON`
  * ※設定後、右側のタスクパネルウィンドウを非表示にした状態でアプリを終了する


Mery
----

### 基本

* 外観モード: `自動`
* 行番号を表示: `OFF`
* ルーラーを表示: `OFF`
* 折り返し線を表示: `OFF`

### 表示

* テーマ: `Subburst`
* フォント: `UDEV Gothic 35`


WinMerge
--------

### プラグイン

* [xdocdiff WinMerge Plugin](http://freemind.s57.xrea.com/xdocdiffPlugin/index.html) - Word、Excel、PowerPoint、PDFの比較・差分
