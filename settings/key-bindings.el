;; C-c d for line duplication
(global-set-key "\C-cd" 'duplicate-line)
;;C-c c for copy line
(global-set-key "\C-cc" 'copy-line-or-region)
;; C-c k for killing the rest of the line
(global-set-key "\C-ck" 'kill-line)
;; C-k for killing the whole line
(global-set-key "\C-k" 'kill-whole-line)
;; C-x C-o find the other file, useful for c/c++
(global-set-key "\C-x\C-o" 'ff-find-other-file)
;; C-q go back to mark, ie point where jumped elsewhere
(global-set-key "\C-cq" 'pop-global-mark)

(global-set-key (kbd "M-<up>") 'move-line-region-up)
(global-set-key (kbd "M-<down>") 'move-line-region-down)

;;MAGIT
(global-set-key "\C-cm" 'magit-status)

;; Dired toggle dotfiles
(require 'dired )
(define-key dired-mode-map (kbd "C-c C-d") 'dired-dotfiles-toggle)

;; Move between windows
(global-set-key [s-left] 'windmove-left)
(global-set-key [s-right] 'windmove-right)
(global-set-key [s-up] 'windmove-up)
(global-set-key [s-down] 'windmove-down)
(global-set-key [s-next] 'transpose-windows)

;;Ace jump mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; THING AT POINT EDIT
(global-set-key "\C-cw" 'thing-copy-word)
(global-set-key "\C-cW" 'thing-paste-word)
(global-set-key "\C-cs" 'thing-copy-symbol)
(global-set-key "\C-cS" 'thing-paste-symbol)
(global-set-key "\C-cv" 'thing-copy-sentence)
(global-set-key "\C-cV" 'thing-paste-sentence)

;; HIDE-SHOW
(global-set-key "\C-ch" 'hs-hide-block)
(global-set-key "\C-ce" 'hs-show-block)
(global-set-key "\C-cH" 'hs-hide-all)
(global-set-key "\C-cE" 'hs-show-all)

;; SMEX - M-x ido boost
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; TABBAR
(global-set-key [C-prior] 'tabbar-backward-tab)  ; previous tab: C-PgUp
(global-set-key [C-next]  'tabbar-forward-tab)   ; next tab:     C-PgDn
(global-set-key (kbd "C-S-p") 'tabbar-backward-group)
(global-set-key (kbd "C-S-n") 'tabbar-forward-group)

;; Visual Regexp
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)


;; F1 manual page
(global-set-key [f1] 'man)

;; F2 YASNIPPET insert and expand
(global-set-key [(control f2)] 'yas-insert-snippet)
(global-set-key [f2] 'yas-expand)

;; F3 macrobindings
(global-set-key [f3] 'start-kbd-macro)
(global-set-key [(control f3)] 'end-kbd-macro)
(global-set-key [(control shift f3)] 'name-last-kbd-macro)

;; F4 expand/contract-region
(global-set-key [f4] 'er/expand-region)
(global-set-key [(control f4)] 'er/contract-region)

;; F5 for dired buffer of the current directory in the other window
(define-key global-map [f5]
  (lambda () (interactive) (dired-other-window default-directory)))

;; F6 list hookmarks
(define-key global-map [f6]
  (lambda ()
    (interactive) (list-bookmarks) (switch-to-buffer "*Bookmark List*")))

;; F7 transpose windows
(define-key global-map [f7] 'transpose-windows)

;; F8 new file buffer
(define-key global-map [f8] 'wvi-create-file-buffer)

;; F9 to kill buffer
(define-key global-map [f9] (lambda () (interactive) (kill-buffer (current-buffer))))

;; F10 put back the windows (winner mode undo)
;; C-F10 winner redo
(define-key global-map [f10] (lambda () (interactive) (winner-undo)))
(define-key global-map [(control f10)] (lambda () (interactive) (winner-redo)))

;; F11 undo-tree-undo
;; C-F11 undo-tree-redo
(define-key global-map [f11] (lambda () (interactive) (undo-tree-undo)))
(define-key global-map [(control f11)] (lambda () (interactive) (undo-tree-redo)))

;; F12 compile!
(define-key global-map [f12] 'compile)

(provide 'key-bindings)
