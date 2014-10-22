;; everything about the buffers

;; ibuffer
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)

;; recentf
(require 'recentf)
(setq recentf-max-saved-items 4096)
(recentf-mode t)

;; uniquify
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator "::")


;; multi-mode
;;(require 'multi-mode)

;; 
(require 'helm)
;;(require 'helm-ls-hg)
(require 'helm-ls-git)
(require 'helm-gtags)

(defun de-helm-everything ()
  (interactive)
  (helm :sources '(helm-source-buffers-list
                   helm-source-files-in-current-dir
                   helm-source-recentf
                   helm-source-ls-git
                   ;;                 helm-source-ls-hg
                   helm-source-locate)
        :buffer "*helm-everything*"))

(global-set-key "\C-xb"
                 'de-helm-everything)

(provide 'de-buffers)
