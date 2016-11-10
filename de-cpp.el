(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


(require 'company)
(require 'company-c-headers)

(require 'de-helm)
(require 'helm-gtags)


;; fun with brackets and stuff
(font-lock-add-keywords 'c++-mode
        '(( "," . font-lock-keyword-face )))


;; c++11 lambdas and enum class
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



;; gtags
(defun setup-gtags-key-bindings ()
  (helm-gtags-mode)
  (local-set-key "\C-ce" 'helm-gtags-select)
  (local-set-key "\M-." 'helm-gtags-find-tag-from-here)
  (local-set-key "\C-cf" 'helm-gtags-find-files)
  (local-set-key "\C-cr" 'helm-gtags-resume)
  (local-set-key "\C-cl" 'helm-gtags-parse-file))

(defun my-c-mode-common-hook ()
  (setup-gtags-key-bindings)
  (helm-mode)
  (add-to-list 'ac-sources '(ac-source-symbols
                             ac-source-c-headers
                             ac-source-words-in-same-mode-buffers
                             ac-source-filename
                             ac-source-gtags))
  (c-set-offset 'substatement-open 0)

  (local-set-key "\C-c\C-f" 'ff-get-other-file)

  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (c-set-offset 'arglist-intro '+)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (c-set-offset 'arglist-intro '+)
  (setq indent-tabs-mode nil))

(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(provide 'de-cpp)
