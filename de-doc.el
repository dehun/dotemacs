;; org mode
(require 'org)

(require 'flyspell)

(defun de-org-mode-hook ()              ; enable flyspell in org files
  (flyspell-mode t))
(add-hook 'org-mode-hook 'de-org-mode-hook)


(provide 'de-doc)