(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)

;; Move files between split panes
(setq dired-dwim-target t)

(defun dired-back-to-top ()
  "Top of the buffer is actually first file not first line"
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 2))
(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  "Bottom of the buffer is actually last file not last line"
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))
(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

(defun dired-dotfiles-toggle ()
    "Show/hide dot-files"
    (interactive)
    (when (equal major-mode 'dired-mode)
      (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p)
          (progn
            (set (make-local-variable 'dired-dotfiles-show-p) nil)
            (message "h")
            (dired-mark-files-regexp "^\\\.")
            (dired-do-kill-lines))
        (progn (revert-buffer) ;just revert to re-show
               (set (make-local-variable 'dired-dotfiles-show-p) t)))))

(define-key dired-mode-map (kbd "C-c C-d") 'dired-dotfiles-toggle)

(eval-after-load "wdired"
  '(progn
     (define-key wdired-mode-map (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
     (define-key wdired-mode-map (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
     (define-key wdired-mode-map (kbd "C-c C-d") 'dired-dotfiles-toggle)))

(provide 'setup-dired)
