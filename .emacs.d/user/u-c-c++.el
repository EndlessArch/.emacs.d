;; user/u-c-c++.el
;; C C++ CMake rtags ...

; packages

(use-package rtags
  :ensure t
  :init
  :config
  (setq rtags-completions-enabled t
	rtags-autostart-diagnostics t

        rtags-rc-log-enabled t

	rtags-path u/:c-c++/:rtags-path

        rtags-rc-config-path u/:c-c++/:rdm-rc-config-path
        rtags-rdm-includes u/:c-c++/:system-include-path
	)
  (rtags-diagnostics)
  (rtags-enable-standard-keybindings)
  )

(use-package helm-rtags
  :ensure t
  :init
  :config
  (setq rtags-use-helm t)
  )

(use-package company-c-headers
  :ensure t
  :init
  :config
  (setq company-c-headers-path-user u/:c-c++/:system-include-path)
  
  (add-to-list 'company-backends 'company-c-headers)
  )

(use-package company-rtags
  :ensure t
  :init
  :config
  (setq rtags-company-enabled t)
  (add-to-list 'company-backends 'company-rtags)
  )

(use-package flycheck-clang-tidy
  :ensure t
  :init
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup)
  :config
  (flycheck-add-next-checker 'c/c++-clang-tidy 'c/c++-clang)
  ;; (flycheck-add-next-checker 'c/c++-clang-tidy 'c/c++-gcc) ; linux
  )

(use-package flycheck-rtags
  :ensure t
  :after flycheck-clang-tidy
  :init
  :config
  (setq
   flycheck-clang-include-path u/:c-c++/:system-include-path

   flycheck-c/c++-clang-executable u/:c-c++/:clang-executable
   flycheck-c/c++-clang-tidy-executable u/:c-c++/:clang-tidy-executable
   )
  (defun u/:c-c++/:flycheck-rtags-setup ()
    (flycheck-select-checker 'c/c++-clang)
    (flycheck-select-checker 'c/c++-clang-tidy)

    (flycheck-select-checker 'rtags)
    (setq-local flycheck-highlighting-mode t) ;nil)
    (setq-local flycheck-check-syntax-automatically nil)
    )
  (add-hook 'c-mode-common-hook ; 'c++-mode-hook
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
  (setq ;; cmake-ide-rdm-executable
        cide--rdm-executable u/:c-c++/:rdm-executable

	cmake-ide-rdm-rc-path u/:c-c++/:rdm-rc-config-path ;; u/:c-c++/:rtags-path
	cmake-ide-cmake-command u/:c-c++/:cmake-executable
	;; cmake-ide-rc-executable "/usr/local/Cellar/rtags/2.38/bin/rc"

        ;; cmake-ide-flags-c++ (concat "-I" u/:c-c++/:system-include-path)
        cmake-ide-flags-c++ (list (concat "-I" u/:c-c++/:system-include-path))
	)

  (cmake-ide-setup)
  )

(require 'cmake-mode)
;; (use-package cmake-mode
;;   :ensure t
;;   :pin melpa
;;   :init
;;   :config
;;   )

(use-package company-cmake
  :ensure t
  :init
  :config
  ;; (add-to-list 'company-backends 'company-cmake)
  (push 'company-cmake company-backends)
  )
