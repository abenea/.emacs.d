(defvar my-packages '(clojure-mode
                      cider
                      slamhound
                      paredit
                      clj-refactor))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'slamhound)
(require 'clj-refactor)
(setq nrepl-hide-special-buffers t)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; output sent to System/out goes to the *nrepl-server* buffer, but *out* goes
;; to the repl window; so redirect System/out to *out*
(add-hook 'nrepl-connected-hook
          (lambda ()
            (nrepl-send-string-sync "(System/setOut (java.io.PrintStream. (org.apache.commons.io.output.WriterOutputStream. *out*)))")))

(defun buffer-contains (fragment)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (search-forward fragment nil t))))

(defun clojure-reload-and-test ()
  (interactive)
  (save-window-excursion
    (save-excursion
      (when (or (buffer-contains "clojure.test") (buffer-contains "midje.sweet"))
        (clojure-jump-between-tests-and-code))
      (cider-load-current-buffer)
      (clojure-jump-between-tests-and-code)
      (cider-load-current-buffer)
      (when (buffer-contains "clojure.test")
        (clojure-test-run-tests)))))

(defun clojure-reload-eval-last ()
  (interactive)
  (with-current-buffer (cider-current-repl-buffer)
    (cider-tooling-eval
     (concat "(clojure.core/require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)"
             (nth 0 cider-repl-input-history))
     (cider-interactive-eval-handler (current-buffer)))))

(add-hook 'clojure-mode-hook
          (lambda ()
            (local-set-key "" 'cider-jack-in)
            (local-set-key "" 'clojure-reload-eval-last)
            (local-set-key [f12] 'clojure-jump-between-tests-and-code)
            (local-set-key [C-f12] 'clojure-reload-and-test)
            (clj-refactor-mode 1)
            (cljr-add-keybindings-with-prefix "C-c C-s")
            (define-clojure-indent
              (facts 1)
              (fact 1))))
