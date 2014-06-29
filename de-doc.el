;; org mode
(require 'org)

(require 'flyspell)

(defun de-org-mode-hook ()              ; enable flyspell in org files
  (flyspell-mode t))
(add-hook 'org-mode-hook 'de-org-mode-hook)

;; documentation for c++, python

;; info
(require 'de-cpp)
(require 'de-python)
(global-set-key (kbd "C-c I")  ;; i -> info
  (lambda () (interactive)
    (anything
      :prompt "Info about: "
      :candidate-number-limit 100
      :sources
         '(anything-c-source-man-pages
           anything-c-source-boost-html
           anything-c-source-python-html))))




(provide 'de-doc)
