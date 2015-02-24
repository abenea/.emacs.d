;; Show trailing whitespace and delete-trailing-whitespace on save
(defun trailing-whitespace-is-evil ()
  (setq show-trailing-whitespace t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil t))

(add-hook 'c++-mode-hook 'trailing-whitespace-is-evil)
(add-hook 'python-mode-hook 'trailing-whitespace-is-evil)
(add-hook 'cperl-mode-hook 'trailing-whitespace-is-evil)
(add-hook 'clojure-mode-hook 'trailing-whitespace-is-evil)

(defun auto-delete-trailing-whitespace ()
  (interactive)
  (delete-trailing-whitespace)
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil t))
