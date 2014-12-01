(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;(require 'etags)
;;(add-to-list 'load-path "~/.emacs.d/elpa/ggtags-0.8.5")
(require 'gtags)
;;(require 'anything-gtags)
(require 'auto-complete)

(require 'de-helm)
(require 'helm-gtags)


(defun setup-gtags-key-bindings ()
  (helm-gtags-mode)
  (local-set-key "\M-." 'helm-gtags-find-tag-from-here)
  (local-set-key "\C-cf" 'helm-gtags-find-files)
  (local-set-key "\C-cr" 'helm-gtags-resume)
  (local-set-key "\C-cl" 'helm-gtags-parse-file))


(defun my-c-mode-common-hook ()
  (setup-gtags-key-bindings)


  (setq ac-sources '(ac-source-symbols ac-source-words-in-same-mode-buffers))
  (auto-complete-mode)
  (c-set-offset 'substatement-open 0)

  (local-set-key "\M-." 'helm-gtags-find-tag-from-here)

  (setq c-basic-offset 2)
  (setq c-indent-level 2)
  (c-set-offset 'arglist-intro '+)
  (setq tab-stop-list '(2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (c-set-offset 'arglist-intro '+)
  (setq indent-tabs-mode nil))

(defun my-c-mode-with-tabs-common-hook ()
  (setup-gtags-key-bindings)

  (c-set-offset 'substatement-open 0)
  (setq c-basic-offset 4)
  (auto-complete-mode)
  (local-set-key "\M-." 'helm-gtags-find-tag-from-here)
  (setq c-indent-level 4)
  (c-set-offset 'arglist-intro '+)
  (setcdr (assoc 'arglist-cont-nonempty c-offsets-alist)
          '(c-lineup-gcc-asm-reg my-c-lineup-arglist))
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  ;;  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  )

(defun my-c-mode-hook ()
  (linum-mode)
  (local-set-key "\C-cf" 'eassist-list-methods)
  (local-set-key "\C-cg" 'eassist-jump-to-method))
;;(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;; (require 'anything)
;; (require 'anything-include)
;; (setq anything-include-save-file "~/.anything-include")
;; (setq anything-include-max-saved-items 1000)

;; boost documentation
(require 'w3m)
(require 'de-files)

;; (defvar boost-documentation-directory
;;   "/usr/share/doc/libboost1.55-doc/"
;;   "defines boost directory location")

;; (defvar anything-c-source-boost-html
;;   '((name . "boost html documentation")
;;     (requires-pattern . 3)
;;     (candidates . (lambda ()
;;                     (recursive-file-list boost-documentation-directory)))
;;     (delayed)
;;     (action . (lambda (entry)
;;                 (w3m-browse-url entry)))))

;; provide
(provide 'de-cpp)
