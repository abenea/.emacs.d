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

(add-hook 'clojure-mode-hook
          (lambda ()
            (local-set-key "" 'cider-jack-in)
            (local-set-key [f12] 'clojure-jump-between-tests-and-code)
            (local-set-key [C-f12] 'clojure-reload-and-test)
            (define-clojure-indent
              (facts 1)
              (fact 1))))
