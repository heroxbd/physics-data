; do not confirm for dot
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "dot")))
(setq org-confirm-babel-evaluate #'my-org-confirm-babel-evaluate)
(setq org-latex-listings 'minted)
(setq org-latex-packages-alist '(("" "minted" nil)))

; load org-babel language support
(org-babel-do-load-languages 'org-babel-load-languages
  '((dot . t)
    (shell . t)
    (makefile . t)
    (python . t)
    (C . t)))

(setq org-latex-classes
      '(("book" "\\documentclass[a4paper,11pt]{ctexbook}"
         ("\\chapter{%s}" . "\\chapter*{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(setq org-latex-compiler "lualatex")
