(require 'package)
(require 'dash)

;; Add melpa to package repos
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; Org-mode's repository
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(setq package-enable-at-startup nil)
(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))
  
(defun packages-install (packages)
  (--each packages
    (when (not (package-installed-p it))
      (package-install it)))
  (delete-other-windows))

;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(provide 'setup-package)
