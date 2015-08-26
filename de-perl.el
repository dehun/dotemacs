;;(require 'ggtags)

(add-to-list 'auto-mode-alist '("\\.pl\\'" . cperl-mode))

(defun my-cperl-mode-common-hook ()
  (ggtags-mode)
  (setq perl-basic-offset 2)
  (setq perl-indent-level 2)
  (setq tab-stop-list '(2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 2)
  (setq indent-tabs-mode nil))

(add-hook 'cperl-mode-hook 'my-cperl-mode-common-hook)


(provide 'de-perl)
