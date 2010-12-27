(add-to-list 'load-path "~/.emacs.d/vendor/ecb")
(require 'ecb)
(global-set-key [f4]
                (lambda ()
                       (interactive)
                       (if (not ecb-minor-mode)
                           (ecb-activate)
                         (ecb-toggle-ecb-windows))))

(ecb-layout-define "right-directories" right nil
  (if (fboundp (quote ecb-set-directories-buffer)) (ecb-set-directories-buffer) (ecb-set-default-ecb-buffer))
  (dotimes (i 2) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))
  (dotimes (i 1) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))
  )
