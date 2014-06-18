;; everything about the buffers

;; ibuffer
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)

;; recentf
(require 'recentf)
(setq recentf-max-saved-items 512)
(recentf-mode t)

;; uniquify
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator "::")


(provide 'de-buffers)
