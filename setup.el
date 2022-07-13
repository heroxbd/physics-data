; do not confirm
(setq org-confirm-babel-evaluate nil)
(setq org-latex-listings 'minted)
(setq org-latex-packages-alist '(("" "minted" nil)))

; load org-babel language support
(org-babel-do-load-languages 'org-babel-load-languages
  '((dot . t)
    (shell . t)
    (makefile . t)
    (python . t)
    (C . t)))
