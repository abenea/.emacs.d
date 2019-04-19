(use-package go-mode)
(use-package company-go
  :config
  (bind-keys :map go-mode-map
             ("C-M-\\" . gofmt)
             ("M-." . godef-jump)
             ("M-," . pop-tag-mark))
  (add-hook 'go-mode-hook
            (lambda ()
              (setq tab-width 4)
              (setq gofmt-command "goimports")
              (add-hook 'before-save-hook 'gofmt-before-save)
              (flycheck-mode)
              (set (make-local-variable 'company-backends) '(company-go))
              (company-mode))))
