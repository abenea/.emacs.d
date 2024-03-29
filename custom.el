(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((c-mode . "stroustrup")
     (c++-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(cc-other-file-alist
   '(("\\.cc\\'"
      (".hh" ".h"))
     ("\\.hh\\'"
      (".cc" ".C"))
     ("\\.c\\'"
      (".h"))
     ("\\.m\\'"
      (".h"))
     ("\\.h\\'"
      (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m"))
     ("\\.C\\'"
      (".H" ".hh" ".h"))
     ("\\.H\\'"
      (".C" ".CC"))
     ("\\.CC\\'"
      (".HH" ".H" ".hh" ".h"))
     ("\\.HH\\'"
      (".CC"))
     ("\\.c\\+\\+\\'"
      (".h++" ".hh" ".h"))
     ("\\.h\\+\\+\\'"
      (".c++"))
     ("\\.cpp\\'"
      (".hpp" ".hh" ".h"))
     ("\\.hpp\\'"
      (".cpp"))
     ("\\.cxx\\'"
      (".hxx" ".hh" ".h"))
     ("\\.hxx\\'"
      (".cxx"))
     ("\\.ts\\'"
      (".html"))
     ("\\.html\\'"
      (".ts"))
     ("\\.ok\\'"
      (".in"))
     ("\\.in\\'"
      (".ok"))))
 '(cider-prompt-for-symbol nil)
 '(column-number-mode t)
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length 2)
 '(compilation-ask-about-save nil)
 '(css-indent-offset 2)
 '(custom-safe-themes t)
 '(default-frame-alist '((fullscreen . maximized)))
 '(emacsw32-eol-check-new-files t)
 '(emacsw32-eol-file-name-lf-list '(".*"))
 '(emacsw32-max-frames t)
 '(emacsw32-style-frame-title t)
 '(fill-column 80)
 '(gdb-many-windows nil)
 '(gdb-show-main t)
 '(global-auto-revert-mode t)
 '(ido-ignore-buffers
   '("\\` " "\\*Pymacs\\*" "\\*Messages\\*" "\\*nrepl-events\\*"))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(js3-consistent-level-indent-inner-bracket t)
 '(js3-enter-indents-newline t)
 '(mouse-yank-at-point t)
 '(nrepl-hide-special-buffers t)
 '(quote (show-paren-mode t))
 '(save-interprogram-paste-before-kill t)
 '(savehist-mode t)
 '(split-width-threshold 200)
 '(typescript-indent-level 2)
 '(use-package-always-ensure t)
 '(virtualenv-workon-starts-python nil)
 '(which-function-mode t)
 '(yas-prompt-functions
   '(yas-ido-prompt yas-dropdown-prompt yas-completing-prompt yas-x-prompt yas-no-prompt)))
