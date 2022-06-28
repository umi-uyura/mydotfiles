Windows settings
================

環境変数
-------

| 環境変数 | 値 | 備考 |
|---------|----|-----|
| `DOTFILES_ROOT` | `%USERPROFILE%\dotfiles` | - |
| `GIT_SSH` | `C:\Windows\System32\OpenSSH\ssh.exe` | Git for Windowsで利用するSSH |
| `WSLENV` | `USERPROFILE/pu` | WindowsとWSLで共有する環境変数 |

### PATH 追加

#### User Variables

| PATH | 備考 |
|------|-----|
| `%DOTFILES_ROOT%\bin` | dotfiles |
| `C:\Program Files\7-Zip` | 7-Zip |
| `C:\Program Files (x86)\GnuWin32\bin` | GnuWin32: Zip |
| `%LOCALAPPDATA%\FastCopy` | FastCopy |
| `C:\Program Files\Graphviz\bin` | Graphviz |
| `C:\Program Files\MongoDB\Tools\100\bin` | MongoDB Database Tools |


システム
--------

### 電源とスリープ

* 画面
  * 次の時間が経過後、ディスプレイの電源を切る（バッテリー駆動時）: `5分`
  * 次の時間が経過後、ディスプレイの電源を切る（電源に接続時）: `30分`
* スリープ
  * 次の時間が経過後、PCをスリープ状態にする（バッテリー駆動時）: `30分`
  * 次の時間が経過後、PCをスリープ状態にする（電源に接続時）: `1時間`


### マルチタスク

* タイムライン
  * タイムラインにおすすめを表示する: `OFF`
* AltキーとTabキー
  * AltキーとTabキーを押すと表示されます: `ウィンドウのみを開く`
* 仮想デスクトップ
  * タスクバーに次の場所で開いているウィンドウを表示する: `すべてのデスクトップ`
  * Alt + Tabキーを押したときに次の場所で開いているウィンドウを表示する: `すべてのデスクトップ`


個人用設定
----------

### 色

* 色を選択する: `ダーク`
* 以下の場所にアクセントカラーを表示します
  * スタートメニュー、タスクバー、アクションセンター: `ON`

### ロック画面

* ロック画面に詳細な状態を表示するアプリを1つ選択します: `なし`

### テーマ

* マウスカーソル
  * ポインターオプション
    * Ctrlキーを押すとポインターの位置を表示する: `ON`

### スタート

* ときどきスタートメニューにおすすめアプリを表示する: `OFF`

### タスクバー

* 小さいタスクバーボタンを使う: `ON`
* コマンドプロンプトをPowerShellに置き換える: `OFF`

#### タスクバーのコンテキストメニューから設定する項目

* 検索: `表示しない`
* ニュースと関心事項: `無効にする`
* Cortanaボタンを表示する: `OFF`
* タスクビューボタンを表示: `OFF`
* Windows Inkワークスペースボタンを表示: `OFF`


時刻と言語
---------

### 言語

* キーボード
  * 既定の入力方式の上書き: `Google日本語入力`
    * 選択肢に存在しない場合、優先する言語の設定でキーボードを追加する

#### 優先する言語

* 日本語→オプション
  * キーボード
    * キーボードの追加→「Google日本語入力」

#### 関連設定

* 管理用言語の設定
  * Unicode対応ではないプログラムの言語→システムロケールの変更
    * ベータ：ワールドワイド言語サポートでUnicode UTF-8を使用: `ON`


プライバシー
----------

### 全般

* Windows追跡アプリの起動を許可して、スタート画面と検索結果の質を向上する: `OFF`
* 設定アプリでおすすめのコンテンツを表示する: `OFF`

### アクティビティの履歴

* このデバイスでのアクティビティの履歴を保存する: `OFF`
* これらのアカウントのアクティビティを表示する: （アカウントがある場合）`OFF`


Microsoft IME
-------------

### キーとタッチのカスタマイズ

* キーの割り当て
  * 各キーに好みのキーを割り当てる: `ON`
  * 無変換キー: `IMEオフ`
  * 変換キー: `IMEオン`
  * Ctrl + Space: `なし`
  * Shift + Space: `別幅スペース`


フォント
-------

### 追加フォント

* [PlemolJP)](https://github.com/yuru7/PlemolJP)
  * PlemolJP35Console_HS
  * PlemolJP_HS
* [IBM Plex Sans JP](https://www.ibm.com/plex/)
  * IBM-Plex-Sans-JP - hinted
  * IBM-Plex-Sans-JP - unhinted
* [JetBrains Mono](https://www.jetbrains.com/ja-jp/lp/mono/)
  * fonts/variable


エクスプローラー
--------------

### フォルダーと検索オプションの変更（フォルダーオプション）

* 全般
  * エクスプローラーで開く: `PC`
  * プライバシー
    * 最近使ったファイルをクイックアクセスに表示する: `OFF`
    * よく使うフォルダーをクイックアクセスに表示する: `OFF`
* 表示
  * 詳細設定
    * ファイルおよびフォルダー
      * タイトルバーに完全なパスを表示する: `ON`
