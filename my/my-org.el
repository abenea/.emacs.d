(setq org-default-notes-file "~/todo.org"
      org-capture-templates
      '(("t" "Todo" entry (file+headline "~/todo.org" "Tasks")
         "* TODO %?\n  %i"
         :kill-buffer t))
      org-ellipsis " ▾"
      org-src-fontify-natively t
      org-fontify-quote-and-verse-blocks t
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 2
      org-hide-block-startup nil
      org-src-preserve-indentation nil
      org-startup-folded 'content)

(add-hook 'org-mode-hook
          (lambda ()
            (visual-line-mode)
            (org-indent-mode)))
