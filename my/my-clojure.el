(use-package paredit)

(use-package cider
  :config
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode))

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
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (cljr-add-keybindings-with-prefix "C-c C-s"))))

(use-package clj-refactor)
