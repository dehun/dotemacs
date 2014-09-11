;; anything
(require 'anything)
(require 'anything-config)
(global-set-key "\C-x\i" 'anything)
(require 'anything-complete)

(setq anything-idle-delay 0.01)
(setq anything-input-idle-delay 0)
(setq anything-candidate-number-limit 128)
;;(add-hook 'anything-after-persistent-action-hook 'which-func-update)
;;(require 'anything-etags)

;; dabbrev
(require 'anything-dabbrev-expand)
(define-key anything-dabbrev-map [(control ?@)] 'anything-dabbrev-find-all-buffers)
(setq anything-dabbrev-input-idle-delay 0.0)
(setq anything-dabbrev-idle-delay 1.0)
(setq anything-dabbrev-expand-candidate-number-limit 20)
(setq anything-dabbrev-expand-strategies
      '(;; anything-dabbrev-expand--first-partial-dabbrev
        anything-dabbrev-expand--anything))
(setq anything-dabbrev-sources
      '(anything-dabbrev-partial-source
        anything-c-source-complete-emacs-commands
        anything-c-source-complete-emacs-functions
        anything-c-source-complete-emacs-variables
        anything-c-source-complete-emacs-other-symbols
        anything-dabbrev-all-source))


(global-set-key "\M-?" 'anything-dabbrev-expand)


;; web search

(defvar anything-c-source-occur
  '((name . "Occur")
    (init . (lambda ()
              (setq anything-occur-current-buffer
                    (current-buffer))))
    (candidates . (lambda ()
                    (let ((anything-occur-buffer (get-buffer-create "*Anything Occur*")))
                      (with-current-buffer anything-occur-buffer
                        (occur-mode)
                        (erase-buffer)
                        (let ((count (occur-engine anything-pattern
                                                   (list anything-occur-current-buffer) anything-occur-buffer
                                                   list-matching-lines-default-context-lines case-fold-search
                                                   list-matching-lines-buffer-name-face
                                                   nil list-matching-lines-face
                                                   (not (eq occur-excluded-properties t)))))
                          (when (> count 0)
                            (setq next-error-last-buffer anything-occur-buffer)
                            (cdr (split-string (buffer-string) "\n" t))))))))
    (action . (("Goto line" . (lambda (candidate)
                                (with-current-buffer "*Anything Occur*"
                                  (search-forward candidate))
                                (goto-line (string-to-number candidate) anything-occur-current-buffer)))))
    (requires-pattern . 3)
    (volatile)
    (delayed)))


;; occur
(global-set-key (kbd "C-c o")
  (lambda() (interactive)
    (anything
     :prompt "Switch to: "
     :candidate-number-limit 100                 ;; up to 10 of each
     :sources
     '( anything-c-source-occur))))            ;; use 'locate'



;; dummy
(defun anything-c-define-dummy-source (name func &rest other-attrib)
  `((name . ,name)
    (candidates "dummy")
    ,@other-attrib
    (filtered-candidate-transformer
     . (lambda (candidates source)
         (funcall ',func)))
    (requires-pattern . 1)
    (volatile)
    (category create)))

(defun anything-c-dummy-candidate ()
  ;; `source' is defined in filtered-candidate-transformer
  (list (cons (concat (assoc-default 'name source)
                      " '" anything-input "'")
              anything-input)))


;; web search
(defun make-anything-c-source-websearch (name url &rest extra)
    (anything-c-define-dummy-source
      (concat "Websearch for " name)
      #'anything-c-dummy-candidate
      `(action . ,(eval `(lambda (args)
		 (browse-url (apply 'concat ,url anything-pattern (quote ,extra))))))))

;; (make-anything-c-source-websearch "Google"
;;  					  "http://www.google.com/search?q="
;;  					  "&client=emacs-anything")

;; (global-set-key (kbd "C-c g")
;;                 lambda ())

;;

;; kill-ring

(defvar anything-kill-ring-threshold 10)

(defvar anything-c-source-kill-ring
  '((name . "Kill Ring")
    (init . (lambda ()
              (setq anything-kill-ring-buffer (current-buffer))))
    (candidates . (lambda ()
                    (remove-if
                     (lambda (kill)
                       (or (< (length kill) anything-kill-ring-threshold)
                           (string-match "^[\\s\\t]+$" kill)))
                     kill-ring)))
    (action . (("Insert" . (lambda (candidate)
                             (with-current-buffer anything-kill-ring-buffer
                               (insert candidate))))))
    ;(requires-pattern . 3)
    (multiline)))

(global-set-key (kbd "C-c y")  
  (lambda () (interactive)
    (anything
      :prompt "last killed: "
      :candidate-number-limit 20
      :sources
      '(anything-c-source-kill-ring))))

;; fuzzy match
(require 'anything-match-plugin)

;;
(require 'anything-multi-occur)
(global-set-key (kbd "C-c m")  'anything-multi-occur)


;; switch buffer
(defvar anything-c-source-gtags-files
  '((name . "gtags selected files")
    (candidates . (lambda ()
                    (start-process-shell-command "global" (current-buffer) "GTAGSROOT=/root/ynetesov/cmdaemon/branches/dellsettings global -P")))
;;    (delayed)
    (type . file)
    (action . (lambda (entry)
                (find-file entry)))))


(global-set-key (kbd "C-x b")
  (lambda() (interactive)
    (anything
     :prompt "Switch to: "
     :candidate-number-limit 10                 ;; up to 10 of each
     :sources
     '( anything-c-source-buffers               ;; buffers
        anything-c-source-recentf               ;; recent files
        anything-c-source-bookmarks             ;; bookmarks
        anything-c-source-files-in-current-dir+ ;; current dir
        anything-c-source-locate))))            ;; use 'locate'




(provide 'de-anything)
