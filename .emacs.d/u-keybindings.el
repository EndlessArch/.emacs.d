;; u-keybindings.el

; keybindings
(define-key global-map
  (kbd "M-n")
  (kbd "C-u 1 C-v")
  )

(define-key global-map
  (kbd "M-p")
  (kbd "C-u 1 M-v")
  )

;; replace list-buffers function to ibuffer
(global-unset-key "\C-x\C-b") ; list-buffers
(fmakunbound 'list-buffers)
(global-set-key "\C-x\C-b" 'ibuffer)
