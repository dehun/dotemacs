;; everything about visual part

;; color theme
(require 'color-theme)
(require 'de-color-theme-zenburn)
(color-theme-initialize)
(color-theme-de-zenburn)

;; highlist line
(global-hl-line-mode)
(set-face-attribute hl-line-face nil :underline nil)
(set-face-background 'hl-line "#100505")

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
(modify-syntax-entry ?^ "($")
(modify-syntax-entry ?$ ")^")
(show-paren-mode t)


(provide 'de-visual)