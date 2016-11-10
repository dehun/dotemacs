(require 'helm)
(require 'helm-ring)
(require 'helm-config)

;;(require 'helm-project)
(require 'helm-company)

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

(helm-autoresize-mode 1)

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     nil ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(setq helm-autoresize-max-heigh 40)
(setq helm-autoresize-min-heigh 40)
(helm-mode 1)

(setq helm-buffer-max-length 64)

(provide 'de-helm)
