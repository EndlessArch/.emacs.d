;; u-keybindings.el

; disable arrow keys
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))

(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))

(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

; keybindings
(define-key global-map
  (kbd "M-n")
  (kbd "C-u 1 C-v")
  )

(define-key global-map
  (kbd "M-p")
  (kbd "C-u 1 M-v")
  )

(define-key global-map
  (kbd "C-x C-=")
  (kbd "C-x C-+")
  )

(define-key global-map
  (kbd "C-x C-o")
  'ff-find-other-file
  )

(unless ivy-mode
  (progn
    ;; replace list-buffers function to ibuffer
    (global-unset-key "\C-x\C-b") ; list-buffers
    (fmakunbound 'list-buffers)
    (global-set-key "\C-x\C-b" 'ibuffer)

    ;; replace C-S
    (global-unset-key "\C-s")
    ;; (fmakunbound 'isearch)
    (global-set-key "\C-s" 'swiper)))

;; (global-set-key (kbd "C-SPC") 'company-complete)
