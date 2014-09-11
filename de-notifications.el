;;(require 'slime)

(defvar de-notifications-enabled 0 "notifications switcher")

(defun de-notify-init () )
;;  (slime-connect "127.0.0.1" 4005))

(defun de-enable-notifications ()
  (setq de-notifications-enabled 1))

(defun de-disable-notifications ()
  (setq de-notifications-enabled 0))

(de-disable-notifications)

(defun de-notify (origin message) ())
  ;; (when (eq de-notifications-enabled 1)
  ;;   (slime-eval `(stumpwm:message 
  ;;                 (common-lisp:concatenate 'common-lisp:string "[" ,origin "] :: " ,message)))))

(de-notify-init)
(de-enable-notifications)
(de-notify "emacs" "notifications system started up")

(provide 'de-notifications)
