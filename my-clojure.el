(defvar my-packages '(clojure-mode
                      clojure-test-mode
                      cider
                      paredit
                      paredit-menu
                      clj-refactor))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'paredit-menu)
(require 'slamhound)
(require 'clj-refactor)
(setq nrepl-hide-special-buffers t)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
