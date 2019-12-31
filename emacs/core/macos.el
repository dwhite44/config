;; Mac-OS specific settings

;; set env when launched as gui app
(use-package exec-path-from-shell
  :ensure t
  :defer t
  :init)

(require 'exec-path-from-shell)
;;(setq exec-path-from-shell-arguments nil)
(setq exec-path-from-shell-check-startup-files nil)
(exec-path-from-shell-initialize)

;; There's no point in hiding the menu bar on macOS, so let's not do it
(menu-bar-mode +1)

;; Enable emoji, and stop the UI from freezing when trying to display them.
(when (fboundp 'set-fontset-font)
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))
