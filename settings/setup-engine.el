(require 'engine-mode)
(engine-mode t)

;; Github
(defengine github
  "https://github.com/search?ref=simplesearch&q=%s")

;; duck duck go
(defengine duckduckgo
  "https://duckduckgo.com/?q=%s")

(provide 'setup-engine)
