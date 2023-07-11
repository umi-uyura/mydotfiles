;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AutoHotKey configuration
;;
;; Installation:
;; 1. Install AutoHotKey
;; 2. Create shortcut this file
;; 3. Copy shortcut to user's startup folder
;;    - Open startup folder: Win + R and type `shell:startup`
;; 4. Reboot pc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; for English keyboard
if (A_Language = "0409") {
  ;; [Right Alt] IME convert
  RAlt::Send("{vk1Csc079}")

  ;; [Right Ctrl] IME non-convert
  RCtrl::Send("{vk1Dsc07B}")
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Virtual Desktop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [Ctrl + Right Arrow] Move next desktop
^Right::Send("{LWin down}{LCtrl down}{Right}{LWin up}{LCtrl up}")

;; [Ctrl + Left Arrow] Move prev desktop
^Left::Send("{LWin down}{LCtrl down}{Left}{LWin up}{LCtrl up}")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windows Terminal / Command Prompt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [Ctrl + Shift + L] Send "cls" to clear buffer
#HotIf WinActive("ahk_exe WindowsTerminal.exe") || WinActive("ahk_class ConsoleWindowClass")
^+L::
{
  Send("cls{Enter}")
  return
}
#HotIf
