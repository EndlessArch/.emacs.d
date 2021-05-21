;; user/input/u-mouse.el

(use-package disable-mouse
  :ensure t
  :init
  ;
  :config
  (setq
   disable-mouse-mode-lighter " :maus"
   disable-mouse-mode-global-lighter " maus"
   )
  (add-hook 'after-init-hook 'global-disable-mouse-mode)
  )
