(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

(load-library "my-global-keybindings.el")
(load-library "my-ido.el")
(load-library "my-tabbar.el")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(emacsw32-eol-check-new-files t)
 '(emacsw32-eol-file-name-lf-list (quote (".*")))
 '(emacsw32-max-frames t)
 '(emacsw32-style-frame-title t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(menu-bar-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(minibuffer-noticeable-prompt ((((class color) (min-colors 88) (background light)) nil))))
