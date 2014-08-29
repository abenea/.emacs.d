(defvar my-packages '(request))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/vendor/4clojure.el")
(require '4clojure)

(defadvice 4clojure/start-new-problem (after 4clojure-bindings (number))
  (local-set-key [f9] '4clojure-check-answers))

(ad-activate '4clojure/start-new-problem)
