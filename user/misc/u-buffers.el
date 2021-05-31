;; user/misc/u-buffers.el

;; IELM
(setq ielm-header "")
(setq ielm-prompt "IELM $ ")

(setq initial-scratch-message ";; ㅁㄴㅇㄹ\n")

(use-package nyan-mode
  :ensure t
  :hook ((window-setup . nyan-mode)
         (nyan-mode . nyan-start-animation)
         (nyan-mode . nyan-stop-music))
  :init
  :config
  ;; (nyan-start-animation)
  ;; (nyan-stop-music)
  ;; (add-hook ;; 'prog-mode-hook
  ;;  'window-setup-hook 'nyan-mode)
  )

(use-package vterm
  :ensure t
  :init
  :config
  ;
  )

(use-package treemacs
  :disabled t
  :straight (treemacs :type git :host github :repo "EndlessArch/treemacs")
  :init
  :config
  ;
  )

(use-package which-key
  :ensure t
  :init
  (add-hook 'after-init-hook 'which-key-mode)
  :config
  (setq which-key-idle-delay 0.4)
  )

; dependency for `doom-modeline'
(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :after all-the-icons
  :hook (after-init . doom-modeline-mode)
  :init
  :config
  (setq
   doom-modeline-icon nil ; (display-graphic-p)

   doom-modeline-height    20
   doom-modeline-bar-width 5

   doom-modeline-indent-info t
   )

  (setq
   inhibit-compacting-font-caches t
   )
  )

(use-package powerline
  :disabled t
  :hook (after-init . powerline-center-theme)
  :init
  :config
  )

(use-package nlinum-relative
  :ensure t
  :hook (prog-mode . nlinum-relative-mode)
  :init
  :config
  (setq
   nlinum-relative-redisplay-delay 0
   nlinum-relative-current-symbol  ">"
   nlinum-relative-offset          0
   )
  )

;; (use-package spinner
;;   :straight (spinner :type git :host github :repo "Malabarba/spinner.el")
;;   :after (doom-modeline unicode-fonts)
;;   :hook (after-change-major-mode . (lambda () (spinner-start 'moon)))
;;   )

;; (use-package unicode-fonts
;;   :hook (after-init . unicode-fonts-setup)
;;   )

(use-package emojify
  :disabled t
  :ensure t
  :hook (after-init . global-emojify-mode)
  :init
  :config
  )
