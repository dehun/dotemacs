(require 'company)
(require 'company-c-headers)
(require 'jedi)
(require 'company-jedi)
(add-to-list 'company-backends 'company-jedi)
;;(require 'helm-company)

;; (global-set-key (kbd "M-/")
;;                 'helm-company)

(global-company-mode)


(provide 'de-company)
