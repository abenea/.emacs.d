(require 'virtualenv)

(defun workon ()
  (interactive)
  (virtualenv-workon 1))

(defun python-backtab ()
  (interactive)
  (if mark-active
      (let (deactivate-mark)
        (python-shift-left (region-beginning) (region-end)))))

(defun python-tab ()
  (interactive)
  (if mark-active
      (let (deactivate-mark)
        (python-shift-right (region-beginning) (region-end)))
    (indent-for-tab-command)))

(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key [backtab] 'python-backtab)
            (local-set-key [tab] 'python-tab)))

(when (require 'pymacs nil t)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)
  ;; Don't forget to rope-generate-autoimport-cache
  (setq ropemacs-guess-project t)
  (setq ropemacs-autoimport-modules '("os" "threading"))

  (define-key ropemacs-local-keymap [(meta /)] 'dabbrev-expand)
  (define-key ropemacs-local-keymap [(control c) (control /)] 'rope-code-assist)

  (add-hook 'python-mode-hook
            (lambda ()
              (local-set-key (kbd "C-S-o") 'rope-organize-imports)
              (local-set-key [C-f3] (lambda ()
                                      (interactive)
                                      (rope-find-file t))))))
