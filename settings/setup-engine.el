(require 'engine-mode)
(engine-mode t)

;; Github
(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "g")

;; duck duck go
(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s"
  :keybinding "r")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")

(provide 'setup-engine)
