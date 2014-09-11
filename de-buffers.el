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
(require 'multi-mode)

(provide 'de-buffers)
