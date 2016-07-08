(bind-keys ("<f2>" . save-buffer)
           ("<f3>" . find-file)
           ("<C-f4>" . (lambda () (interactive) (kill-buffer (current-buffer))))
           ("<f5>" . gud-cont)
           ("<f6>" . other-window)
           ("<f7>" . gud-step)
           ("<f8>" . gud-next)
           ("<f9>" . compile)
           ("<C-f9>" . recompile)
           ("<f11>" . delete-other-windows)
           ("<C-f11>" . toggle-frame-fullscreen)
           ("<f12>" . ff-find-other-file)
           ("M-j" . switch-to-buffer)
           ("RET" . newline-and-indent))

(use-package hideshow
  :config
  (bind-keys :map hs-minor-mode-map
             ("C-=" . hs-toggle-hiding)))
