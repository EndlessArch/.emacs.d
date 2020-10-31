;; user/misc/u-discord-rpc.el

(use-package elcord
  :ensure t
  :init
  :config
  (setq elcord--editor-name (concat
                             "GCC Emacs "
                             (format "v%d.%d" emacs-major-version emacs-minor-version)
                             ))
  (add-hook 'prog-mode-hook 'elcord-mode)
  )
