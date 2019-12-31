;; Linux-specific settings

(use-package exec-path-from-shell
  :ensure t
  :defer t)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
