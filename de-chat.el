;; jabber support
(require 'jabber)


;; notifications for erc

(require 'de-notifications)

(de-notify-init)

(defun bytes-to-string (bytes)
  (apply 'concat (mapcar `byte-to-string bytes)))

(defun erc-global-notify (match-type nick message)
  (de-notify "erc" (concat "[" nick "]" ": " (bytes-to-string message))))

(add-hook 'erc-text-matched-hook 'erc-global-notify)

(de-notify "erc" "initialized erc notifications system")

(provide 'de-chat)
