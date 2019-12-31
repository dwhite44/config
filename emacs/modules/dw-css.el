;; Setup css mode

(with-eval-after-load 'css-mode
  (require 'smartparens-config)

  (defun css-mode-defaults ()
    (rainbow-mode +1)
    (smartparens-mode t))

  (use-package rainbow-mode
    :ensure t
    :defer t
    :init
    (add-hook 'css-mode-hook 'css-mode-defaults))

  (setq css-indent-offset 2))

