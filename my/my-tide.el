(use-package tide
  :config
  (add-hook 'typescript-mode-hook
            (lambda ()
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (company-mode-on))))
