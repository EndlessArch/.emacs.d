;; user/misc/aa.el

(setq u/:init/:module/:sub/:misc
      '(
        (/misc/buffers . "u-buffers.el")
        (/misc/discord-rpc . "u-discord-rpc.el")
	)
      )

(u/:init/:module/:aa
 "misc"
 u/:init/:module/:sub/:misc)
