(use-package eglot
  :bind (:map eglot-mode-map
              ("C-M-\\" . eglot-format)
              ("M-r" . eglot-rename))
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

(use-package cc-mode
  :after eglot
  :hook ((c++-mode . eglot-ensure)
         (c++-mode . company-mode))
  :bind (:map c++-mode-map
              ("M-<up>" . flymake-goto-prev-error)
              ("M-<down>" . flymake-goto-next-error)))
