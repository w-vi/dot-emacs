(setq visible-bell t
      font-lock-maximum-decoration t
      truncate-partial-width-windows nil)

;; line and column number in all files, all the time
;; and please higlight those bloody parenthesis
(global-linum-mode t)
(column-number-mode t)
(show-paren-mode t)

;: make sure transient mark mode is enabled (it should be by default,
;: but just in case)
(transient-mark-mode t)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; turn on mouse wheel support for scrolling
;; some people get confused when the mouse dosn't work
(require 'mwheel)
(mouse-wheel-mode t)

;; Bug off with  new frames
(setq ns-pop-up-frames nil)

;; Default Emacs does not scroll pages smoothly with down arrow key.
;; It tries to jump a page-worth.
;; See this for advice on preventing that
;; http://stackoverflow.com/questions/3631220/fix-to-get-smooth-scrolling-in-emacs
(setq redisplay-dont-pause t)
(setq scroll-conservatively 20)
(setq scroll-margin 2)
(setq scroll-preserve-screen-position 1)

;; Highlight current line
(global-hl-line-mode t)
(setq highlight-current-line-globally t)
(setq highlight-current-line-high-faces nil)
(setq highlight-current-line-whole-line t)
(setq hl-line-face (quote highlight))

;;; THEME

;; Set custom theme path
(setq custom-theme-directory (concat my-emacs-dir "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

;; Load and tweak my theme
(load-theme 'zenburn t)
(setq linum-format
      (lambda (line)
        (propertize (format
                     (let ((w (length (number-to-string
                                       (count-lines (point-min) (point-max))))))
                       (concat " %" (number-to-string w) "d"))
                     line)
                    'face 'linum)))


;; Testing reasonable window splits
(defadvice split-window-right (after balance activate) (balance-windows))
(defadvice delete-window (after balance activate) (balance-windows))

;; Clean up the modeline
(require 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "hideshow" '(diminish 'hs-minor-mode))
(eval-after-load "autorevert" '(diminish 'auto-revert-mode))

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")
(rename-modeline "projectile" projectile-mode "prj")

(provide 'looks)
