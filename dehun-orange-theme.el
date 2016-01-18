
(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

(deftheme dehun-orange "dehun's theme for emacs")

  (custom-theme-set-variables
    'dehun-orange
    '(linum-format " %3i "))

  (let ((background "#201F1D")
        (gutters    "#444d56")
        (gutter-fg  "#75838e")
        (gutters-active "#5f7b66")
        (builtin      "#e09780")
        (foreground "#DCDCDC")
        (invisibles "#758e83")
        (lineHighlight "#463d36")
        (selection  "#5f6b76")
        (text       "#DCDCDC")
        (comments   "#657e73")
        (punctuation "#c0cec5")
        (delimiters "#c0cec5")
        (operators "#c0cec5")
        (keywords "#cadd62")
        (variables "#DE8D47")
        (functions "#ffffff")
        (methods    "#8fa1b3")
        (strings    "#a3be8c")
        (constants "#DE8D47")
        (white     "#ffffff"))

  (custom-theme-set-faces
   'dehun-orange

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
   `(vertical-border                  ((t (:foreground ,background))))   
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

(provide-theme 'dehun-orange)

;; Local Variables:
;; no-byte-compile: t
;; End:
