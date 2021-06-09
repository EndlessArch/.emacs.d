;; user/lang/c_cpp/u-c-c++.el
;; C C++

(setq
 lsp-clangd t
 lsp-ccls nil
 lsp-clients-clangd-executable u/:c-c++/:clangd-executable
 lsp-clients-clangd-args u/:c-c++/:clangd-args
      )

;; (use-package ccls
;;   :disabled t
;;   :ensure t
;;   :config
;;   (setq ccls-executable (executable-find "ccls"))
;;   )

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
  ;; (defconst u/:c-c++/:indent/:ns
  ;;   '("gnu"
  ;;     (c-offset-alist . ((innamespace . [0])))))
  ;; (c-add-style "u/:c-c++/:indent/:ns" u/:c-c++/:indent/:ns)

  (setq clang-format-style-option "llvm")
  )

(use-package company-c-headers
  :ensure t
  :init
  :config
  ;; (setq company-c-headers-path-user u/:c-c++/:system-include-path)
  
  (add-to-list 'company-backends 'company-c-headers)
  )

(use-package disaster
  :disabled t
  :init
  :config
  (define-key global-map (kbd "C-c d") 'disaster)
  )
