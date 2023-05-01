;; (use-package paredit)

(use-package cider
  :config
  ;; (add-hook 'cider-repl-mode-hook 'paredit-mode)
  ;; The nrepl out middleware will capture *out* but not System/out or System/err
  ;; To work around this we redirect System/out and System/err to *out*
  ;; This needs {:repl {:dependencies [commons-io/commons-io "2.4"]}} in ~/.lein/profiles.clj
  ;; (add-hook 'cider-connected-hook
  ;;           (lambda ()
  ;;             (cider-nrepl-sync-request:eval
  ;;              "(let [ps (java.io.PrintStream. (org.apache.commons.io.output.WriterOutputStream.
  ;;                                             *out* \"UTF-8\" 1024 true))]
  ;;                 (System/setOut ps)
  ;;                 (System/setErr ps))")))
  )

(use-package clojure-mode
  :init
  (defun clojure-reload-eval-last ()
    (interactive)
    (with-current-buffer (cider-current-repl-buffer)
      (cider-refresh)
      (cider-tooling-eval (nth 0 cider-repl-input-history)
                          (cider-interactive-eval-handler (current-buffer)))))
  :config
  (bind-keys :map clojure-mode-map
             ("C-c C-z" . cider-jack-in)
             ("C-c C-v" . clojure-reload-eval-last))
  ;; (add-hook 'clojure-mode-hook 'paredit-mode)
  ;; (add-hook 'clojure-mode-hook
  ;;           (lambda ()
  ;;             (clj-refactor-mode 1)
  ;;             (cljr-add-keybindings-with-prefix "C-c C-s")))
  )

;; (use-package clj-refactor)
