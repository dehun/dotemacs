(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


(defun my-c-mode-common-hook ()
  (gtags-mode)
  (c-set-offset 'substatement-open 0)
  (setq c-basic-offset 2)
  (setq c-indent-level 2)
  (c-set-offset 'arglist-intro '+)
  (setq tab-stop-list '(2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun my-c-mode-with-tabs-common-hook ()
  (c-set-offset 'substatement-open 0)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (c-set-offset 'arglist-intro '+)
  (setcdr (assoc 'arglist-cont-nonempty c-offsets-alist)
          '(c-lineup-gcc-asm-reg my-c-lineup-arglist))
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

(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


(require 'anything)
(require 'anything-include)
(setq anything-include-save-file "~/.anything-include")
(setq anything-include-max-saved-items 1000)

;; boost documentation
(require 'w3m)
(require 'de-files)

(defvar boost-documentation-directory
  "/usr/share/doc/libboost1.55-doc/"
  "defines boost directory location")

(defvar anything-c-source-boost-html
  '((name . "boost html documentation")
    (requires-pattern . 3)
    (candidates . (lambda ()
                    (recursive-file-list boost-documentation-directory)))
    (delayed)
    (action . (lambda (entry)
                (w3m-browse-url entry)))))

;; provide
(provide 'de-cpp)
