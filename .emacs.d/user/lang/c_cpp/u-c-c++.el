;; user/lang/c_cpp/u-c-c++.el
;; C C++

(use-package modern-cpp-font-lock
  :ensure t
  :init
  (add-hook 'after-init-hook 'modern-c++-font-lock-global-mode)
  :config
  ;
  )

(use-package clang-format
  :ensure t
  :bind (("C-c C-f" . 'clang-format-region))
  :init
  :config
  ;
  )

(use-package company-c-headers
  :ensure t
  :init
  :config
  ;; (setq company-c-headers-path-user u/:c-c++/:system-include-path)
  
  (add-to-list 'company-backends 'company-c-headers)
  )

;; (use-package flycheck-clang-tidy
;;   :ensure t
;;   :init
;;   :hook
;;   (flycheck-mode . flycheck-clang-tidy-setup)
;;   :config
;;   (flycheck-add-next-checker 'c/c++-clang-tidy 'c/c++-clang)
;;   ;; (flycheck-add-next-checker 'c/c++-clang-tidy 'c/c++-gcc) ; linux
;;   )

;; (setq lsp-clangd-executable "/usr/local/opt/llvm/bin/clangd"
;;       lsp-clients-clangd-args "-std=c++2a"
;;       )

;

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
