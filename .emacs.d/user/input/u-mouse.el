;; user/input/u-mouse.el

(use-package disable-mouse
  :ensure t
  :init
  ;
  :config
  (add-hook 'after-init-hook 'global-disable-mouse-mode)
  )
