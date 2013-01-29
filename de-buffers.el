;; everything about the buffers

;; ibuffer
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)

;; everything related to buffers and files
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-mathing t)
(setq ido-use-filename-at-point 'guess)

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