(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   (quote
    ((c-mode . "stroustrup")
     (c++-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(cc-other-file-alist
   (quote
    (("\\.cc\\'"
      (".hh" ".h"))
     ("\\.hh\\'"
      (".cc" ".C"))
     ("\\.c\\'"
      (".h"))
     ("\\.m\\'"
      (".h"))
     ("\\.h\\'"
      (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m"))
     ("\\.C\\'"
      (".H" ".hh" ".h"))
     ("\\.H\\'"
      (".C" ".CC"))
     ("\\.CC\\'"
      (".HH" ".H" ".hh" ".h"))
     ("\\.HH\\'"
      (".CC"))
     ("\\.c\\+\\+\\'"
      (".h++" ".hh" ".h"))
     ("\\.h\\+\\+\\'"
      (".c++"))
     ("\\.cpp\\'"
      (".hpp" ".hh" ".h"))
     ("\\.hpp\\'"
      (".cpp"))
     ("\\.cxx\\'"
      (".hxx" ".hh" ".h"))
     ("\\.hxx\\'"
      (".cxx"))
     ("\\.ts\\'"
      (".html"))
     ("\\.html\\'"
      (".ts"))
     ("\\.ok\\'"
      (".in"))
     ("\\.in\\'"
      (".ok")))))
 '(cider-prompt-for-symbol nil)
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length 2)
 '(compilation-ask-about-save nil)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "135bbd2e531f067ed6a25287a47e490ea5ae40b7008211c70385022dbab3ab2a" default)))
 '(default-frame-alist (quote ((fullscreen . maximized))))
 '(ecb-layout-name "right-directories")
 '(ecb-options-version "2.40")
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-tip-of-the-day nil)
 '(emacsw32-eol-check-new-files t)
 '(emacsw32-eol-file-name-lf-list (quote (".*")))
 '(emacsw32-max-frames t)
 '(emacsw32-style-frame-title t)
 '(fill-column 80)
 '(gdb-many-windows nil)
 '(gdb-show-main t)
 '(ido-ignore-buffers
   (quote
    ("\\` " "\\*Pymacs\\*" "\\*Messages\\*" "\\*nrepl-events\\*")))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(js3-consistent-level-indent-inner-bracket t)
 '(js3-enter-indents-newline t)
 '(menu-bar-mode nil)
 '(mouse-yank-at-point t)
 '(nrepl-hide-special-buffers t)
 '(package-selected-packages
   (quote
    (company-lsp lsp-ui company-go go-mode js3-mode company-tern tern company flycheck-mypy lsp-mode lsp-imenu projectile pyvenv yapfify smart-mode-line-powerline-theme yasnippet use-package dpkg-dev-el)))
 '(rst-level-face-base-color "black")
 '(show-paren-mode t)
 '(sml/extra-filler -5)
 '(sml/theme (quote powerline))
 '(speedbar-supported-extension-expressions
   (quote
    (".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".ts" ".css")))
 '(speedbar-use-images nil)
 '(split-width-threshold 200)
 '(sr-speedbar-auto-refresh nil)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(use-package-always-ensure t)
 '(virtualenv-workon-starts-python nil)
 '(which-function-mode t)
 '(yas-prompt-functions
   (quote
    (yas-ido-prompt yas-dropdown-prompt yas-completing-prompt yas-x-prompt yas-no-prompt))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "wheat"))))
 '(minibuffer-noticeable-prompt ((((class color) (min-colors 88) (background light)) nil)))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "gray5"))))
 '(which-func ((t nil))))

(column-number-mode t)
(setq cmake-tab-width 4)

;; Put backup files in ~/.emacs.d/backups instead of leaving them next to the original
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Process ANSI escape sequences for colors in compilation mode
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

(use-package smart-mode-line-powerline-theme)
(use-package smart-mode-line
  :config (sml/setup))

(add-to-list 'load-path "~/.emacs.d/my")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/private")

(load-library "my-global-keybindings.el")
(load-library "my-trailing-whitespace.el")
(load-library "my-ido.el")
(load-library "my-tabbar.el")
(load-library "my-python.el")
(load-library "my-org.el")
(load-library "my-javascript.el")
(load-library "my-go.el")
(load-library "my-cpp.el")
;; (load-library "my-cperl.el")
;; (load-library "my-tide.el")
;; (load-library "my-sr-speedbar.el")
;; (load-library "my-clojure.el")
;; (load-library "my-frankenstein.el")
;; (load-library "my-4clojure.el")
;; (load-library "my-nxhtml.el")
;; (load-library "my-presentation.el")
;; (require 'erin)

(when (file-exists-p "~/.emacs.d/private/init.el")
  (load-library "~/.emacs.d/private/init.el"))
