(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
  (setq c-basic-offset 2)
  (setq c-indent-level 2)
  (setq tab-stop-list '(2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun my-c-mode-with-tabs-common-hook ()
  (c-set-offset 'substatement-open 0)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun my-c-mode-hook ()
  (linum-mode)
  (local-set-key "\C-cf" 'eassist-list-methods)
  (local-set-key "\C-cg" 'eassist-jump-to-method))
;;(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c++-mode-common-hook 'my-c-mode-with-tabs-common-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-with-tabs-common-hook)



;; provide
(provide 'de-cpp)