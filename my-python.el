(require 'virtualenv)

(defun python-shift-right-region ()
  (interactive)
  (let (deactivate-mark)
    (python-shift-right (region-beginning) (region-end))))

(defun python-shift-left-region ()
  (interactive)
  (let (deactivate-mark)
    (python-shift-left (region-beginning) (region-end))))

(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key [backtab] 'python-shift-left-region)
            (local-set-key [tab] (lambda ()
                                   (interactive)
                                   (if mark-active
                                       (python-shift-right-region)
                                     (indent-for-tab-command))))))

(when (require 'pymacs nil t)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)
  ;; Don't forget to rope-generate-autoimport-cache
  (setq ropemacs-guess-project t)
  (setq ropemacs-autoimport-modules '("os" "threading"))

  (add-hook 'python-mode-hook
            (lambda ()
              (local-set-key [C-f3] 'rope-find-file))))
