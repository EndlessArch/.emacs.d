;; user/misc/u-buffers.el

(use-package nyan-mode
  :ensure t
  :init
  :config
  (nyan-start-animation)
  (nyan-stop-music)
  (add-hook 'prog-mode-hook 'nyan-mode)
  )

(use-package treemacs
  :ensure t
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
