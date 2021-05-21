;; user/lang/c_cpp/u-rtags-set.el
;; C C++ CMake | Rtags

(use-package rtags
  :ensure t
  :init
  :config
  (setq rtags-completions-enabled t
	rtags-autostart-diagnostics t ; nil

        rtags-rc-log-enabled t

	rtags-path u/:c-c++/:rtags-path

        ;; rtags-rc-config-path u/:c-c++/:rdm-rc-config-path
        rtags-rdm-includes u/:c-c++/:system-include-path
	)
  ;; (rtags-diagnostics)
  (rtags-enable-standard-keybindings)
  )

;; (use-package helm-rtags
;;   :ensure t
;;   :init
;;   :config
;;   (setq rtags-use-helm t)
;;   )

;

(use-package company-rtags
  :ensure t
  :init
  :config
  (setq rtags-company-enabled t)
  (add-to-list 'company-backends 'company-rtags)
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
    (interactive)
    (flycheck-select-checker 'c/c++-clang)
    (flycheck-select-checker 'c/c++-clang-tidy)

    (flycheck-select-checker 'rtags)
    (setq-local flycheck-highlighting-mode t) ;nil)
    (setq-local flycheck-check-syntax-automatically nil)
    )

  (add-hook 'c-mode-common-hook ; 'c++-mode-hook
	    #'u/:c-c++/:flycheck-rtags-setup)

  (add-hook 'after-init-hook 'global-flycheck-mode t)

  )

(use-package cmake-ide
  :ensure quelpa
  :quelpa (cmake-ide :fetcher github :repo "EndlessArch/cmake-ide")
  :init
  ;; :hook (after-init-hook . cmake-ide-mode)
  :config
  (setq
   cmake-ide-cmake-command u/:c-c++/:cmake-executable
   cmake-ide-rc-executable u/:c-c++/:rc-executable
   ; cmake--rdm-executable u/:c-c++/:rdm-executable
   cmake-ide-rdm-executable u/:c-c++/:rdm-executable

   cmake-ide-rdm-rc-path nil ; u/:c-c++/:rdm-rc-config-path

;;   cide--rdm-args "-v" ; gg
   cide--rdm-args `(
                    "-v"
;;                    "-L" ,(expand-file-name "~/rl.log")
                    )

   ;;; Let know system include path
   ;; cmake-ide-flags-c++ (concat "-I" u/:c-c++/:system-include-path)
   cmake-ide-flags-c++ (list (concat "-isystem " ;"-I"
                                     u/:c-c++/:system-include-path))
   )

  ; (setq 

  (cmake-ide-setup)
  )

;; (require 'cmake-mode)
(use-package cmake-mode
  :ensure t
  :pin melpa
  :init
  :config
  )

(push 'company-cmake company-backends)
;; (use-package company-cmake
;;   :ensure t
;;   :init
;;   :config
;;   ;; (add-to-list 'company-backends 'company-cmake)
;;   (push 'company-cmake company-backends)
;;   )
