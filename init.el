;; -*- lexical-binding: t; -*-

;; set up package manager
(setq straight-use-package-by-default t
      use-package-always-defer t
      straight-cache-autoloads t
      straight-vc-git-default-clone-depth 1
      straight-check-for-modifications '(find-when-checking)
      package-enable-at-startup nil
      vc-follow-symlinks t)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

;; for profiling startup
(use-package esup
  :demand t
  :commands esup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((c-mode . "stroustrup")
     (c++-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(cc-other-file-alist
   '(("\\.cc\\'"
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
      (".ok"))))
 '(cider-prompt-for-symbol nil)
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length 2)
 '(compilation-ask-about-save nil)
 '(css-indent-offset 2)
 '(custom-safe-themes
   '("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "135bbd2e531f067ed6a25287a47e490ea5ae40b7008211c70385022dbab3ab2a" default))
 '(default-frame-alist '((fullscreen . maximized)))
 '(emacsw32-eol-check-new-files t)
 '(emacsw32-eol-file-name-lf-list '(".*"))
 '(emacsw32-max-frames t)
 '(emacsw32-style-frame-title t)
 '(fill-column 80)
 '(gdb-many-windows nil)
 '(gdb-show-main t)
 '(ido-ignore-buffers
   '("\\` " "\\*Pymacs\\*" "\\*Messages\\*" "\\*nrepl-events\\*"))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(js3-consistent-level-indent-inner-bracket t)
 '(js3-enter-indents-newline t)
 '(menu-bar-mode nil)
 '(mouse-yank-at-point t)
 '(nrepl-hide-special-buffers t)
 '(package-selected-packages
   '(centaur-tabs esup company-tern flycheck tide ng2-mode lua-mode eglot company-lsp lsp-ui company-go go-mode js3-mode tern company flycheck-mypy lsp-mode lsp-imenu projectile pyvenv yapfify smart-mode-line-powerline-theme yasnippet use-package dpkg-dev-el))
 '(rst-level-face-base-color "black")
 '(show-paren-mode t)
 '(sml/extra-filler -5)
 '(sml/theme 'powerline)
 '(speedbar-supported-extension-expressions
   '(".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".ts" ".css"))
 '(speedbar-use-images nil)
 '(split-width-threshold 200)
 '(sr-speedbar-auto-refresh nil)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(uniquify-buffer-name-style 'forward nil (uniquify))
 '(use-package-always-ensure t)
 '(virtualenv-workon-starts-python nil)
 '(warning-suppress-types '((comp) (comp)))
 '(which-function-mode t)
 '(yas-prompt-functions
   '(yas-ido-prompt yas-dropdown-prompt yas-completing-prompt yas-x-prompt yas-no-prompt)))
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
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(use-package all-the-icons
  :demand)

(use-package centaur-tabs
  :demand
  :defer 1
  :after all-the-icons
  :config
  (centaur-tabs-headline-match)
  (centaur-tabs-enable-buffer-reordering)
  (centaur-tabs-mode t)
  :custom
  (centaur-tabs-style "bar")
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-height 28)
  (centaur-tabs-gray-out-icons 'buffer)
  (centaur-tabs-modified-marker "")
  (uniquify-separator "/")
  (uniquify-buffer-name-style 'forward)
  :bind
  ("s-<left>" . centaur-tabs-backward)
  ("s-<right>" . centaur-tabs-forward))

(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

(use-package smart-mode-line-powerline-theme)
(use-package smart-mode-line
  :config (sml/setup))

(add-to-list 'load-path "~/.emacs.d/my")
(load-library "my-global-keybindings.el")
(load-library "my-trailing-whitespace.el")
(load-library "my-ido.el")
(load-library "my-python.el")
(load-library "my-org.el")
(load-library "my-javascript.el")
(load-library "my-go.el")
(load-library "my-cpp.el")
;; (load-library "my-cperl.el")
;; (load-library "my-tide.el")
;; (load-library "my-clojure.el")
;; (load-library "my-presentation.el")
