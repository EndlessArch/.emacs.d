;; u-defs.el

(defconst default-terminal-executable "/bin/zsh")

(defvar u/:c-c++/:rtags-path
  "/usr/local/Cellar/rtags/2.38"
  "Path to rtags root directory"
  )

(defvar u/:c-c++/:rtags-rdm-rc-path
  (concat (file-name-as-directory u/:c-c++/:rtags-path) "bin/")
  "Path to bin directory of rtags"
  )

(defvar u/:c-c++/:rdm-executable
  (concat (file-name-as-directory u/:c-c++/:rtags-rdm-rc-path) "rdm")
  "rdm executable"
  )

(defvar u/:c-c++/:rc-executable
  (concat (file-name-as-directory u/:c-c++/:rtags-rdm-rc-path) "rc")
  "rc executable"
  )

(defvar u/:c-c++/:cmake-executable
  "/usr/local/bin/cmake"
  "cmake executable"
  )
