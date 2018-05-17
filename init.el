;;; GENERAL SETTINGS
;; to undo, do M-x tool-bar-mode;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; scrollbar is pretty useless
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1)) ; blinking cursor is evil
(if (fboundp 'tooltip-mode) (tooltip-mode -1)) ; never used it

;; Don't show the startup screen
(setq inhibit-startup-screen t)

;; Set my emacs root dir
;; .emacs is a simlink to this file
(setq my-emacs-dir "~/dot-emacs/")

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" my-emacs-dir))

(setq settings-dir
      (expand-file-name "settings" my-emacs-dir))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Settings for current machine
(setq machine-settings-dir
      (concat my-emacs-dir "machine/" system-name))
(add-to-list 'load-path machine-settings-dir)
(setq custom-file (expand-file-name "custom.el" machine-settings-dir))
(load custom-file)

;; Add non package.el stuff to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; How do I look? Cool!
(require 'looks)

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(ace-jump-mode
     apib-mode
     browse-kill-ring
     company
     company-go
     company-jedi
     company-quickhelp
     company-terraform
     company-web
     diminish
     dired-details
     direx
     docker
     dockerfile-mode
     ecb
     editorconfig
     elpy
     engine-mode
     epc
     expand-region
     fill-column-indicator
     flx
     flx-ido
     flycheck-package
     ggtags
     gnuplot
     gnuplot-mode
     go-mode
     go-projectile
     go-snippets
     graphviz-dot-mode
     guide-key
     htmlize
     ido-at-point
     ido-completing-read+
     ido-ubiquitous
     ido-vertical-mode
     jump-char
     magit
     magit-filenotify
     magit-find-file
     markdown-mode
     move-text
     multiple-cursors
     org
     projectile
     py-autopep8
     py-isort
     slime
     smartparens
     smex
     tabbar
     undo-tree
     visual-regexp
     vlf
     w3m
     web-mode
     whitespace-cleanup-mode
     wrap-region
     yaml-mode
     yasnippet)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(require 'basics)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)  ; Enable guide-key-mode
(setq guide-key/popup-window-position 'bottom)

;; Load my functions and macros
(load (expand-file-name "defuns" site-lisp-dir))

(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'org '(require 'setup-org))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'company '(require 'setup-company))
(require 'setup-yasnippet)
(require 'setup-programming)

(when (fboundp 'winner-mode)
  (winner-mode t))

(when (fboundp 'electric-pair-mode)
  (electric-pair-mode t))

(require 'undo-tree)
(global-undo-tree-mode)

(require 'expand-region)
(require 'visual-regexp)
(require 'thing-edit)

(require 'projectile)
(projectile-global-mode)

(require 'smex)
(smex-initialize)

(require 'tabbar-cfg)
(tabbar-mode)

(require 'smartparens-config)


(autoload 'ggtags-mode "ggtags" "Emacs gnu global tags minor mode" t)
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
(autoload 'dockerfile-mode "dockerfile-mode" "Emacs Dockerfile editoing" t)

;; Map files to modes
(require 'mode-mappings)

;; Setup key bindings
(require 'key-bindings)

;; W3m
(require 'setup-w3m)

;; Engine Mode
(require 'setup-engine)

;; Go FULLSCREEN
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(when (eq window-system 'x)
  (toggle-fullscreen))


;; Start server if not runing
(load "server")
(unless (server-running-p) (server-start))

;; Set up specifics for the current machine, this needs to be the last
;; thing done in the init
(when (file-exists-p machine-settings-dir)
  (mapc 'load (directory-files machine-settings-dir nil "^[^#].*el$")))
