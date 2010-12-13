(defalias 'perl-mode 'cperl-mode)
(setq cperl-invalid-face nil)
(add-hook 'cperl-mode-hook
          (lambda () (cperl-set-style "PerlStyle")))
(setq cperl-indent-parens-as-block t)
