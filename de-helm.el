(require 'helm)
(require 'helm-ring)
;;(require 'helm-project)

;; emacs commands
(global-set-key"\M-X" 'helm-M-x)

(setq helm-gtags-cache-max-result-size (* 1024 1024 1024)) ;1024 MB


(global-set-key (kbd "C-c o")
  (lambda() 
    (interactive)
    (helm-occur)))



(global-set-key (kbd "C-c y")
  (lambda() 
    (interactive)
    (helm :sources 
          '(helm-source-kill-ring))))

(provide 'de-helm)
