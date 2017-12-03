(require 'org)
(setq org-indent-mode t)

;;abbrev and flyspell in org-mode
(add-hook 'org-mode-hook #'(lambda ()(abbrev-mode t)(flyspell-mode t)))
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-export-default-language "en"
      org-export-html-extension "html"
      org-export-with-timestamps nil
      org-export-with-section-numbers nil
      org-export-with-tags 'not-in-toc
      org-export-skip-text-before-1st-heading nil
      org-export-with-sub-superscripts '{}
      org-export-with-LaTeX-fragments t
      org-export-with-archived-trees nil
      org-export-highlight-first-table-line t
      org-export-latex-listings-w-names nil
      org-export-html-style-include-default nil
      org-export-htmlize-output-type 'css
      org-startup-folded nil
      org-export-allow-BIND t
      org-publish-list-skipped-files t
      org-publish-use-timestamps-flag nil
      org-export-babel-evaluate t
      org-confirm-babel-evaluate nil)

;;this line activates ditaa inside org files
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))

(require 'org-page)
(setq op/repository-directory "/home/wvi/src/wvi.cz")
(setq op/site-domain "http://wvi.cz/")
(setq op/personal-github-link "https://github.com/w-vi")
(setq op/repository-html-branch "gh-pages")
(setq op/repository-org-branch "master")
(setq op/site-main-title "wvi ... core dump")
(setq op/site-sub-title "nil")
(setq op/theme 'kactus)

(provide 'setup-org)
