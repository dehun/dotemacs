(defun dired-open-marked-files ()
   (interactive)
   (let ((distinguish-one-marked nil))
     (mapc 'find-file
           (dired-map-over-marks (dired-get-file-for-visit)
                                 current-prefix-arg))))

(provide 'de-dired-extensions)
