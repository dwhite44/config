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
