(add-to-list 'load-path "~/.emacs.d/site-lisp/") ; third party

;; require main de modules
(require 'de-helm)
(require 'de-interface)
(require 'de-visual)
(require 'de-files)
(require 'de-vcs)
;;(require 'de-anything)
(require 'de-prog)
(require 'de-sh)
(require 'de-doc)
(require 'de-chat)
;;(require 'de-www)
(require 'de-util)
(require 'de-scala)
(provide 'de-init)
;;(require 'de-company)

;; (require 'jdee)
;; (autoload 'jde-mode "jde" "JDE mode" t)
;; (setq jdee-server-dir "~/bin/")
;; (setq jdee-sourcepath "/home/dehun/dev/foreign/qpid-proton-0.15.0")
