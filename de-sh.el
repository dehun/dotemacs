(defun de-sh-hook ()
  (setq sh-basic-offset 2)
  (setq sh-indent-level 2))

(add-hook 'sh-mode-hook 'de-sh-hook)

;;(require 'de-anything)


(defvar anything-c-eshell-command-history
  '((name . "Command History")
    (candidates . (lambda ()
                    (set-buffer anything-current-buffer)
                    (remove-if (lambda (str) (string-match "^cd *" str))
                               (delete-dups (ring-elements eshell-history-ring)))))
    (action . (("Insert" . insert)))))


(defun de-eshell-hook ()
  (local-set-key (kbd "C-c h")
  (lambda() (interactive)
    (anything
     :prompt "Switch to: "
     :candidate-number-limit 100                 ;; up to 10 of each
     :sources
     '(anything-c-eshell-command-history)))))


(add-hook 'eshell-mode-hook 'de-eshell-hook)

(provide 'de-sh)
