Application settings for multiple platforms
===========================================

Dropbox
-------

### バックアップ

* 外付けドライブバックアップ
  * 新しい外付けドライブが接続されると、セットアップ通知を表示します: `OFF`
* 写真
  * カメラアップロードをONにする: `OFF`


KeePassXC
---------

### 全般

* 基本設定
  * システム起動時にKeePassXCを自動的に起動する: `OFF`


Google Chrome
-------------

### Googleの設定

* 同期とGoogleサービス
  * 他のGoogleサービス
    * Chromeへのログインを許可する: `OFF`

### 自動入力

* パスワード
  * パスワードを保存できるようにする: `OFF`
  * 自動ログイン: `OFF`

### デザイン

* ホームボタンを表示する: `ON`


### Chrome Extensions

| 名前 | 固定 | 常時有効 | シークレット<br>モード | 備考 |
| - | - | - | - | - |
| [英辞郎 on the WEB 拡張機能](https://chrome.google.com/webstore/detail/%E8%8B%B1%E8%BE%9E%E9%83%8E-on-the-web-%E6%8B%A1%E5%BC%B5%E6%A9%9F%E8%83%BD/oonalfdoahlmjaoloddjenihohbfodme) | o | o | o | - |
| [DeepL翻訳](https://chrome.google.com/webstore/detail/deepl-translate-reading-w/cofdbpoegempjloogbagkncekinflcnj) | - | o | o | - |
| [はてなブックマーク](https://chrome.google.com/webstore/detail/%E3%81%AF%E3%81%A6%E3%81%AA%E3%83%96%E3%83%83%E3%82%AF%E3%83%9E%E3%83%BC%E3%82%AF/dnlfpnhinnjdgmjfpccajboogcjocdla) | o | o | o | - |
| [Save to Pocket](https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj) | o | o | - | - |
| [Evernote Web Clipper](https://chrome.google.com/webstore/detail/evernote-web-clipper/pioclpoplcdbaefihamjohnefbikjilc) | o | o | - | - |
| [Create Link](https://chrome.google.com/webstore/detail/create-link/gcmghdmnkfdbncmnmlkkglmnnhagajbm) | o | o | o | - |
| [Todoist for Chrome](https://chrome.google.com/webstore/detail/todoist-for-chrome/jldhpllghnbhlbpcmnajkpdmadaolakh) | o | o | - | - |
| [AutoPagerize](https://chrome.google.com/webstore/detail/autopagerize/igiofjhpmpihnifddepnpngfjhkfenbp) | - | o | - | - |
| [Auto Refresh Plus](https://autorefresh.io/) | - | - | o | - |
| [Keepa - Amazon Price Tracker](https://chrome.google.com/webstore/detail/keepa-amazon-price-tracke/neebplgakaahbhdphmkckjjcegoiijjo) | - | o | - | - |
| [OctoLinker](https://chrome.google.com/webstore/detail/octolinker/jlmafbaeoofdegohdhinkhilhclaklkp) | - | o | - | - |
| [Octotree](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc) | - | o | - | - |
| [Tracking Token Stripper](https://chrome.google.com/webstore/detail/tracking-token-stripper/kcpnkledgcbobhkgimpbmejgockkplob) | - | o | - | URLに含まれるトラッキングコードを除去 |
| [VisBug](https://chrome.google.com/webstore/detail/visbug/cdockenadnadldjbbgcallicgledbeoc) | - | - | - | Webデザインデバッグ |
| [Vue.js devtools](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd) | - | - | - | - |

#### Create Link

* Default Format: `markdown`
* Formats
  * Remove `HTML`, `MediaWiki`
  * Change the order: `markdown`, `Plain Text`
  * Change format
    * markdown: `[%text%](%url%)`


Visual Studio Code
------------------

### Text Editor

* Bracket Pair Colorization: `ON`
* Guides: Bracket Pairs: `true`

#### Font

* Font Family: `'UDEV Gothic 35', Consolas, 'Courier New', monospace`

### Window

* Window: New Window Dimensions: `maximized`
* Window: Restore Windows: `none`

### Features

#### Terminal

* Integrated > Default Profile: Windows: `Command Prompt`
* Integrated > Profiles: Windows:
  ```json
  "terminal.integrated.profiles.windows": {
    "Command Prompt": {
      "path": [
        "${env:windir}\\Sysnative\\cmd.exe",
        "${env:windir}\\System32\\cmd.exe"
      ],
      "args": [],
      "icon": "terminal-cmd"
    },
    "Git Bash": {
      "source": "Git Bash"
    },
    "PowerShell": {
      "source": "PowerShell",
      "icon": "terminal-powershell"
    }
  }
  ```

### Extensions

| 名前 | WSL | 備考 |
| - | - | - |
| [Awesome Emacs Keymap](https://marketplace.visualstudio.com/items?itemName=tuttieee.emacs-mcx) | - | |
| [Bracket Lens](https://marketplace.visualstudio.com/items?itemName=wraith13.bracket-lens) | ? | |
| [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight) | ○ | |
| [edamagit](https://marketplace.visualstudio.com/items?itemName=kahole.magit) | ○ | |
| [:emojisense:](https://marketplace.visualstudio.com/items?itemName=bierner.emojisense) | ○ | - |
| [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) | ○ | |
| [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph) | ○ | |
| [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) | ○ | |
| [Gitmoji](https://marketplace.visualstudio.com/items?itemName=Vtrois.gitmoji-vscode) | ○ | |
| [Hex Editor](https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor) | ○ | |
| [Insert Date String](https://marketplace.visualstudio.com/items?itemName=jsynowiec.vscode-insertdatestring) | ○ | |
| [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow) | ○ | |
| [Jest](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest) | ○ | |
| [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) | ○ | Pythonと一緒にインストールされる |
| [Kotlin Language](https://marketplace.visualstudio.com/items?itemName=mathiasfrohlich.Kotlin) | - | |
| [Lisp](https://marketplace.visualstudio.com/items?itemName=mattn.Lisp) | ○ | - |
| [Markdown Emoji](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-emoji) | ○ | |
| [Markdown Preview Mermaid Support](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid) | ○ | |
| [Markdown Preview Github Styling](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles) | ○ | |
| [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) | ○ | |
| [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) | - | |
| [ngrok for VSCode](https://marketplace.visualstudio.com/items?itemName=philnash.ngrok-for-vscode) | ○ | |
| [Node.js REPL](https://marketplace.visualstudio.com/items?itemName=lostfields.nodejs-repl) | ○ | |
| [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) | ○ | |
| [PlantUML](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml) | ○ | |
| [Project Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager) | - | |
| [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance) | ○ | Pythonと一緒にインストールされる |
| [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) | ○ | - |
| [Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring) | ○ | - |
| [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) | - | |
| [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) | - | |
| [Remote - SSH: Editing Configuration Files](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh-edit) | - | |
| [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) | - | |
| [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) | - | |
| [SFTP](https://marketplace.visualstudio.com/items?itemName=Natizyskunk.sftp) | ○ | |
| [sqlfluff](https://marketplace.visualstudio.com/items?itemName=dorzey.vscode-sqlfluff) | ○ | [sqlfluff](https://www.sqlfluff.com/) must be installed |
| [Time Converter](https://marketplace.visualstudio.com/items?itemName=HaaLeo.timing) | - | |
| [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur) | ○ | |
| [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode) | ○ | - |
| [vscode-jq](https://marketplace.visualstudio.com/items?itemName=dandric.vscode-jq) | ○ | |
| [VSNotes](https://marketplace.visualstudio.com/items?itemName=patricklee.vsnotes) | ○ | |
| [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) | ○ | |

#### GitLens

* "gitlens.codeLens.enabled": `false` ※コードブロック単位のblameは使用しない


Sidekick
--------

### 自動入力

* パスワードマネージャー
  * パスワードを保存できるようにする: `OFF`
  * 自動ログイン: `OFF`
