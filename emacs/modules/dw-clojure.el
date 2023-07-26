;; Setup Clojure Development
(require 'smartparens-config)

(use-package clojure-mode-extra-font-locking
  :ensure t
  :defer t)

(use-package flycheck-clj-kondo
  :ensure t)

(defun clojure-hook ()
  ;(rainbow-delimiters-mode +1)
  (smartparens-global-mode 0))


(use-package clojure-mode
  :ensure t
  :defer t
  :config
  (add-hook 'clojure-mode-hook 'subword-mode)
  (add-hook 'clojure-mode-hook 'clojure-hook)
  (require 'clojure-mode-extra-font-locking)
  (require 'flycheck-clj-kondo)
  (add-hook 'clojure-mode-hook
            (lambda ()
              ;;(setq inferior-lisp-program "lein repl")
              (font-lock-add-keywords
               nil
               '(("(\\(facts?\\)"
                  (1 font-lock-keyword-face))
                 ("(\\(background?\\)"
                  (1 font-lock-keyword-face))))
              (define-clojure-indent (fact 1))
              (define-clojure-indent (facts 1)))))

(defun cider-hook ()
  (whitespace-mode -1))

(use-package cider
  :ensure t
  :defer t
  :config
  (add-hook 'cider-mode-hook 'subword-mode)
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'clojure-mode-hook 'clojure-hook)
  (add-hook 'clojure-mode-hook 'cider-hook)
  (add-hook 'cider-repl-mode-hook #'turn-off-smartparens-strict-mode)
  (setq nrepl-log-messages t)
  (setq cider-auto-select-error-buffer t)
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  (setq cider-repl-wrap-history t)
  (setq cider-repl-use-pretty-print t)
  ;;(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
  (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))
  (add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode)))

;; Clojure-lsp
(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure"))))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-ui-mode)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1)
      ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
      ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      

;; Parinfer
(use-package parinfer-rust-mode
  :ensure t
  :init
  (progn
    (setq parinfer-rust-auto-download t)
    ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-rust-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-rust-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-rust-mode)
    (add-hook 'scheme-mode-hook #'parinfer-rust-mode)
    ;;(add-hook 'cider-repl-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-rust-mode)))

;; Disable smartparens when in parinfer mode
;(defun parinfer-disable-smartparens ()
;    (smartparens-global-mode 0))
;(defun parinfer-enable-smartparens ()
;    (smartparens-global-mode 1))
;(add-hook 'parinfer-mode-enable-hook #'parinfer-disable-smartparens)
;(add-hook 'parinfer-mode-disable-hook #'parinfer-enable-smartparens)
