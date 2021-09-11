Windows settings
================

環境変数
-------

| 環境変数 | 値 | 備考 |
|---------|----|-----|
| `DOTFILES_ROOT` | `%USERPROFILE%\dotfiles` | - |
| `GIT_SSH` | `C:\Windows\System32\OpenSSH\ssh.exe` | Git for Windowsで利用するSSH |
| `WSLENV` | `USERPROFILE/pu` | WindowsとWSLで共有する環境変数 |

### `PATH` 追加

* `%DOTFILES_ROOT%\bin`


システム
--------

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

### スタート

* ときどきスタートメニューにおすすめアプリを表示する: `OFF`

### タスクバー

* 小さいタスクバーボタンを使う: `ON`
* コマンドプロンプトをPowerShellに置き換える: `OFF`


時刻と言語
---------

### 言語

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