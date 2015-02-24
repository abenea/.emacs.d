(require 'generic-x)

(define-generic-mode 'frankenstein-text-mode
  '("#")                               ;; comments start with '#'
  '()                                  ;; keywords
  '(("^\\$ .*" . 'font-lock-builtin-face)
    (" re$" . 'font-lock-variable-name-face)
    ("^SQL> .*" . 'font-lock-variable-name-face))
  '("\\.t$")                           ;; files for which to activate this mode 
  nil                                  ;; other functions to call
  "A mode for frankenstein text tests")
