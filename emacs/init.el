;; emacs entry point

(defvar emacs-dir (file-name-directory load-file-name))
(defvar core-dir (expand-file-name "core" emacs-dir))
(defvar modules-dir (expand-file-name "modules" emacs-dir))
(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)

;; Load core scripts
(load "packages.el")
(load "ui.el")
(load "core.el")
(load "editor.el")
(load "keybindings.el")

(setq custom-file (expand-file-name "custom.el" emacs-dir))
(load custom-file 'noerror)
