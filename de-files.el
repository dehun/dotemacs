(require 'de-dired-extensions)

(defun de-dired-hook ()
  (local-set-key "\C-co" 'de-dired-open-marked-files))
(add-hook 'dired-mode-hook 'de-dired-hook)

(require 'ido)
(setq ido-enable-flex-mathing t)
(setq ido-use-filename-at-point 'guess)
(ido-mode t)

(provide 'de-files)

