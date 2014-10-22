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

(provide 'de-init)
