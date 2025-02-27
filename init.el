; my minimal emacs settings

(setq backup-directory-alist
      '((".*" . "~/.emacs.d/.file_edit_backups")))

; basic editor settings
; (tool-bar-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode 1)

; all performance booster
(setq native-comp-speed 3)
(native-compile-async "~/.emacs.d/eln-cache/" 'recursively)

(setq treesit-language-source-alist
      '((bash   "https://github.com/tree-sitter/tree-sitter-bash")
	(cmake  "https://github.com/uyha/tree-sitter-cmake")
	(elisp  "https://github.com/Wilfred/tree-sitter-elisp")
	(json   "https://github.com/tree-sitter/tree-sitter-json")
	(make   "https://github.com/alemuller/tree-sitter-make")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(toml   "https://github.com/tree-sitter/tree-sitter-toml")
	(yaml   "https://github.com/ikatyang/tree-sitter-yaml"))
      )

(setq ln-mode-remap-alist
      '((elisp-mode . elisp-ts-mode)
	(json-mode . json-ts-mode)
	(python-mode . python-ts-mode)
	(toml-mode . toml-ts-mode)
	(yaml-mode . yaml-ts-mode))
      )
