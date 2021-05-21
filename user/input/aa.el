;; user/input/aa.el

(setq u/:init/:module/:sub/:input
      '(
	(/input/buffer . "u-buffer.el")
	(/input/keybinds . "u-keybindings.el")
        (/input/mouse . "u-mouse.el")
	)
      )

(u/:init/:module/:aa
 "input"
 u/:init/:module/:sub/:input)
