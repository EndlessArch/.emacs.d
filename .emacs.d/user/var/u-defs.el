;; u-defs.el

(add-to-list 'exec-path "/usr/local/opt/llvm/bin")
(add-to-list 'exec-path "/usr/local/Cellar/rtags/2.38/bin")

(defconst default-terminal-executable "/bin/zsh")

(defvar u/:c-c++/:rtags-path
  "/usr/local/Cellar/rtags/2.38"
  "Path to rtags root directory"
  )

(defvar u/:c-c++/:rtags-bin-dir
  (concat (file-name-as-directory u/:c-c++/:rtags-path) "bin/")
  "Path to bin directory of rtags"
  )

(defvar u/:c-c++/:system-include-path
  (cond ((eq system-type 'darwin)
         ;; "/usr/local/include/c++/10.2.0/"
         "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/"
         )
        (t nil))
  "Path to C++ system include directory"
  )

(defvar u/:c-c++/:rdm-executable
  (concat (file-name-as-directory u/:c-c++/:rtags-bin-dir) "rdm")
  "rdm executable"
  )

(defvar u/:c-c++/:rc-executable
  (concat (file-name-as-directory u/:c-c++/:rtags-bin-dir) "rc")
  "rc executable"
  )

(defvar u/:c-c++/:rdm-rc-config-path
  (expand-file-name "~/.rdmrc")
  "Path to rdm&rc config file"
  )

(defvar u/:c-c++/:cmake-executable
  "/usr/local/bin/cmake"
  "cmake executable"
  )

(defvar u/:c-c++/:clang-executable
  "/usr/bin/clang"
  "clang executable"
  )

; clang++

(defvar u/:c-c++/:clang-tidy-executable
  "/usr/local/opt/llvm/bin/clang-tidy"
  "clang-tidy executable"
  )
