;; Loads ui

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; don't pop up font menu
(global-set-key (kbd "s-t") #'(lambda () (interactive)))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(use-package atom-one-dark-theme
  :ensure t
  :defer t)

;(load-theme 'atom-one-dark t)
(load-theme 'tsdh-light t)

;; set default font
(custom-set-faces
 '(default ((t (:height 160 :family "Menlo")))))

(setq inhibit-startup-screen t)
