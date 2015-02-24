(put 'narrow-to-page 'disabled nil)

(defun enable-presentation ()
  (interactive)
  (local-set-key [M-down]
                 (lambda ()
                   (interactive)
                   (narrow-to-page 1)))
  (local-set-key [M-up]
                 (lambda ()
                   (interactive)
                   (narrow-to-page -1)
                   (beginning-of-buffer)))
  ;;(set-default-font "-*-courier-medium-r-normal-*-20-*-*-*-*-*-*")
  )

(defun disable-presentation ()
  (interactive)
  (local-unset-key [M-down])
  (local-unset-key [M-up])
  ;;(set-default-font "-*-fixed-medium-r-normal-*-*-140-75-75-*-*-*")
  )
