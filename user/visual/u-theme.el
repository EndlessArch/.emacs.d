;; u-theme.el

(use-package solarized-theme
  :ensure t
  :init
  :config
  )

(use-package jetbrains-darcula-theme
  :ensure t
  :init
  :config
  ) ; 'jetbrains-darcula

(use-package gruber-darker-theme
  :ensure t
  :init
  :config
  )

(use-package tron-legacy-theme
  :ensure t
  :init
  :config

  (setq
   tron-legacy-theme-dark-fg-bright-comments t
   tron-legacy-theme-vivid-cursor            t
   ;; tron-legacy-theme-softer-bg
   )

  (load-theme 'tron-legacy t)

  )

;; (load-theme 'gruber-darker t)
