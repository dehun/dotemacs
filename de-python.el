;; python related stuff

(defun de-python-mode-hook ()
  (flymake-mode 1)
  (local-set-key "\C-c\C-c" 'flymake-mode)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))
(add-hook 'python-mode-hook 'de-python-mode-hook)

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(provide 'de-python

;; flymakes
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))

)