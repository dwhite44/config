;; Settings for editor

(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 4)

(setq x-select-enable-clipboard t ;; makes killing/yanking interact with the clipboard
      x-select-enable-primary t  ;; recommended
      
      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t
      

      apropos-do-all t ;; Shows all options when running apropos

      ;; Mouse yank commands yank at point instead of at click
      mouse-yank-at-point t)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Show line numbers
(global-linum-mode)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)

;; Turn off cleaning up whitespace
(setq prelude-clean-whitespace-on-save nil)
