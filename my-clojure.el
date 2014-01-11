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

(defun clojure-reload-and-test ()
  (interactive)
  (save-excursion
    (if (clojure-test-mode)
        (cider-load-current-buffer)
        (clojure-jump-between-tests-and-code))
    (clojure-test-run-tests)))

(add-hook 'clojure-mode-hook
          (lambda ()
            (local-set-key [f12] 'clojure-jump-between-tests-and-code)
            (local-set-key [C-f12] 'clojure-reload-and-test)))
