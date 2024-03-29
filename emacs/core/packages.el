;; Setup ability to install packages

;; Add to fix issue with refreshing packages failing to connect to melpa
(custom-set-variables '(gnutls-algorithm-priority "normal:-vers-tls1.3"))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; version 27 is calling package-initialize by default as of 12/17/2018
;; see for details: https://github.com/jkitchin/scimax/issues/194

(setq load-prefer-newer t)
(if (version<= emacs-version "27")
  (package-initialize))

;; For benchmarking load time. Uncomment lines below to allow the init
;; process to be times. then look at times with
;; benchmark-init/show-durations-tree
;;(require 'benchmark-init)
   ;; To disable collection of benchmark data after init is done.
;;(add-hook 'after-init-hook 'benchmark-init/deactivate)

(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))`

(eval-when-compile
  (require 'use-package))

;; General Packages
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  ;;(which-key-setup-side-window-right-bottom)
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha)
  (setq which-key-side-window-max-width 0.33)
  (setq which-key-idle-delay 0.05)
  :init
  (which-key-mode))

(load "dw-vim.el")
(load "dw-projectile.el")
(load "dw-ivy.el")
(load "dw-company.el")

(use-package recentf
  :config
  (setq recentf-save-file (concat emacs-dir ".recentf"))
  (require 'recentf)
  (recentf-mode 1)
  (setq recentf-max-menu-items 40))

;; Development Modules
(load "dw-development.el")
(load "dw-clojure.el")
(load "dw-css.el")
(load "dw-javascript.el")
