;; Setup for general development

;; Git
(use-package magit
  :ensure t
  :defer t)
(use-package diff-hl
  :ensure t
  :defer t)
(global-diff-hl-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; show the name of the current function definition in the modeline
(require 'which-func)
(which-function-mode 1)

;; font-lock annotations like TODO in source code
(use-package hl-todo :ensure t)
(require 'hl-todo)
(global-hl-todo-mode 1)

;; Smartparens
(use-package smartparens
  :ensure t
  :config (progn
            (require 'smartparens-config)
            (smartparens-global-mode t)
            ;; highlight matching pairs
            (show-smartparens-global-mode t)
            (setq-default sp-escape-quotes-after-insert nil)))
;; smart pairing for all
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

;; flycheck for syntax checking
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package rainbow-delimiters
  :ensure t
  :defer t)

(show-paren-mode 1)

;; Direnv
(use-package direnv
  :ensure t
  :config
  (direnv-mode))

;; Show Trailing whitespace
(setq-default show-trailing-whitespace t)
