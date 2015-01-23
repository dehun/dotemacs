(require 'haskell-mode)
(require 'auto-complete)
(require 'ac-haskell-process)

(defun de-haskell-mode-hook ()
  (ac-haskell-process-setup)
  (auto-complete-mode)
  (add-to-list 'ac-modes 'haskell-interactive-mode)
;;  (haskell-interactive-mode)
  (haskell-indent-mode t))



(add-hook 'haskell-mode-hook 'de-haskell-mode-hook)

(provide 'de-haskell)
