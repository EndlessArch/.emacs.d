;; user/misc/u-discord-rpc.el

(use-package elcord
  :ensure t
  :hook (window-setup . elcord-mode)
  :config

  (setq elcord-client-id '"764401340339191809")

  (setq elcord--editor-name (format "v%d.%d" emacs-major-version emacs-minor-version))

  ;; (defun elcord--details-and-state ()
  ;;   (list
  ;;    (cons "details"
  ;;          (format "🚀  %s[%s:%d]"
  ;;                            ;\xF0\x9F\x94\xA7 ; Wrench
  ;;                            ;\xF0\x9F\x94\xA8 ; hammer
  ;;       		   (buffer-name)
  ;;       		   (format-mode-line "%l")
  ;;       		   (current-column)))
  ;;    ;; (cons "state"
  ;;    ;;       (let ((fs (format-seconds
  ;;    ;;                  "%ddays %hhrs %mmins%z"
  ;;    ;;                  (time-convert (time-since before-init-time) 'integer))
  ;;    ;;                 ))
  ;;    ;;         (format "Runtime: %s" fs))
  ;;    ;;       )
  ;;    (cons "state"
  ;;          (let ((fs (format-seconds
  ;;                     "%ddays %hhrs %mmin%z"
  ;;                     (time-convert (time-since before-init-time) 'integer))
  ;;                    ))
  ;;            (if (null (string-blank-p fs))
  ;;                (format "%s %s"
  ;;                        ;; "\xF0\x9F\x95\x92 "
  ;;                        "Runtime: "
  ;;                                         ; get clock emoji (of emacs runtime)
  ;;                        (nth
  ;;                         (let ((hn
  ;;                                (% (string-to-number
  ;;                                    (format-seconds
  ;;                                     "%h"
  ;;                                     (time-convert
  ;;                                      (time-since before-init-time)
  ;;                                      'integer)))
  ;;                                   12)))
  ;;                           (if (zerop hn)
  ;;                               (setq hn 11)
  ;;                             (setq hn (- hn 1)))
  ;;                           hn)
  ;;                         '(
  ;;                           ;; "\xF0\x9F\x95\x90" ; 1o'clock
  ;;                           ;; "\xF0\x9F\x95\x91"
  ;;                           ;; "\xF0\x9F\x95\x92"
  ;;                           ;; "\xF0\x9F\x95\x93"
  ;;                           ;; "\xF0\x9F\x95\x94"
  ;;                           ;; "\xF0\x9F\x95\x95"
  ;;                           ;; "\xF0\x9F\x95\x96"
  ;;                           ;; "\xF0\x9F\x95\x97"
  ;;                           ;; "\xF0\x9F\x95\x98"
  ;;                           ;; "\xF0\x9F\x95\x99"
  ;;                           ;; "\xF0\x9F\x95\x9A"
  ;;                           ;; "\xF0\x9F\x95\x9B" ; 12o'clock
  ;;                           "🕐"
  ;;                           "🕑"
  ;;                           "🕒"
  ;;                           "🕓"
  ;;                           "🕔"
  ;;                           "🕕"
  ;;                           "🕖"
  ;;                           "🕗"
  ;;                           "🕘"
  ;;                           "🕙"
  ;;                           "🕚"
  ;;                           "🕛"
  ;;                           ))
  ;;                        fs
  ;;                        )
  ;;              (format "%s 이제 막 시작했어요!" "\xF0\x9F\x9A\x80")
  ;;              )))
  ;;    ))
  )
  
;; ; crashes with use-package(but not for quelpa)
;; (require 'elcord)

;; (setq elcord-client-id "764401340339191809")

;; (defun elcord--details-and-state ()
;;   (let ((activity (list
;;                    (cons "details" (format "%s|%s:%s"
;;                                            (buffer-name)
;;                                            (format-mode-line "%l")
;;                                            (current-column)))
;;                    (cons "state" (format "%s" "Blank")))))
;;     (when elcord-display-elapsed
;;       (push (list "timestamps" (cons "start" elcord--startup-time)) activity))
;;     activity)
;;   )

;; (add-hook 'after-init-hook 'elcord-mode)
