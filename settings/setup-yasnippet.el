(require 'yasnippet)
(setq yas-trigger-key nil)
(yas-reload-all)

;; ;; This is where snippets lie.
;; (setq yas-snippet-dirs '(concat my-emacs-dir "snippets"))
;;(mapc 'yas-load-directory yas-snippet-dirs)
(add-hook 'org-mode-hook #'(lambda () (yas-minor-mode)))

;; no dropdown, rather ido
(setq yas-prompt-functions '(yas-ido-prompt yas-completing-prompt))

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)
(global-set-key [f2] 'yas-insert-snippet)

;; Jump to end of snippet definition
(define-key yas-keymap (kbd "<return>") 'yas-exit-all-snippets)

(provide 'setup-yasnippet)
