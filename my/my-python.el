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
  :config
  (bind-keys :map python-mode-map
             ([backtab] . python-backtab)
             ([tab] . python-tab)))

(use-package yapfify
  :config
  (add-hook 'python-mode-hook 'yapf-mode)
  (bind-keys :map python-mode-map
             ("C-M-q" . yapfify-region)
             ("C-M-\\" . yapfify-buffer)))

(use-package pyvenv :ensure t)

(use-package projectile :ensure t)

(use-package lsp-mode
  :ensure t
  :config
  (bind-keys :map python-mode-map
             ("M-r" . lsp-rename))

  ;; make sure we have lsp-imenu everywhere we have LSP
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  ;; get lsp-python-enable defined
  ;; NB: use either projectile-project-root or ffip-get-project-root-directory
  ;;     or any other function that can be used to find the root directory of a project
  (lsp-define-stdio-client lsp-python "python"
                           #'projectile-project-root
                           '("pyls"))

  ;; make sure this is activated when python-mode is activated
  ;; lsp-python-enable is created by macro above
  (add-hook 'python-mode-hook
            (lambda ()
              (company-mode)
              (lsp-python-enable)))

  ;; lsp extras
  (use-package lsp-ui
    :ensure t
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))

  (use-package company-lsp
    :config
    (push 'company-lsp company-backends))

  ;; NB: only required if you prefer flake8 instead of the default
  ;; send pyls config via lsp-after-initialize-hook -- harmless for
  ;; other servers due to pyls key, but would prefer only sending this
  ;; when pyls gets initialised (:initialize function in
  ;; lsp-define-stdio-client is invoked too early (before server
  ;; start)) -- cpbotha
  (defun lsp-set-cfg ()
    (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
      (lsp--set-configuration lsp-cfg)))
  (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg))

(use-package flycheck-mypy
  :ensure t
  :config
  (add-hook 'python-mode-hook 'flycheck-mode))
