;; Set core settings and packages

;; change garbage collection threshold to 100MB
(setq gc-cons-threshold 100000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Disable autosave and set backup files to single directory"
(setq auto-save-default nil)
(setq prelude-auto-save nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; OS-Specific
;; macOS specific settings
(when (eq system-type 'darwin)
  (load "macos.el"))

;; Linux specific settings
(when (eq system-type 'gnu/linux)
  (load "linux.el"))
