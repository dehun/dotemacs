(setq zoomout-scale -3)
(setq zoomout-is-scaled nil)

(defun zoomout-toggle ()
  (interactive)
  (if zoomout-is-scaled
      (progn (text-scale-adjust 0)
             (setf zoomout-is-scaled nil))
    (progn (text-scale-set zoomout-scale)
           (setf zoomout-is-scaled t))))

(provide 'zoomout)
