;; Set core settings and packages

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
