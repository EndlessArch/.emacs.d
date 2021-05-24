;; user/u-buffer.el

; toggle (y or n) while killing buffer on ibuffer
(setq ibuffer-expert t)

(use-package swiper
  :ensure t
  :init
  :config
  ;
  )

;; (use-package ivy-posframe
;;   :ensure t
;;   :init
;;   :config
;;   (setq ivy-postframe-display-function-alist
;;         '((t . ivy-postframe-display-at-
;;   )

(use-package ivy-rich
  :disabled t
  :ensure t
  :after ivy
  :hook (after-init . ivy-rich-mode)
  :init
  :config

  ;; (setq ivy-rich-display-transformers-list
  ;;       )

  (ivy-rich-modify-column
   'ivy-switch-buffer
   'ivy-rich-switch-buffer-major-mode
   '(:width 20 :face error))

  (setq ivy-rich-path-style 'abbrev)

  

  )

;; (use-package icicles
;;   :disabled t
;;   :quelpa (icicles
;; 	   :fetcher github
;; 	   :repo "emacsmirror/icicles"
;; 	   :stable nil
;; 	   )
;;   :init
;;   :config
;;   ;
;;   )

