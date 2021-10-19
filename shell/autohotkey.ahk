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
;; Virtual Desktop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [Ctrl + Right Arrow] Move next desktop
^Right::send {LWin down}{LCtrl down}{Right}{LWin up}{LCtrl up}

;; [Ctrl + Left Arrow] Move prev desktop
^Left::send {LWin down}{LCtrl down}{Left}{LWin up}{LCtrl up}
