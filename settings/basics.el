
;;Save me buffers and stuff in the rare occasion that I close emacs
(desktop-save-mode t)

;; Enable clipborad out of emacs
(setq x-select-enable-clipboard t)

;; Auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

(setq text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))

;; UTF-8
(setq locale-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; Remove text in active region if inserting text
(delete-selection-mode t)

;; ABBREVS-FILE
(setq abbrev-file-name (expand-file-name "abbrev_defs" my-emacs-dir))

;; ALIASES
(defalias 'yes-or-no-p 'y-or-n-p)

;; improve the speed by slowing down the GC
;; GC is triggered every 20MB instead of default 0.8 MB
(setq gc-cons-threshold 20000000)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)
;; 80 chars is a good width.
(set-default 'fill-column 80)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; A better ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;;AUTOBACKUP
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

; always use copying to create backup files (don't clobber symlinks)
(setq backup-by-copying t)
; make numeric backup versions
(setq version-control t)
; number of oldest versions to keep when a new numbered backup is made
(setq kept-old-versions 2)  ; 2
; number of newest versions to keep when a new numbered backup is made
(setq kept-new-versions 20)  ; 2
; delete excess backup versions silently
(setq delete-old-versions t)
;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(provide 'basics)

