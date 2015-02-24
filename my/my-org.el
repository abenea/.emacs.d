(setq org-default-notes-file "~/todo.org")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/todo.org" "Tasks")
         "* TODO %?\n  %i"
         :kill-buffer t)))

(global-set-key (kbd "C-c c")
                (lambda ()
                  (interactive)
                  (org-capture nil "t")))
