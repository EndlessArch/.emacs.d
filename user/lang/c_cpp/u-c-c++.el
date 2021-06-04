;; user/lang/c_cpp/u-c-c++.el
;; C C++

(use-package modern-cpp-font-lock
  :ensure t
  :hook ((c-mode c++-mode) . modern-c++-font-lock-global-mode)
  :init
  ;; (add-hook 'after-init-hook 'modern-c++-font-lock-global-mode)
  :config
  )

(use-package google-c-style
  :hook (c-mode-common . google-set-c-style)
  )

(use-package clang-format
  :ensure t
  :bind (("C-c C-f" . 'clang-format-region))
  :init
  :config
  (defconst u/:c-c++/:indent/:ns
    '("gnu"
      (c-offset-alist . ((innamespace . [0])))))
  (c-add-style "u/:c-c++/:indent/:ns" u/:c-c++/:indent/:ns)
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

(setq lsp-clangd-executable u/:c-c++/:clangd-executable
      lsp-clients-clangd-args u/:c-c++/:clangd-args
      )

;; (use-package cmake-build
;;   :ensure t
;;   :init

;; (use-package lsp-clangd
;;   :ensure t
;;   :load-path "~/.emacs.d/lsp-clangd"
;;   :init
;;   (when (eq system-type 'darwin)
;;     (setq lsp-clangd-executable "/usr/local/Cellar/llvm/11.0.1/bin/clangd"
;;           lsp-clients-clangd-args "-std=c++2a"
;;           )
;;     )
;;   :config
;;   (add-hook 'c-mode-hook #'lsp-clangd-c-enable)
;;   (add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
;;   (add-hook 'objc-mode-hook #'lsp-clangd-objc-enable)
;;   )

(use-package disaster
  :ensure t
  :init
  :config
  (define-key global-map (kbd "C-c d") 'disaster)
  )
