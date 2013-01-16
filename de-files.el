(require 'de-dired-extensions)

(defun de-dired-hook ()
  (local-set-key "\C-co" 'de-dired-open-marked-files))
(add-hook 'dired-mode-hook 'de-dired-hook)

(provide 'de-files)

