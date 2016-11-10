;; everything about the buffers

;; ibuffer
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)

;; recentf
(require 'recentf)
(setq recentf-max-saved-items 4096)
(recentf-mode t)

;; linum
(require 'linum)
(global-linum-mode)

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
;;(require 'helm-ls-git)
;;(require 'helm-ls-svn)
(require 'helm-gtags)

(require 'projectile)
(require 'helm-projectile)

(defun de-helm-everything ()
  (interactive)
  (helm :sources '(helm-source-buffers-list
                   ;; helm-source-ls-git
                   ;; helm-source-ls-svn
;;                   helm-source-hg-list-files
                   helm-source-projectile-files-list
                   helm-source-files-in-current-dir
                   helm-source-recentf
                   ;;                   helm-source-locate
                   )
        :buffer "*helm-everything*"))

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t
      helm-projectile-fuzzy-match t)


(global-set-key "\C-xb"
                'de-helm-everything)

(require 'buffer-move)
(defun de-swap-buffers ()
  (interactive)
  (condition-case nil
      (buf-move-right)
    (error (buf-move-left))))

(global-set-key "\C-xw"
                'de-swap-buffers)

;; workgroups
(require 'workgroups)
(global-set-key (kbd "C-M-1")
                'wg-switch-to-index-0)
(global-set-key (kbd "C-M-2")
                'wg-switch-to-index-1)
(global-set-key (kbd "C-M-3")
                'wg-switch-to-index-2)
(global-set-key (kbd "C-M-4")
                'wg-switch-to-index-3)
(global-set-key (kbd "C-M-5")
                'wg-switch-to-index-4)
(global-set-key (kbd "<f1>")
                'wg-switch-to-index-0)
(global-set-key (kbd "<f2>")
                'wg-switch-to-index-1)
(global-set-key (kbd "<f3>")
                'wg-switch-to-index-2)
(global-set-key (kbd "<f4>")
                'wg-switch-to-index-3)
(global-set-key (kbd "<f5>")
                'wg-switch-to-index-4)


(provide 'de-buffers)
