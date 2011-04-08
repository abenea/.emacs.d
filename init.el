(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((c-mode . "stroustrup") (c++-mode . "stroustrup") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(ecb-layout-name "right-directories")
 '(ecb-options-version "2.40")
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-tip-of-the-day nil)
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
 '(default ((((class color) (min-colors 88) (background dark)) (:background "black") (:foreground "wheat"))))
 '(minibuffer-noticeable-prompt ((((class color) (min-colors 88) (background light)) nil)))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "gray5")))))

(column-number-mode t)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/private")

(load-library "my-global-keybindings.el")
(load-library "my-ido.el")
(load-library "my-tabbar.el")
(load-library "my-cperl.el")
(load-library "my-ecb.el")
(load-library "my-python.el")
(load-library "my-org.el")
;; (load-library "my-nxhtml.el")
;; (load-library "my-presentation.el")
(load-library "my-trailing-whitespace.el")
(require 'erin)

(when (file-exists-p "~/.emacs.d/private/init.el")
  (load-library "~/.emacs.d/private/init.el"))
