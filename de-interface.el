;; everything related to emacs user interface

;; disable that fucking exit key
(defun nothing () ())
(global-set-key "\C-x\C-c" 'nothing)

;; commands
(require 'smex)
(global-set-key "\M-x" 'smex)


;; a bit more comfortable yes no
(fset 'yes-or-no-p 'y-or-n-p)

;; workgroups
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(setq wg-morph-on nil)
(workgroups-mode t)

;;ace jump mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c C-SPC") 'ace-jump-word-mode)


;; undo three
(require 'undo-tree)
(global-undo-tree-mode)

(require 'de-buffers)

(provide 'de-interface)
