(require 'package)

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/bin")

(defun de-setup-scala-company ()
  (local-set-key "\M-/" 'ensime-company))

(defun de-scala-hook ()
  (interactive)
  (ensime)
  (de-setup-scala-company)
  (setf ensime-typecheck-when-idle nil))

(add-hook 'scala-mode-hook 'de-scala-hook)

(require 'ensime)
(provide 'de-scala)

