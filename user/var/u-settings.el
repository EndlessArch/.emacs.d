;; u-settings.el

; gui
; when emacs is on terminal,
; window-system = nil
(when (window-system)
  (scroll-bar-mode -1) ; disable scroll bar.
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
      kept-old-versions 5

      ;
      )

; NOTE: it disturbs nlinum-relative mode.
;; (global-linum-mode) ; line
(column-number-mode) ; (row, col)

;; show matching parenthesis
(show-paren-mode)

; set font
(set-frame-font "Hack")

; font
;; (catch 'break
;; (let (preferred-font-list '(
;; 			    "Hack"
;; 			    "Menlo"
;; 			    ;; "Arial"
;; 			    ;; "Arial Black"
;; 			    ))
;;   (dolist (i preferred-font-list)
;;     (if (member i (font-family-list))
;; 	(progn
;; 	  (set-face-attribute 'default nil
;; 			      :font i
;; 			      :height 130 ; 120
;; 			      )
;; 	  (throw 'break)
;;       ))     
;;     ))
;; )

;;; FOR SOMETHING SIGNIFICANT AND RELEVANT TO PERFORMANCE!

; 1MB
(setq read-process-output-max (* 3 (* 1024 1024)))

(setq garbage-collection-messages nil)

;; ; set as infinite (no limit)
;; (setq gc-cons-threshold most-positive-fixnum)
(defun u/:gc/:mini-buffer-setup-hook ()
    (setq gc-cons-threshold most-positive-fixnum)
  )

(defun u/:gc/:mini-buffer-exit-hook ()
    (setq gc-cons-threshold 800000)
  )

(add-hook 'minibuffer-setup-hook #'u/:gc/:mini-buffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'u/:gc/:mini-buffer-exit-hook)

;; ;; Garbage Collecter
;;; maybe this is useless.
;;; replacing with custom u/:gc/:* hook functions
;; (use-package gcmh
;;   :ensure t
;;   :init
;; ;  :hook (after-init-hook . '(gcmh-mode 1))
;;   :config
;;   (gcmh-mode 1)
;;   )

;; (add-hook 'after-init-hook 'profiler-start)
