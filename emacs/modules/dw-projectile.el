;; Install / Configure Projectile

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-p") 'projectile-ripgrep)
  (define-key projectile-mode-map [134217840] 'projectile-find-file-in-known-projects)
  :init
  (projectile-mode))


;;(global-set-key [134217840] (quote projectile-find-file-in-known-projects))
