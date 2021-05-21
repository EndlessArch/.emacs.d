;; u-defs.el

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/local/opt/llvm/bin")
(add-to-list 'exec-path "/usr/local/opt/rtags/bin")

(defconst default-terminal-executable
  ;; "/bin/zsh"
  (executable-find "zsh")
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
  (executable-find "rdm")
  "rdm executable"
  )

(defvar u/:c-c++/:rc-executable
  (executable-find "rc")
  "rc executable"
  )

(defvar u/:c-c++/:cmake-executable
  ;; "/usr/local/bin/cmake"
  (executable-find "cmake")
  "cmake executable"
  )

(defvar u/:c-c++/:clang-executable
  ;; "/usr/bin/clang"
  (executable-find "clang")
  "clang executable"
  )

; clang++

(defvar u/:c-c++/:clang-tidy-executable
  ;; "/usr/local/opt/llvm/bin/clang-tidy"
  (executable-find "clang-tidy")
  "clang-tidy executable"
  )

(defvar u/:c-c++/:clangd-executable
  ;; "/usr/local/opt/llvm/bin/clangd"
  (executable-find "clangd")
  "clangd executable"
  )

(defvar u/:c-c++/:clangd-args
  '(
    "-j=2"
    "--background-index"
    "--completion-style=detailed" ; "=bundled"
    "--clang-tidy"
    "--pch-storage=memory"
    "--header-insertion=never"
    "--header-insertion-decorators=0"
    )
  "clangd arguments"
  )
