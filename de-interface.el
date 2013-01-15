;; everything related to emacs user interface

;; ibuffer
(require 'ibuffer)

(defalias 'list-buffers 'ibuffer)

;; disable that fucking exit key
(defun nothing () ())
(global-set-key "\C-x\C-c" 'nothing)

;; smex
(require 'smex)
(global-set-key "\M-x" 'smex)

;; a bit more comfortable yes no
(fset 'yes-or-no-p 'y-or-n-p)

;; workgroups
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(setq wg-morph-on nil)
(workgroups-mode t)

;; undo three
(require 'undo-tree)
(global-undo-tree-mode)


(provide 'de-interface)