(defvar anything-multi-occur-buffer-name "*Occur*")
(defvar anything-multi-occur-reject-function nil)
(defvar anything-multi-occur-exclude-buffers nil)

(defun anything-multi-occur-reject-default-function (bufs)
  (remove-if (lambda (b)
               (let ((bname (buffer-name b)))
                 (or (= (aref bname 0) 32) ;; white-space
                     (member bname anything-multi-occur-exclude-buffers))))
             bufs))

(defun anything-multi-occur-buffer-list ()
  (let ((bufs (buffer-list)))
    (if anything-multi-occur-reject-function
        (funcall anything-multi-occur-reject-function bufs)
        bufs)))

(defun anything-multi-occur-init (rx)
  (flet ((display-buffer (&rest args)))
    (let* ((name anything-multi-occur-buffer-name)
           (buf (get-buffer name)))
      (when buf (kill-buffer buf))
      (occur-1 rx nil (anything-multi-occur-buffer-list) name)
      (get-buffer name))))

(defun anything-multi-occur-choice-candidate (c)
  (cond ((string-match "^ +" c) (anything-multi-occur-goto-pos c))
        (t (anything-multi-occur-filtered-source c)
           (run-with-idle-timer
            0.1 nil (lambda (&rest args) (anything-multi-occur))))))

(defun anything-multi-occur-filtered-source (c)
  (with-current-buffer anything-multi-occur-buffer-name
    (let ((buffer-read-only nil))
      ;; delete above junks
      (goto-char (point-min))
      (let ((beg (search-forward c)))
        (condition-case nil
            (delete-region (point-min) (point-at-bol))
          (error nil))
        ;; delete below junks
        (when (re-search-forward "^[0-9]" nil t 1)
          (delete-region (point-at-bol) (point-max)))))))

(defun anything-multi-occur-goto-pos (c &optional other-window)
  (with-current-buffer anything-multi-occur-buffer-name
    (goto-char (point-min))
    (search-forward c)
    (let* ((pos (occur-mode-find-occurrence))
           (buf (marker-buffer pos)))
      (with-current-buffer buf
        (goto-char pos))
      (cond (other-window (display-buffer buf))
            (t (pop-to-buffer buf)))
      (run-hooks 'occur-mode-find-occurrence-hook))))

(defvar anything-multi-occur-arg nil)
(defvar anything-multi-occur-c-source
  '((name . "Multi Occur")
   (init . (lambda ()
             (cond (anything-multi-occur-arg
                    (anything-candidate-buffer (anything-multi-occur-init anything-multi-occur-arg)))
                   (t (anything-candidate-buffer)))))
   (candidates-in-buffer)
   (action . (("goto" . anything-multi-occur-choice-candidate)
              ("display" . (lambda (c) (anything-multi-occur-goto-pos c t)))))
   (persistent-action . (lambda (c) (anything-multi-occur-goto-pos c t)))))

(defun anything-multi-occur (&optional rx) (interactive "spattern: ")
  (setq anything-multi-occur-arg rx)
    (anything :sources '(anything-multi-occur-c-source)
              :candidate-number-limit 1000000))

;;; setting
(setq anything-multi-occur-exclude-buffers
      '("*Backtrace*"
        "*bm-bookmarks*"
        "*ESS*"
        "*Messages*"
        "*Help*"
        "*info*"
        "*scheme*"
        "*TAGS*"
        "TAGS"
        "gauche-complete-cache"
        "*Completions*"
        "*Quail Completions*"
        "*Anything Completions*"
        "*anything for buffers*"
        "*Anything Occur*"
        "*anything bm list*"
        "*anything kill-ring*"
        "*anything*"
        "*anything apropos*"
        "*Anything Log*"
        "*anything complete*"))

(setq anything-multi-occur-reject-function
      'anything-multi-occur-reject-default-function)

(provide 'anything-multi-occur)
