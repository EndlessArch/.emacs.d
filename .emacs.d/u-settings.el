;; u-settings.el

; gui
; when emacs is on terminal,
; window-system = nil
(when (window-system)
  (scroll-bar-mode -1) ; not using scroll bar.
  (tool-bar-mode -1) ; hide toolbar
  (toggle-frame-fullscreen) ; toggle fullscreen mode
  )

; emacs
;(setq make-backup-files nil)
(setq backup-directory-alist '(
			       ("." . "~/.emacs.d/backup")
			       )
      backup-by-copying t
      version-control t ; use version on backups
      delete-old-versions t ; automatically delete old backups
      kept-new-versions 20 ; how many times to keep it
      kept-old-versions 5 ; '
      )

(global-linum-mode) ; line
(column-number-mode) ; (row, col)

; font
(set-face-attribute 'default nil
		    :font "Hack"
		    :height 130 ; 120
		    )

;; Garbage Collecter
(use-package gcmh
  :ensure t
  :init
;  :hook (after-init-hook . '(gcmh-mode 1))
  :config
  (gcmh-mode 1)
  )

;; (add-hook 'after-init-hook 'profiler-start)
