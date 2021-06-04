;; u-dev.el

; ignore completion cases
(setq completion-ignore-case t)

; indentation

(setq-default indent-tabs-mode nil) ; not using tabs as an indent

;; (defun u/:c-c++/:indentation/:hook ()
;;   (setq tab-width 3)
;;   )

;; (add-hook 'c++-mode-hook 'u/:c-c++/:indentation/:hook)

; packages

;;; ref: https://github.com/ubolonton/emacs-tree-sitter/issues/41
(use-package tree-sitter
  :ensure t
  :if (executable-find "tree-sitter")
  :hook (
         (after-init . global-tree-sitter-mode)
         (tree-sitter-after-on . tree-sitter-hl-mode)

         ((c-mode
           c++-mode
           rust-mode
           java-mode
           python-mode)
          . tree-sitter-mode))
  :init
  (let ((path (directory-file-name (executable-find "tree-sitter"))))
    (add-to-list 'load-path (expand-file-name (concat path "/core")))
    (add-to-list 'load-path (expand-file-name (concat path "/lisp")))
    (add-to-list 'load-path (expand-file-name (concat path"/langs")))

    (add-to-list 'exec-path (expand-file-name (concat path"/bin")))
    (add-to-list 'exec-path (expand-file-name (concat path "~/langs/bin")))
    )

  ;; (add-to-list 'tree-sitter-load-path
  (setq tree-sitter-load-path
        (list
         (expand-file-name "~/.emacs.d/elpa/tree-sitter-langs-20210314.1704/bin")))
  :config
  (tree-sitter-require 'c)
  (tree-sitter-require 'cpp)
  (tree-sitter-require 'rust)
  (tree-sitter-require 'java)
  (tree-sitter-require 'python)
  ; no emacs-lisp-mode
  )

;; (use-package tree-sitter-indent
;;   :disabled t ; DISABLED
;;   :ensure t
;;   :after tree-sitter
;;   :hook (tree-sitter-after-on . tree-sitter-indent-mode)
;;   :init
;;   :config
;;   )

(use-package tree-sitter-langs
  :ensure t
  :if (executable-find "tree-sitter")
  :demand t
  :after tree-sitter
  :hook (after-init . (lambda ()
                        (tree-sitter-langs-install-grammers t)))
  :init
  :config
  )

(use-package projectile
  :ensure t
  :init
  (add-hook 'after-init-hook 'projectile-global-mode)
  :config
  (setq
   projectile-enable-caching t
   projectile-mode-line-lighter " proj"
   )
  )

(use-package ivy
  :ensure t
  :after projectile
  :hook (
         (after-init . ido-mode)
         (after-init . ivy-mode)
         )
  :init
  :config
  (setq
   ivy-use-virtual-buffers t

   ; use ivy as a default completion system.
   projectile-completion-system 'ivy

   ivy-use-selectable-prompt t
   )
  )

(use-package company
  :ensure t
  ;; :bind ("C-<tab>" . 'company-complete)
  :init
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    )
  :config
  ;; (defun company-set-cpp-version (version)
  ;;   (interactive)
  ;;   (let* ((is-available nil)
  ;;          (is-option-exists nil))
  ;;     (cond ((eq version "98") (setq-local (is-available t)))
  ;;           ((eq version "03") (setq-local (is-available t)))
  ;;           ((or (eq version "11")
  ;;                (eq version "0x")) (setq-local (is-available t)))
  ;;           ((or (eq version "14")
  ;;                (eq version "0y")) (setq-local (is-available t)))
  ;;           ((or (eq version "17")
  ;;                (eq version "0z")) (setq-local (is-available t)))
  ;;           ((or (eq version "20")
  ;;                (eq version "2a")) (setq-local (is-available t))))

  ;;     (cond ((is-available)
  ;;            (cond ((eq company-clang-arguments nil)
  ;;                   (setq company-clang-arguments (list (concat "-std=c++" version))))
  ;;                  (t
  ;;                   (catch 'break
  ;;                     (dolist (i company-clang-arguments)
  ;;                       (if (string-match "-std=c++.*")
  ;;                           (progn
  ;;                             (remove i company-clang-arguments)
  ;;                             (add-to-list 'company-clang-arguments
  ;;                                          (concat "-std=c++" version)))
  ;;                         (throw 'break i)))))
  ;;                  ))
  ;;           (t (error "Invalid version!")))))

  ; won't use company-clang
  (setq company-backends
        (delete 'company-capf
                (delete 'company-clang company-backends)))

  (setq company-idle-delay 0 ; SHOULD BE CONSIDERED
        company-dabbrev-downcase 0
	company-minimum-prefix-length 1
	company-show-numbers nil

        ;; ; clang
        ;; company-clang-arguments `(
        ;;                           "-std=c++2a"
        ;;                           ,(cond
        ;;                             ((eq system-type 'darwin)
        ;;                              "-isystem=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include")
        ;;                             ((eq system-type 'Linux) ; Linux
        ;;                              "")
        ;;                             (t "") ; Windows
        ;;                             ))
	)
  )

(use-package company-quickhelp
  :disabled t
  :init
  (progn
    (add-hook 'after-init-hook 'company-quickhelp-mode)
    )
  :config
  ;
  )

(use-package company-box
  ;; :disabled t ; DISABLED
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

;; (use-package eglot
;;   :disabled t
;;   :ensure t
;;   :init
;;   :config

;;   ; delete ccls
;;   (setq eglot-server-programs
;;         (delete `((c++-mode c-mode) "ccls") eglot-server-programs))

;;   ;; ; delete pyls
;;   ;; (setq eglot-server-programs
;;   ;;       (delete `(python-mode "pyls") eglot-server-programs))

;;   ; add clangd
;;   (add-to-list 'eglot-server-programs
;;                (append `((c++-mode c-mode) ,u/:c-c++/:clangd-executable) u/:c-c++/:clangd-args))

;;   ; add cmakels
;;   (add-to-list 'eglot-server-programs
;;                (append `(cmake-mode "cmakels")))

;;   ; add pyright
;;   (add-to-list 'eglot-server-programs
;;                (append `(python-mode "pyls")))
  
;;   :hook ((
;;           c-mode
;;           c++-mode
;;           rust-mode
;;           java-mode
;;           python-mode)
;;          . eglot-ensure)
;;   )

(use-package lsp-mode
  ;; :disabled t ; DISABLED
  :straight (lsp-mode :type git :host github :repo "EndlessArch/lsp-mode")
  ;; :ensure t
  :hook (
	 (c-mode . lsp)
	 (c++-mode . lsp)
	 (cmake-mode . lsp)
         (rust-mode . lsp)
         (java-mode . lsp)
         (python-mode . lsp)

         ;; (after-init . lsp)
	 )
  ;; :init
  ;; (add-hook 'after-init-hook 'lsp-mode)
  :config

  (setq
   lsp-keep-workspace-alive nil ; error: buffer has no process
   lsp-flycheck-default-level 'info
   )
  
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :hook (
         (lsp-mode . lsp-ui-mode)
         )
  :config
  
  (setq
   lsp-ui-sideline-enable t

   ; show diagnostics at sideline
   lsp-ui-sideline-show-diagnostics t

   lsp-ui-sideline-code-actions-prefix ""
   lsp-ui-sideline-ignore-duplicate t
   lsp-ui-sideline-show-symbol nil
   lsp-ui-sideline-show-hover t
   lsp-ui-sideline-show-code-actions nil
   lsp-ui-sideline-update-mode 'point
   lsp-ui-sideline-delay 0.5
   )

  ;; lsp-ui-doc
  (setq
   lsp-ui-doc-enable t
   lsp-ui-doc-position 'at-point ;'top
   lsp-ui-doc-delay 0.5
   lsp-ui-doc-show-with-cursor t
   lsp-ui-doc-show-with-mouse t

   lsp-ui-doc-header t
   lsp-ui-doc-use-childframe nil;t

   ; colors
   ;; lsp-ui-doc-header
   ;; lsp-ui-doc-background
   )

  ;; (set-face-background lsp-ui-doc-header :background

  ;; lsp-ui-menu
  (setq
   ;; lsp-ui-imenu-window-width
   ;; lsp-ui-imenu--custom-mode-line-format
   lsp-ui-imenu-auto-refersh nil
   ;; lsp-ui-imenu-refresh-delay 0.5
   )

  ;; ;; lsp-ui-peek
  ;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  ;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  
  (setq
   lsp-ui-peek-enable t
   lsp-ui-peek-show-directory t
   )

  ; COLOR ATTRIBUTES

  ;; (custom-set-faces
  ;;  '(lsp-ui-background ((t :background "#ff00ff")))
  ;;  '(

  ; Mac OS cache file
  (add-to-list 'lsp-file-watch-ignored ".DS_Store")

  :commands lsp-ui-mode
  )

(use-package lsp-treemacs
  :disabled t
  :hook (
         (lsp-mode . lsp-treemacs-sync-mode)
         (lsp-mode . lsp-treemacs-errors-list)
         )
  :init
  :config
  )

;; indeed, company-capf
;; (use-package company-lsp
;;   :ensure t
;;   :init
;;   :config
;;   (push 'company-lsp company-backends)
;;   )
  
;; (use-package org
;;   :ensure t
;;   :init
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;   )

;; (use-package yasnippet
;;   :disabled t
;;   :ensure t
;;   :init
;;   (add-hook 'after-init-hook 'yas-global-mode)
;;   :config
;;   ;; (add-to- ; company-yasnippet
;;   )

;; (use-package rmsbolt
;;   :ensure t
;;   :init
;;   :config
;;   )
