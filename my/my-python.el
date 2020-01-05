(use-package eglot
  :ensure t
  :bind (:map eglot-mode-map
              ("C-c C-d" . eglot-help-at-point)
              ("C-M-\\" . eglot-format)
              ("M-r" . eglot-rename))
  :hook ((python-mode . eglot-ensure)
         (python-mode . company-mode)))

(use-package yapfify
  :ensure t
  :hook (python-mode . yapf-mode))

(defun python-backtab ()
  (interactive)
  (if mark-active
      (let (deactivate-mark)
        (python-indent-shift-left (region-beginning) (region-end)))))

(defun python-tab ()
  (interactive)
  (if mark-active
      (let (deactivate-mark)
        (python-indent-shift-right (region-beginning) (region-end)))
    (indent-for-tab-command)))

(use-package python
  :bind (:map python-mode-map
              ("<backtab>" . python-backtab)
              ("<tab>" . python-tab))
              ("M-<up>" . flymake-goto-prev-error)
              ("M-<down>" . flymake-goto-next-error))

(use-package pyvenv :ensure t)
