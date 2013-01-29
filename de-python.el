;; python related stuff

(require 'python-mode)
(setq py-load-pymacs-p t)
(setq py-complete-set-keymap-p t)

(defun de-python-mode-hook ()
  (message "python hacks is loading...")
  (flymake-mode 1)
  (local-set-key "\C-c\C-c" 'flymake-mode)
  (local-set-key "\C-c\C-b" 'py-send-buffer)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (modify-syntax-entry ?_ "_")
  (linum-mode))
(add-hook 'python-mode-hook 'de-python-mode-hook)

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)



;; flymakes
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))



;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; (setq py-python-command-args
;;   '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)
; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

(provide 'de-python)