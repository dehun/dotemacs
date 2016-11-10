(require 'de-dired-extensions)

(defun de-dired-hook ()
  (local-set-key "\C-co" 'de-dired-open-marked-files))
(add-hook 'dired-mode-hook 'de-dired-hook)

(global-set-key "\C-x\C-f" 'helm-find-files)


(setq large-file-warning-threshold nil)
;; util function
(defun recursive-file-list (dir)
  (let ((files-list '())
        (current-entries (directory-files dir t)))
    (dolist (entry current-entries)
      (cond ((and (file-regular-p entry)
                  (string-match "html?$" entry))
             (setq files-list
                   (cons entry files-list)))
            ((and (file-directory-p entry)
                  (not (string-equal ".." (substring entry -2)))
                  (not (string-equal "." (substring entry -1))))
             (setq files-list (append files-list (recursive-file-list entry))))))
      files-list))


(provide 'de-files)
