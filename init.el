;; Package Settings
(require 'package)
(setq package-archives
      '(
	("melpa-stable" . "http://stable.melpa.org/packages/")
	("melpa" . "http://melpa.org/packages/")
;	("marmalade" . "http://marmalade-repo.org/packages/") ; Certificate expired, failed to validate.
	("org" . "http://orgmode.org/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("sc" . "http://joseito.republika.pl/sunrise-commander/")
	))

(package-initialize)

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package))
  (unless package-archive-contents
    (package-refresh-contents))
  )

(unless (package-installed-p 'quelpa) ; check 'quelpa
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade))
  )

(require 'use-package)

(use-package quelpa-use-package
  :ensure t
  :pin melpa
  :init
  (setq quelpa-update-melpa-p nil
        )
  :config
  (quelpa-use-package-activate-advice)
  )

;;

(setq default-directory "~/")
;; (add-to-list 'load-path
;; 	     (expand-file-name (concat
;; 				(concat default-directory ".emacs.d/")
;; 				"user/"))
;; 	     )
(setq with-editor-emacsclient-executable ; IDK
      "/Applications/Emacs.app/Contents/MacOS/Emacs")

;;;; Settings

; NANO
(if nil ; t
    (progn
        (add-to-list 'load-path "~/.emacs.d/nano")

        ; nano layout
        (require 'nano-layout)

        ; dark theme
        (require 'nano-theme-dark)
        ;; (require 'nano-theme-light)

        ; refer nano.el
        (progn
          (require 'nano-faces)
          (nano-faces)

          (require 'nano-theme)
          (nano-theme)

          (require 'nano-session)
  
          (require 'nano-modeline)
          (nano-modeline)

          ;nano-bindings

          (require 'nano-splash)

          (require 'nano-help)
	  )
	)
  (message "Nano disabled")
  )

; custom modules
(setq u/:init/:module/:activated-module-list
      	 '(
       	   (var . "var/aa.el")
	   (init . "init/aa.el")

	   (misc . "misc/aa.el")

	   (root . "aa.el")
           (lang . "lang/aa.el")

	   (visual . "visual/aa.el")

           (input . "input/aa.el")
	   )
	 )

; for instant debugging
(setq u/:init/:module/:banned-sub-module-list
      '(
	; banned modules name.
	))

(defun u/:init/:module/:aa (mod-name sub-mod-list)
  (dolist (u/:var/:local/:mod sub-mod-list)
    (unless (member
	     (car u/:var/:local/:mod)
	     u/:init/:module/:banned-sub-module-list)
      (load-file (expand-file-name
		  (concat "~/.emacs.d/user/"
			  ; concat unless it's empty
			  (unless (eq 0 (length mod-name))
			    (concat
			     mod-name
			     "/"))
			  (cdr u/:var/:local/:mod))
		  )) ; lf
      ) ; dl
    )
  )

(dolist (current-module u/:init/:module/:activated-module-list)
  (progn
    (message "Loading %s module..." (car current-module))

    (load-file (expand-file-name
		(concat ".emacs.d/user/" (cdr current-module))
		)
	       ) ; load each files.

    ) ; progn
  ) ; dolist

 ; End ///
(message "%s.." (emacs-uptime))

;; (setq my-package-list '(
;; 			use-package
;; 			elcord
;; ;			doom-modeline
;; ;			powerline
;; 			nyan-mode
;; 			minimap
;; ;			neotree
;; 			direx
;; 			solaire-mode
;; 			all-the-icons
;; 			tron-legacy-theme
;; 			company
;; 			company-quickhelp
;; 			company-box

;; 			; for CPP
			
;; 			rtags
;; 			helm-rtags
;; 			company-rtags

;; 			;; lsp-mode
;; 			;; lsp-ui
;; 			;; company-lsp
;; 			;; lsp-clangd
;; 			org
;; 			magit
;; 			))

;; (dolist (package my-package-list)
;;   (unless (package-installed-p package)
;;     (message "Found install-need package")
;;     (package-install package)))

;; ;; Font
;; ; font size
;; (set-face-attribute 'default nil :height 120)
				       
;; ; load line num
;; (global-display-line-numbers-mode)

;; ; TODO: set C-x C-f default directory val
;; (setq default-directory "~/")

;; ;; About Window
;; (setq ns-command-modifier 'meta)
;; (setq ns-auto-hide-menu-bar t)
;; (setq ns-use-thin-smoothing t)
;; (setq frame-title-format "Emacs 28.0 - %b")

;; ; Customize Garbage Collect
;; (run-with-idle-timer 10 t ; 10 sec a once
;; 		     #'garbage-collect
;; 		     )

;; ;; -- ㅅ -- ;;

;; ;; Discord Rich Presence
;; (use-package elcord
;;   :ensure t
;;   :init
;;   :config
;; ;  (setq elcord--editor-name "Emacs 28.0.50")
;; ;  (setq elcord-display-buffer-details f)
;;   (elcord-mode))

;; ;; MODE-LINE
;; ;(use-package doom-modeline
;; ;  :ensure t
;; ;  :init
;; ;  (doom-modeline-mode 1) ; positive
;; ;  (setq doom-modeline-height 10)
;; ;  (setq doom-modeline-modal-icon 'god')
;; ;  (setq doom-modeline-lsp t)
;; ;  :config
;; ;  )

;; ;;;;

;; ;; NYAN NYAN
;; (use-package nyan-mode
;;   :ensure t
;;   :init
;;   :config
;;   (nyan-start-animation) ; (nyan-stop-animation)
;; ;  (nyan-toggle-wavy-trail)
;;   (nyan-stop-music) ; (nyan-start-music)
  
;;   (nyan-mode))

;; ;; minimap of it's buffer
;; ;; (use-package minimap
;; ;;   :ensure t
;; ;;   :init
;; ;;   :config
;; ;;   ; (minimap-mode)
;; ;;   )

;; ;; Directory
;; ;; (use-package neotree
;; ;;   :ensure t
;; ;;   :init
;; ;;   :config
;; ;;   (setq neo-autorefresh t)
;; ;;   (setq neo-theme 'arrow) ; classic ascii arrow nerd
;; ;;   (setq neo-show-slash-for-folder nil)
;; ;;   (neotree-show)
;; ;; ;  (neotree-toggle)
;; ;;   )

;; (use-package direx
;;   :ensure t
;;   :init
;;   :config
;;   ;
;;   )

;; ; Icon resources
;; (use-package all-the-icons
;;   :ensure t
;;   :init
;;   :config
;;   )

;; ;; CYBERPUNK THEME
;; (use-package tron-legacy-theme
;;   :ensure t
;;   :init
;;   ; TODO:
;;   (use-package solaire-mode
;;     :ensure t
;; ;    :hook
;;     ;
;;     :init
;;     :config
;;     (solaire-global-mode) ; 뭔가 tron-legacy 테마랑 잘맞음.
;;     )
;;   :config
;;   ; brighter comments
;;   (setq tron-legacy-theme-dark-fg-bright-comments t)
;;   (setq tron-legacy-theme-vivid-cursor t)
;;   (setq tron-legacy-theme-softer-bg t)
;;   )

;; ;; elisp
;; (use-package company
;;   :ensure t
;;   :init
;;   (progn
;;     (add-hook 'after-init-hook 'global-company-mode t))
;;   :config
;;   (setq company-idle-delay 0)
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-show-numbers nil) ; "on"

;;   (use-package company-quickhelp
;;     :ensure t
;;     :init
;;     :config
;;     (company-quickhelp-mode)
;;     )

;;   (use-package company-box
;;     :ensure t
;;     :init
;;     :config
;;     (setq company-box-doc-delay 0)
;;     (setq company-box--numbers-pos 0)
;;     (company-box-mode)
;;     )

;;   ;(global-company-mode t)
;;   )

;; (use-package rtags
;;   :ensure t
;;   :init
;;   :config
;;   )

;; (use-package helm-rtags
;;   :ensure t
;;   :init
;;   :config
;;   (setq rtags-use-helm t)
;;   )

;; (use-package company-rtags
;;   :ensure t
;;   :init
;;   :config
;;   (setq rtags-company-enabled t)
;;   (add-to-list 'company-backends 'company-rtags)
;;   (setq rtags-autostart-diagnostics t)
;;   (rtags-enable-standard-keybindings)
;;   )

;; ;; (use-package lsp-mode
;; ;;   :ensure t
;; ;;   :init
;; ;;   :config
;; ;;   :commands lsp)

;; ;; (use-package lsp-ui
;; ;;   :ensure t
;; ;;   :init
;; ;;   :config
;; ;;   )

;; ;; (use-package company-lsp
;; ;;   :ensure t
;; ;;   :init
;; ;;   :config
;; ;;   (push 'company-lsp company-backends)
;; ;;   (add-hook 'after-init-hook 'global-company-mode)
;; ;;   )

;; ;; (use-package lsp-clangd
;; ;;   :ensure t
;; ;;   :load-path
;; ;;   "~/.emacs.d/lsp-clangd"
;; ;;   :init
;; ;;   (when (equal system-type 'darwin)
;; ;;     (setq lsp-clangd-executable "/usr/local/opt/llvm/bin/clangd"))
;; ;;   :config
;; ;;   (add-hook 'c++-mode-hook 'lsp-clangd-c++-enable)
;; ;;   )

;; (use-package cmake-ide
;;   :ensure t
;;   :init
;;   :config
;;   (setq cmake
;;   )

;; ;; Org-mode
;; (use-package org
;;   :ensure t
;;   :init
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.org$" . org-mode)
;;   )

;; ;; Git Client
;; (use-package magit
;;   :ensure t
;;   :init
;;   :config
;;   )

;; (load-theme ea-emacs-selected-theme)

;; ;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e208e45345b91e391fa66ce028e2b30a6aa82a37da8aa988c3f3c011a15baa22" "5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" "cf9414f229f6df728eb2a5a9420d760673cca404fee9910551caf9c91cff3bfa" "b8c59f875f345291cfdcf0177cd08af7d76a7e10b9f2f7c766475079363827cc" "d0aa1464d7e55d18ca1e0381627fac40229b9a24bca2a3c1db8446482ce8185e" "3346f0098a27c74b3e101a7c6b5e57a55cd073a8837b5932bff3d00faa9b76d0" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" default))
 '(package-selected-packages
   '(eglot all-the-icons lsp-mode disable-mouse company-cmake treemacs mode-line-stats-mode mode-line-stats minimap minimap-mode nyan-mode company-quickhelp-mode company-box company-quickhelp magit company company-mode use-package tron-legacy-theme elcord cmake-ide)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
