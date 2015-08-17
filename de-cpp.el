(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;(require 'etags)
;;(add-to-list 'load-path "~/.emacs.d/elpa/ggtags-0.8.5")
(require 'gtags)
;;(require 'anything-gtags)
(require 'auto-complete)

(require 'de-helm)
(require 'helm-gtags)
(require 'flymake)

;; xcscope
(require 'xcscope)
(cscope-setup)
(require 'helm-cscope)

;; fun with brackets and stuff
(font-lock-add-keywords 'c++-mode
        '(( "," . font-lock-keyword-face )))


;; c++11 lambdas and enum class
;;(require 'google-c-style)
(defadvice c-lineup-arglist (around my activate)
  "Improve indentation of continued C++11 lambda function opened as argument."
  (setq ad-return-value
        (if (and (equal major-mode 'c++-mode)
                 (ignore-errors
                   (save-excursion
                     (goto-char (c-langelem-pos langelem))
                     ;; Detect "[...](" or "[...]{". preceded by "," or "(",
                     ;;   and with unclosed brace.
                     (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
            0                           ; no additional indent
          ad-do-it)))                   ; default behavior



;; From Duncan Mac-Vicar's emacs setup:
;; https://github.com/dmacvicar/duncan-emacs-setup
(defun flymake-clang-c++-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "clang++" (list "-fsyntax-only" "-fno-color-diagnostics" local-file))))

(defun flymake-clang-c++-load ()
  (interactive)
  (message "hello")
  (unless (eq buffer-file-name nil)
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.cpp\\'" flymake-clang-c++-init))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.cc\\'" flymake-clang-c++-init))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.h\\'" flymake-clang-c++-init))
    (flymake-mode t)))




;; gtags
(defun setup-gtags-key-bindings ()
  (helm-gtags-mode)
  (local-set-key "\C-ce" 'helm-gtags-select)
  (local-set-key "\M-." 'helm-gtags-find-tag-from-here)
  (local-set-key "\C-cf" 'helm-gtags-find-files)
  (local-set-key "\C-cr" 'helm-gtags-resume)
  (local-set-key "\C-cl" 'helm-gtags-parse-file))

;; ac-c-headers
(require 'auto-complete-c-headers)

(defun setup-bright-includes ()
  (add-to-list 'achead:include-directories "~/dev/work/cmdaemon/trunk/")
  (add-to-list 'achead:include-directories "~/dev/work/cmdaemon/trunk/src/")
  (add-to-list 'achead:include-directories "~/dev/work/cmdaemon/trunk/src/entities")
  (add-to-list 'achead:include-directories "~/dev/work/cmdaemon/trunk/test/unittests/")
  (add-to-list 'achead:include-directories "~/dev/work/cmdaemon/trunk/"))

(defun my-c-mode-common-hook ()
  ;;  (flymake-clang-c++-load)
  (local-set-key "\M-/" 'auto-complete)
  (setup-gtags-key-bindings)
  (helm-mode)
  ;;  (google-set-c-style)
  ;; bright specific
  (setup-bright-includes)
  ;;
  (add-to-list 'ac-sources '(ac-source-symbols
                             ac-source-c-headers
                             ac-source-words-in-same-mode-buffers
                             ac-source-filename
                             ac-source-gtags))
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
;;  (flymake-clang-c++-load)  
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
