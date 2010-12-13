(require 'tabbar)
(tabbar-mode t)

(setq tabbar-buffer-groups-function
      (lambda ()
        (if (or (string= (substring (buffer-name) 0 1) "*")
                (string= (substring (buffer-name) 0 2) " *"))
            (list "Special Buffers")
          (list "Files"))))

(setq
 tabbar-buffer-home-button (quote (("") ""))
 tabbar-scroll-left-button (quote (("") ""))
 tabbar-scroll-right-button (quote (("") "")))

(set-face-attribute
 'tabbar-default nil
 :background "grey20")
(set-face-attribute
 'tabbar-highlight nil
 :underline nil)
(set-face-attribute
 'tabbar-unselected nil
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :foreground (face-foreground 'default)
 :background (face-background 'default)
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :box '(:line-width 1))

;; Place a space around the label to make it look less crowded
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
        (concat " " (concat ad-return-value " "))))

(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)
