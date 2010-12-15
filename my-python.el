(when (require 'pymacs nil t)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)
  (add-hook 'python-mode-hook
            (lambda ()
              (local-set-key [C-f3] (lambda ()
                                      (interactive)
                                      (rope-find-file t)))))

  ;; Don't forget to rope-generate-autoimport-cache
  (setq ropemacs-guess-project t)
  (setq ropemacs-autoimport-modules '("os" "threading")))
