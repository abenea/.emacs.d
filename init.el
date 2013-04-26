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
 '(fill-column 80)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(menu-bar-mode t)
 '(mouse-yank-at-point t)
 '(rst-level-face-base-color "black")
 '(show-paren-mode t)
 '(split-width-threshold 200)
 '(tool-bar-mode nil)
 '(virtualenv-workon-starts-python nil)
 '(which-function-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 88) (background dark)) (:background "black") (:foreground "wheat"))))
 '(minibuffer-noticeable-prompt ((((class color) (min-colors 88) (background light)) nil)))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "gray5"))))
 '(which-func ((t nil))))

(column-number-mode t)

(setq cmake-tab-width 4)

(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/private")

(load-library "my-global-keybindings.el")
(load-library "my-ido.el")
(load-library "my-tabbar.el")
(load-library "my-cperl.el")
(load-library "my-ecb.el")
;;(load-library "my-auto-complete.el")
(load-library "my-python.el")
(load-library "my-org.el")
;; (load-library "my-nxhtml.el")
;; (load-library "my-presentation.el")
(load-library "my-trailing-whitespace.el")
(require 'erin)

(when (file-exists-p "~/.emacs.d/private/init.el")
  (load-library "~/.emacs.d/private/init.el"))
