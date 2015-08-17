;; everything about visual part

;; color theme
;;(require 'color-theme)
;;(require 'de-color-theme-zenburn)

(add-to-list 'custom-theme-load-path "./dotemacs/")
(load-theme 'dehun-green t)

;;(load-theme 'tangotango t)
;;(color-theme-tangotango)
;;(color-theme-de-zenburn)
;;(load-theme 'smyx t)
;;(load-theme 'brin t)
;;(load-theme 'jazz t)
;;(load-theme 'zenburn t)
;;(color-theme-zenburn)
;;(color-theme-pok-wog)


;; highlist line
(global-hl-line-mode)
(set-face-attribute hl-line-face nil :underline nil)
(set-face-background 'hl-line "#000000")

;; cursor
(setq cursor-type 'hollow)
(blink-cursor-mode 0)
(setq visible-bell t)

;; font
(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(set-face-attribute 'default nil :height 110)


;; menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode t)

;; a bit faster redisplay
(setq redisplay-dont-pause t)

;; linum
(setq linum-format "%d ")
(custom-set-faces
 '(linum ((t (:inherit (shadow default) :foreground "#666666")))))

;; paren mode
(require 'paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(modify-syntax-entry ?^ "($")
(modify-syntax-entry ?$ ")^")
(show-paren-mode t)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "black" :underline "peach puff"))))
 '(helm-source-header ((t (:background "gray10" :foreground "dark gray" :weight bold :height 1.3 :family "Sans Serif"))))
 '(linum ((t (:inherit (shadow default) :foreground "#666666"))))
 '(minibuffer-prompt ((t (:foreground "burlywood")))))


(provide 'de-visual)
