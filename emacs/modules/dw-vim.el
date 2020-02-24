;; Setup Evil Module

(use-package evil
  :ensure t
  :init
  ;; Make the insert settings just use regular emacs bindings
  (setq evil-disable-insert-state-bindings t)
  (setq evil-default-state 'insert)
  ;; prevent esc-key from translating to meta-key in terminal mode
  (setq evil-esc-delay 0)
  :config
  (evil-mode 1))
