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

;; Move custom vars out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Put backup files in ~/.emacs.d/backups instead of leaving them next to the original
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Process ANSI escape sequences for colors in compilation mode
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;; for profiling startup
(use-package esup
  :demand t
  :commands esup)

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
  :init (sml/setup))

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
