;; u-dev.el

(use-package projectile
  :ensure t
  :init
  (add-hook 'after-init-hook 'projectile-global-mode)
  :config
  (setq projectile-enable-caching t)
  )

(use-package company
  :ensure t
  :init
  (progn
    (add-hook 'after-init-hook 'global-company-mode t)
    )
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 1
	company-show-numbers nil
	)
  )

(use-package company-quickhelp
  :ensure t
  :init
  (progn
    (add-hook 'after-init-hook 'company-quickhelp-mode)
    )
  :config
  ;
  )

(use-package company-box
  :ensure t
  :init
  ;; (progn
  ;;  (add-hook 'after-init-hook 'company-box-mode)
  ;;   )
  :hook (company-mode . company-box-mode)
  :config
  (setq company-box-doc-delay 0
	company-box--numbers-pos nil
	)
  )

(use-package lsp-mode
  :ensure t
  :hook (
	 (c-mode . lsp)
	 (c++-mode . lsp)
	 (cmake-mode . lsp)
	 )
  :init
  (add-hook 'after-init-hook 'lsp-mode)
  :config
  ;
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :init
  (add-hook 'after-init-hook 'lsp-ui-mode)
  :config
  ;
  :commands lsp-ui-mode
  )

(use-package company-lsp
  :ensure t
  :init
  :config
  (push 'company-lsp company-backends)
  )
  
(use-package org
  :ensure t
  :init
  :config
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  )

(use-package yasnippet
  :ensure t
  :init
  :config
  )
