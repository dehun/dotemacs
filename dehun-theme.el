
(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

(deftheme dehun "dehun's theme for emacs")

  (custom-theme-set-variables
    'dehun
    '(linum-format " %5i "))

  (let ((background "#14141c")
        (gutters    "#343d46")
        (gutter-fg  "#65737e")
        (gutters-active "#4f5b66")
        (builtin      "#d08770")
        (foreground "#c0c5ce")
        (invisibles "#65737e")
        (lineHighlight "#343d46")
        (selection  "#4f5b66")
        (text       "#c0c5ce")
        (comments   "#65737e")
        (punctuation "#c0c5ce")
        (delimiters "#c0c5ce")
        (operators "#c0c5ce")
        (keywords "#9acd32")
        (variables "#bf616a")
        (functions "#8fa1b3")
        (methods    "#8fa1b3")
        (strings    "#a3be8c")
        (constants "#d08770")
        (white     "#ffffff"))

  (custom-theme-set-faces
   'dehun

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

(provide-theme 'dehun)

;; Local Variables:
;; no-byte-compile: t
;; End:
