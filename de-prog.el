;; everything related to programming


;; indent
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;; cedet
(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/")
;;(load-file "~/.emacs.d/site-lisp/cedet-1.1/common/cedet.el")
(require 'cedet)
(require 'semantic)
(require 'srecode)
;;(semantic-load-enable-excessive-code-helpers)
(global-semantic-stickyfunc-mode -1)
(global-semantic-decoration-mode -1)
(global-semantic-idle-scheduler-mode)
(global-semantic-show-unmatched-syntax-mode)
(global-semantic-show-parser-state-mode)
(global-semantic-idle-completions-mode)
(global-semantic-highlight-func-mode)
(global-semantic-idle-summary-mode)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
(require 'ecb)

;; eassist
;;(require 'eassist)

;; different languages customizations
(require 'de-cpp)
(require 'de-python)

;; flymake cursor
(require 'flymake-cursor)
(custom-set-variables
     '(help-at-pt-timer-delay 0.01)
     '(help-at-pt-display-when-idle '(flymake-overlay)))


;; our 'project' system
(require 'de-proj)


(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
         (matching-text (and cb
                             (char-equal (char-syntax cb) ?\) )
                             (blink-matching-open))))
    (when matching-text (message matching-text))))


;; provide at last
(provide 'de-prog)
