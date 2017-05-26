;; show me where 80 is when programming
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-rule-width 5)
;; non progmode-hooked
(add-hook 'autoconf-mode-hook 'fci-mode)
(add-hook 'rst-mode-hook 'fci-mode)

(defun progmodes-hooks ()
  "Hooks for programming modes"
  (ggtags-mode 1)
  (yas-minor-mode-on)
  (hs-minor-mode)
  (fci-mode)
  (add-hook 'before-save-hook 'progmodes-write-hooks))

(defun progmodes-write-hooks ()
  "Hooks which run on file write for programming modes"
  (prog1 nil
    (set-buffer-file-coding-system 'utf-8-unix)
    (if (not (member major-mode
                     '(makefile-mode
                       makefile-bsdmake-mode
                       makefile-gmake-mode
                       makefile-automake-mode
                       go-mode)))
        (untabify-buffer))
    (copyright-update)
    (delete-trailing-whitespace)))

(defun delete-trailing-whitespace-p ()
  "Should we delete trailing whitespace when saving this file?"
  (save-excursion
    (goto-char (point-min))
    (ignore-errors (next-line 25))
    (let ((pos (point)))
      (goto-char (point-min))
      (and (re-search-forward (concat "Vilibald") pos t) t))))

(defun maybe-delete-trailing-whitespace ()
  "Delete trailing whitespace if I am the author of this file."
  (interactive)
  (and (delete-trailing-whitespace-p) (delete-trailing-whitespace)))


;;C/C++ style conventions
(setq c-default-style "k&r"
      c-basic-offset 4)
;spaces instead of TAB in C/C++ mode
(setq c-mode-hook (function
                   (lambda () (setq indent-tabs-mode nil)
                     (setq c-indent-level 4)
                     (c-toggle-auto-state 1)
                     (c-toggle-auto-hungry-state 1))))

;; style I want to use in c++ mode
(c-add-style "my-style"
             '("stroustrup"
               (indent-tabs-mode . nil)        ; use spaces rather than tabs
               (c-basic-offset . 4)            ; indent by four spaces
               (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
                                   (brace-list-open . 0)
                                   (statement-case-open . +)))))
(defun my-c++-mode-hook ()
  (c-set-style "my-style")        ; use my-style defined above
  (auto-fill-mode)
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
;.h are most of the time C++ files in my case so use that as default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c-mode-common-hook 'progmodes-hooks)

; add man pages refernce on [C-h d] key
(dolist (hook '(c-mode-hook c++-mode-hook))
  (add-hook hook
            (lambda ()(local-set-key (kbd "C-h d")
                                     (lambda ()
                                       (interactive)
                                       (manual-entry (current-word)))))))
;;MAKEFILE
(add-hook 'makefile-mode-hook 'indent-tabs-mode)
(add-hook 'makefile-mode-hook 'progmodes-hooks)
(add-to-list 'auto-mode-alist '("\\.am\\'" . makefile-automake-mode))


;; PYTHON
(elpy-enable)
;; (load-library "python-import-add")
(defun wvi-python-hook ()
  (ggtags-mode 1)
  (yas-minor-mode-on)
  (hs-minor-mode)
  (setq python-indent-offset 4))

(add-hook 'python-mode-hook 'wvi-python-hook)


;; GO-LANG
(require 'go-mode)
(require 'company-go)
(add-hook 'go-mode-hook
  (lambda ()
    (setq-default)
    (setq gofmt-command "goimports")
    (setq tab-width 4)
    (setq indent-tabs-mode t)
    (setq show-trailing-whitespace nil)
    (local-set-key (kbd "M-.") 'godef-jump)
    ; Go doc
    (local-set-key (kbd "C-c C-g") 'godoc)
    ; Go oracle
    (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
    (if (not (string-match "go" compile-command))
        (set (make-local-variable 'compile-command)
             "go build -v && go test -v && go vet"))
    (add-hook 'before-save-hook 'gofmt-before-save)
    (set (make-local-variable 'company-backends) '(company-go))
    (company-mode)))
(add-hook 'go-mode-hook 'progmodes-hooks)

;; (E)LISP stuff
(require 'package-lint)
(require 'highlight-quoted)
(require 'highlight-defined)
(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()(highlight-quoted-mode t)(highlight-defined-mode t)))


;; JAVASCRIPT MODE
(autoload 'js2-mode "js2-mode")
(eval-after-load "js2-mode"
  '(progn
     (setq js2-missing-semi-one-line-override t)
     (setq-default js2-basic-offset 2)))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'progmodes-hooks)

;; COFFEESCRIPT
(defun wvi-coffee-compile-and-open ()
  (interactive)
  (let ((file-name (coffee-compiled-file-name (buffer-file-name))))
    (coffee-compile-file)
    (if (not (find-buffer-visiting file-name))
      (switch-to-buffer (find-file-noselect file-name))
      (switch-to-buffer (find-buffer-visiting file-name)))))

(eval-after-load "coffee-mode"
  '(progn
     (defvar wvi-coffee-other-file-alist
       '(("\\.coffee\\'" (".js"))
         ("\\.js\\'" (".coffee"))))
     (define-key coffee-mode-map (kbd "C-c C-f") 'wvi-coffee-compile-and-open)
     (setq ff-other-file-alist 'wvi-coffee-other-file-alist)))
(add-hook 'coffee-mode-hook 'progmodes-hooks)

;; GYP
(setq load-path (cons "~/src/gyp/tools/emacs" load-path))
(require 'gyp)

(provide 'setup-programming)
