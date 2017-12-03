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
  "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w"
  :docstring "Searchin' the wikis.")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s")

(provide 'setup-engine)
