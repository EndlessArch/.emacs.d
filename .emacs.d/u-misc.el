;; u-misc.el

(use-package nyan-mode
  :ensure t
  :init
  :config
  (nyan-start-animation)
  (nyan-stop-music)
  (add-hook 'prog-mode-hook 'nyan-mode) ; when gui poped
  )

(use-package treemacs
  :ensure t
  :init
  :config
  ;
  )

;; ;; Not working on GUI-Emacs :(
;; (use-package yascroll
;;   :ensure t
;;   :init
;;   :hook (after-init-hook . (lambda ()
;; 			      (global-yascroll-bar-mode 1)
;; 			      ))
;;   :config
;;   ;; (global-yascroll-bar-mode 1)
;;   )

(use-package elcord
  :ensure t
  :init
  :config
  (setq elcord--editor-name "Emacs v28")
  (add-hook 'prog-mode-hook 'elcord-mode)
  )

(use-package which-key
  :ensure t
  :init
  (add-hook 'after-init-hook 'which-key-mode)
  :config
  (setq which-key-idle-delay 0.4)
  )

;(use-package mode-line-stats-mode
