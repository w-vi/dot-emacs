;; I want to have same path as in shell
(require 'exec-path-from-shell)
(when (memq window-system '(x))
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "PYTHONPATH")
    (exec-path-from-shell-copy-env "GOPATH")
    (exec-path-from-shell-copy-env "GOROOT")))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")
