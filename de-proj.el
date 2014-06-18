(defun de-open-with-dired-list (path new-buffer-name files-to-open-regexp)
  (interactive)
  (find-dired path (format "-type f -regex \"%s\"" files-to-open-regexp))
  (rename-buffer new-buffer-name))

;; cpp
(defun de-open-cpp-proj ()
  (interactive)
  (let ((path (read-file-name "path to proj dir: ")))
    (de-open-with-dired-list path "*all*" ".+\\.[ch][a-zA-Z]?[a-zA-Z]?$")
;;    (de-open-with-dired-list path "*sources*" ".+\\.c[a-zA-Z]?[a-zA-Z]?$")
;;    (de-open-with-dired-list path "*headers*" ".+\\.h[a-zA-Z]?[a-zA-Z]?$")
;;    (de-open-with-dired-list path "*makes*" ".+CMakeLists\\\\.txt$"))
  ))

;; python
(defun de-open-py-proj ()
  (interactive)
  (let ((path (read-file-name "path to proj dir: ")))
    (de-open-with-dired-list path "*sources*" ".+\\.py$")))

;; emacs lisp
(defun de-open-elisp-proj ()
  (interactive)
  (let ((path (read-file-name "path to proj dir: ")))
    (de-open-with-dired-list path "*sources*" ".+\\.el$")))

;; lisp
(defun de-open-lisp-proj ()
  (interactive)
  (let ((path (read-file-name "path to proj dir: ")))
    (de-open-with-dired-list path "*sources*" ".+\\.lisp$")))


(provide 'de-proj)
