(dolist (p '(js3-mode
             tern
             flycheck
             company
             company-tern))
  (when (not (package-installed-p p))
    (package-install p)))

(require 'company)
(add-to-list 'company-backends 'company-tern)

(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-hook 'js3-mode-hook (lambda ()
                           (tern-mode t)
                           (company-mode t)
                           (flycheck-mode t)))
