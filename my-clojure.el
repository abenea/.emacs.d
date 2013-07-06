(defvar my-packages '(clojure-mode
                      clojure-test-mode
                      nrepl
                      paredit
                      paredit-menu))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'paredit-menu)
(setq nrepl-hide-special-buffers t)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
