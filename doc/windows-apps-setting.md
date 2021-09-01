Windows application settings
============================

Google日本語入力
---------------

* 一般
  * キー設定
    * キー設定の選択: `MS-IME`
    * 編集
      * 以降、すべてのモードの該当する入力キーに対して設定する（入力キーでソートするとわかりやすい）
      * 入力キー: `Henkan` -> `IMEを有効化`
      * 入力キー: `Muhenkan` -> `IMEを無効化`


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

| 名前 | 固定 | 有効 | 備考 |
| - | - | - | - |
| [英辞郎 on the WEB 拡張機能](https://chrome.google.com/webstore/detail/%E8%8B%B1%E8%BE%9E%E9%83%8E-on-the-web-%E6%8B%A1%E5%BC%B5%E6%A9%9F%E8%83%BD/oonalfdoahlmjaoloddjenihohbfodme) | o | o | |
| [Mate Translate](https://chrome.google.com/webstore/detail/mate-translate-%E2%80%93-translat/ihmgiclibbndffejedjimfjmfoabpcke) | o | o | |
| [はてなブックマーク](https://chrome.google.com/webstore/detail/%E3%81%AF%E3%81%A6%E3%81%AA%E3%83%96%E3%83%83%E3%82%AF%E3%83%9E%E3%83%BC%E3%82%AF/dnlfpnhinnjdgmjfpccajboogcjocdla) | o | o | |
| [Save to Pocket](https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj) | o | o | |
| [Evernote Web Clipper](https://chrome.google.com/webstore/detail/evernote-web-clipper/pioclpoplcdbaefihamjohnefbikjilc) | o | o | |
| [Create Link](https://chrome.google.com/webstore/detail/create-link/gcmghdmnkfdbncmnmlkkglmnnhagajbm) | o | o | |
| [Todoist for Chrome](https://chrome.google.com/webstore/detail/todoist-for-chrome/jldhpllghnbhlbpcmnajkpdmadaolakh) | o | o | |
| [AutoHideDownloadsBar](https://chrome.google.com/webstore/detail/autohidedownloadsbar/gkmndgjgpolmikgnipipfekglbbgjcel) | - | o | |
| [AutoPagerize](https://chrome.google.com/webstore/detail/autopagerize/igiofjhpmpihnifddepnpngfjhkfenbp) | - | o | |
| [ChromeLens](https://chrome.google.com/webstore/detail/chromelens/idikgljglpfilbhaboonnpnnincjhjkd) | - | - | アクセシビリティチェックツール |
| [Keepa - Amazon Price Tracker](https://chrome.google.com/webstore/detail/keepa-amazon-price-tracke/neebplgakaahbhdphmkckjjcegoiijjo) | - | o | |
| [Lighthouse](https://developers.google.com/web/tools/lighthouse/) | - | - | Web品質チェック（パフォーマンス、PWA、アクセシビリティ、ベストプラクティス、SEO） |
| [OctoLinker](https://chrome.google.com/webstore/detail/octolinker/jlmafbaeoofdegohdhinkhilhclaklkp) | - | o | |
| [Octotree](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc) | - | o | |
| [VisBug](https://chrome.google.com/webstore/detail/visbug/cdockenadnadldjbbgcallicgledbeoc) | - | - | Webデザインデバッグ |
| [Vue.js devtools](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd) | - | o | |

#### AutoHideDownloadsBar

* ダウンロードがアクティブなときにダウンロードバーを表示する: `ON`

#### Create Link

* Default Format: `markdown`
* Formats
  * Remove `HTML`, `MediaWiki`
  * Change the order: `markdown`, `Plain Text`


Visual Studio Code
------------------

### Window

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
| [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2) | - | |
| [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight) | ○ | |
| [edamagit](https://marketplace.visualstudio.com/items?itemName=kahole.magit) | ○ | |
| [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) | ○ | |
| [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph) | ○ | |
| [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) | ○ | |
| [Gitmoji](https://marketplace.visualstudio.com/items?itemName=Vtrois.gitmoji-vscode) | ○ | |
| [Hex Editor](https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor) | ○ | |
| [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow) | ○ | |
| [Jest](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest) | ○ | |
| [Kotlin Language](https://marketplace.visualstudio.com/items?itemName=mathiasfrohlich.Kotlin) | - | |
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
| [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) | - | |
| [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) | - | |
| [Remote - SSH: Editing Configuration Files](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh-edit) | - | |
| [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) | - | |
| [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) | - | |
| [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur) | ○ | |
| [vscode-jq](https://marketplace.visualstudio.com/items?itemName=dandric.vscode-jq) | ○ | |
| [VSNotes](https://marketplace.visualstudio.com/items?itemName=patricklee.vsnotes) | ○ | |
| [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) | ○ | |


Simplenote
----------

* View
  * Note Display: `Condensed`
