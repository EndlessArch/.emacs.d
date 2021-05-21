;; user/aa.el

(setq u/:init/:module/:sub/:root
      '(
	(/dev . "u-dev.el")
	(/dev-git . "u-dev-git.el")

        ;; (/misc . "u-misc.el")

	;; (/c-c++ . "u-c-c++.el")
	)
      )

(add-to-list
 'load-path
 (expand-file-name (concat default-directory ".emacs.d/user/lang/cmake"))
 )

(u/:init/:module/:aa
 ""
 u/:init/:module/:sub/:root)


