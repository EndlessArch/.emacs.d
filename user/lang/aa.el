;; user/lang/aa.el

(setq u/:init/:module/:sub/:lang
      '(
	(/lang/c-c++ . "c_cpp/u-c-c++.el")
        ;; (/lang/rtags . "c_cpp/u-rtags-set.el")
	(/lang/cmake . "cmake/u-cmake.el")
	)
      )

(u/:init/:module/:aa
 "lang/"
 u/:init/:module/:sub/:lang)
