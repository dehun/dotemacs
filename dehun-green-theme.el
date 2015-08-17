
(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

(deftheme dehun-green "dehun's theme for emacs")

  (custom-theme-set-variables
    'dehun-green
    '(linum-format " %5i "))

  (let ((background "#242c24")
        (gutters    "#444d56")
        (gutter-fg  "#75838e")
        (gutters-active "#5f7b66")
        (builtin      "#e09780")
        (foreground "#d0eed5")
        (invisibles "#758e83")
        (lineHighlight "#343d46")
        (selection  "#5f6b76")
        (text       "#c0cec5")
        (comments   "#657e73")
        (punctuation "#c0cec5")
        (delimiters "#c0cec5")
        (operators "#c0cec5")
        (keywords "#baed52")
        (variables "#bf6a61")
        (functions "#8fa1b3")
        (methods    "#8fa1b3")
        (strings    "#a3be8c")
        (constants "#d08770")
        (white     "#ffffff"))

  (custom-theme-set-faces
   'dehun-green

;; Default colors
;; *****************************************************************************************

   `(default                          ((t (:foreground ,text :background ,background))))
   `(region                           ((t (:background ,selection                       ))))
   `(cursor                           ((t (:background ,white                        ))))
   `(fringe                           ((t (:background ,background   :foreground ,white))))
   `(linum                            ((t (:background ,background :foreground ,gutter-fg))))
   `(mode-line                        ((t (:foreground ,white :background ,gutters-active  ))))
   `(mode-line-inactive               ((t (:foreground ,gutter-fg :background ,gutters  ))))

;; Font lock faces
;; *****************************************************************************************
 
   `(font-lock-keyword-face           ((t (:foreground ,keywords))))
   `(font-lock-type-face              ((t (:foreground ,punctuation))))
   `(font-lock-constant-face          ((t (:foreground ,constants))))
   `(font-lock-variable-name-face     ((t (:foreground ,variables))))
   `(font-lock-builtin-face           ((t (:foreground ,builtin))))
   `(font-lock-string-face            ((t (:foreground ,strings))))
   `(font-lock-comment-face           ((t (:foreground ,comments))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,delimiters))))
   `(font-lock-function-name-face     ((t (:foreground ,functions))))
   ;; helm stuff
   '(helm-selection ((t (:background "black" :underline "peach puff"))))
   '(helm-match ((t (:foreground "#9acd32"))))
   '(helm-source-header ((t (:background "gray10" :foreground "dark gray" :weight bold :height 1.3))))
   '(minibuffer-prompt ((t (:foreground "burlywood"))))
   ;; linum
   '(linum ((t (:inherit (shadow default) :foreground "#666666"))))   

   `(font-lock-doc-string-face        ((t (:foreground ,strings)))))

;; *****************************************************************************************

   )

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;; *****************************************************************************************

(provide-theme 'dehun-green)

;; Local Variables:
;; no-byte-compile: t
;; End:
