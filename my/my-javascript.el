(use-package flycheck)
(use-package company)
(use-package tern)
(use-package company-tern
  :config
  (add-to-list 'company-backends 'company-tern))

(use-package js3-mode
  :mode "\\.js$"
  :config
  (add-hook 'js3-mode-hook (lambda ()
                             (company-mode t)
                             (flycheck-mode t)
                             (tern-mode t))))
