(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(elpy-company-post-completion-function 'elpy-company-post-complete-parens)
 '(elpy-rpc-backend "rope")
 '(package-selected-packages
   '(vlf visual-regexp ggtags fill-column-indicator diminish company-terraform company-go py-yapf smartparens yasnippet-snippets org-page meson-mode geiser iedit easy-hugo ido-ubiquitous graphviz-dot-mode direx engine-mode w3m wrap-region docker editorconfig jump-char guide-key browse-kill-ring ido-completing-read+ ido-at-point ido-vertical-mode whitespace-cleanup-mode dired-details slime move-text yaml-mode web-mode undo-tree tabbar smex skewer-mode py-isort magit-push-remote magit-gh-pulls magit-find-file magit-filenotify lua-mode go-snippets go-projectile gnuplot-mode gnuplot gist flycheck-package flx-ido expand-region ess-R-object-popup elpy edit-server ecb dockerfile-mode company-web company-quickhelp company-jedi bison-mode apib-mode ace-jump-mode))
 '(safe-local-variable-values
   '((eval when
	   (require 'rainbow-mode nil t)
	   (rainbow-mode 1))
     (eval add-hook 'before-save-hook 'time-stamp)))
 '(show-paren-mode t)
 '(tabbar-separator '(0.5))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 120 :width normal)))))
