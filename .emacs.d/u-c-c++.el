;; u-c-c++.el
;; C C++ CMake rtags ...

(use-package rtags
  :ensure t
  :init
  :config
  (setq rtags-completions-enabled t
	rtags-autostart-diagnostics t
	rtags-path u/:c-c++/:rtags-path
	)
  (rtags-enable-standard-keybindings)
  )

(use-package helm-rtags
  :ensure t
  :init
  :config
  (setq rtags-use-helm t)
  )

(use-package company-rtags
  :ensure t
  :init
  :config
  (setq rtags-company-enabled t)
  (add-to-list 'company-backends 'company-rtags)
  )

(use-package flycheck-rtags
  :ensure t
  :init
  :config
  (defun u/:c-c++/:flycheck-rtags-setup ()
    (flycheck-select-checker 'rtags)
    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil)
    )
  (add-hook 'c-mode-common-hook
	    #'u/:c-c++/:flycheck-rtags-setup)
  )


(setq lsp-clangd-executable "/usr/local/opt/llvm/bin/clangd"
      lsp-clients-clangd-args "-std=c++2a"
      )
;; (use-package lsp-clangd
;;   :ensure t
;;   :load-path "~/.emacs.d/lsp-clangd"
;;   :init
;;   (when (eq system-type 'darwin)
;;     (setq lsp-clangd-executable "/usr/local/opt/llvm/bin/clangd"
;; 	  lsp-clients-clangd-args "-std=c++2a"
;; 	  )
;;     )
;;   :config
;;   (add-hook 'c-mode-hook #'lsp-clangd-c-enable)
;;   (add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
;;   (add-hook 'objc-mode-hook #'lsp-clangd-objc-enable)
;;   )
 
(use-package cmake-ide
  :ensure t
  :init
  ;; :hook (after-init-hook . cmake-ide-mode)
  :config
  (setq cmake-ide-rdm-executable u/:c-c++/:rdm-executable
	cmake-ide-rdm-rc-path u/:c-c++/:rtags-path
	cmake-ide-cmake-command u/:c-c++/:cmake-executable
	;; cmake-ide-rc-executable "/usr/local/Cellar/rtags/2.38/bin/rc"

	cmake-ide-flags-c++ '(
			      "-I/usr/local/include/c++/*/"
			      )
	)

  (cmake-ide-setup)
  )
