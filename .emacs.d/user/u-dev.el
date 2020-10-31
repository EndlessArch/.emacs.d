;; u-dev.el

; ignore completion cases
(setq completion-ignore-case t)

; indentation

(setq-default indent-tabs-mode nil) ; not using tabs as an indent

(defun u/:c-c++/:indentation/:hook ()
  (setq tab-width 3)
  )

(add-hook 'c++-mode-hook 'u/:c-c++/:indentation/:hook)

; packages

(use-package projectile
  :ensure t
  :init
  (add-hook 'after-init-hook 'projectile-global-mode)
  :config
  (setq projectile-enable-caching t)
  )

(use-package ivy
  :ensure t
  :init
  :config
  ;
  )

(use-package company
  :ensure t
  ;; :bind ("C-<tab>" . 'company-complete)
  :init
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
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
  ;; :hook (company-mode . company-box-mode)
  :config
  (defun u/:company/:company-box-init-func ()
    (setq company-box-doc-delay 0
	  company-box--numbers-pos nil
	  )
    )
  (add-hook 'company-mode-hook 'u/:company/:company-box-init-func)
  )

;; (use-package lsp-mode
;;   :ensure t
;;   :hook (
;; 	 (c-mode . lsp)
;; 	 (c++-mode . lsp)
;; 	 (cmake-mode . lsp)
;; 	 )
;;   :init
;;   (add-hook 'after-init-hook 'lsp-mode)
;;   :config
;;   :commands lsp)

;; (use-package lsp-ui
;;   :ensure t
;;   :init
;;   (add-hook 'after-init-hook 'lsp-ui-mode)
;;   :config
;;   ;
;;   :commands lsp-ui-mode
;;   )

;; indeed, company-capf
;; (use-package company-lsp
;;   :ensure t
;;   :init
;;   :config
;;   (push 'company-lsp company-backends)
;;   )
  
(use-package org
  :ensure t
  :init
  :config
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  )

(use-package yasnippet
  :ensure t
  :init
  (add-hook 'after-init-hook 'yas-global-mode)
  :config
  ;; (add-to- ; company-yasnippet
  )

;; (use-package rmsbolt
;;   :ensure t
;;   :init
;;   :config
;;   )
