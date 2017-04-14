;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ccm-recenter-at-end-of-file t)
 '(ccm-vpos-init (quote (round (window-text-height) 2)))
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(package-selected-packages
   (quote
    (move-text multiple-cursors hungry-delete neotree ag realgud company-irony-c-headers company-arduino ctags-update markdown-mode centered-cursor-mode magit expand-region elpy monokai-theme smart-compile company cargo racer rust-mode auto-complete)))
 '(save-place t)
 '(show-paren-mode t)
 '(window-divider-default-places t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;; Packages
;;
(require 'package) ;; You might already have this line
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)


;;
;; Init server
;;
(server-start)


;;
;; Spell check
;;
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(setq ispell-dictionary "english")

;;
;; Theme
;;
(load-theme 'monokai t)

;;
;; Undo
;;
(setq undo-limit 80000000)
(setq undo-strong-limit 120000000)
(setq undo-outer-limit 1200000000)
(setq undo-tree-auto-save-history t)


;;
;; Delete word
;;
(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(global-set-key (read-kbd-macro "<C-delete>") 'delete-word)
(global-set-key (read-kbd-macro "<C-backspace>") 'backward-delete-word)


(require 'ido)
(ido-mode t)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

(require 'hungry-delete)
(global-hungry-delete-mode)


;;
;; Align code
;;
(defun my_align (start end)
    "Repeat alignment with respect to
     the given regular expression."
    (interactive "r")
    (align-regexp start end
        (concat "\\(\\s-*\\)" "\\(:\\)\\|\\(=\\)\\|\\(=>\\)") 1 1))

(global-set-key (kbd "C-c C-a") 'my_align)

;;
;; Expand region
;;
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;
;; Undo / Redo
;;
(require 'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
(global-set-key (kbd "C-y") 'redo)
(global-set-key (kbd "C-S-v") 'yank)

;; Switch current buffer to other window
(global-set-key (kbd "C-S-x b") (lambda () (interactive) (switch-to-buffer-other-window (current-buffer))))

;;
;; Center cursor
;;
(require 'centered-cursor-mode)
(global-centered-cursor-mode +1)
(global-set-key (kbd "C-v") nil) ;; unset a key

;;
;; Move text
;;
(require 'move-text)
(global-set-key [C-S-up] 'move-text-up)
(global-set-key [C-S-down] 'move-text-down)

;;
;; Multiple cursors
;;
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;
;; Auto-complete
;;
(require 'auto-complete)
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-show-menu-immediately-on-auto-complete t)

;; Starts Emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(split-window-horizontally)
(set-frame-font "Fira Code 12" nil t)

(setq scroll-step 1)

;;
;; Identation
;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)
(c-set-offset 'comment-intro 0)

(setq c-default-style "k&r")
(electric-pair-mode)

;;
;; Arduino
;;
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;;
;; Rust lang
;;
(require 'rust-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;;
;; C lang
;;
(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on 'ctags-auto-update-mode'." t)
(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)

(add-hook 'c-mode-common-hook #'company-mode)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
;; (add-to-list 'company-backends 'company-c-headers)


(add-hook 'c-mode-common-hook
          (lambda () (define-key c-mode-base-map (kbd "C-c b") 'smart-compile)))
(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))

;;
;; Python lang
;;
(elpy-enable)
(add-hook 'c-mode-common-hook
          (lambda () (define-key python-mode-map (kbd "C-c b") 'smart-compile)))

;;
;; Compilation
;;
(require 'smart-compile)
(setq smart-compile-alist
      (append
       '(("\\.c\\'"           . "gcc -Wall -lm -g -lpthread %f -o %n")
         ("\\.[Cc]+[Pp]*\\'"  . "g++ -std=c++14 -Wall -g %f -o %n")
         ("\\.lua\\'"         . "lua %f")
         ("\\.py\\'"          . "python %f")
         ("\\.go\\'"          . "go build %f")
         ("\\.ino\\'"         . "arduino --upload %f"))
       smart-compile-alist))


;; I'm not scared of saving everything.
(setq compilation-ask-about-save nil)
;; Stop on the first error.
(setq compilation-scroll-output 'next-error)
;; Don't stop on info or warnings.
(setq compilation-skip-threshold 2)

;;
;; Clean whitespace when saving
;;
(add-hook 'before-save-hook #'whitespace-cleanup)

;;
;; Highlight especial words
;;
;; (set-face-underline 'font-lock-warning-face "yellow")
(add-hook 'prog-mode-hook
    (lambda ()
      (font-lock-add-keywords nil
        '(("\\<\\(FIXME\\|TODO\\|BUG\\|NOTE\\|HACK\\)" 1 font-lock-warning-face t)))))


;;
;; Session configs
;;
(setq auto-save-timeout 60)     ;; Autosave every minute
(setq make-backup-files nil)    ;; No backup files
(desktop-save-mode 1)           ;; Save session
(setq require-final-newline 't) ;; Always newline at end of file
(savehist-mode 1)

;;
;; Interface configs
;;
(tool-bar-mode -1)                              ;; No toolbar
(menu-bar-mode -1)                              ;; No menubar
(global-hl-line-mode 1)                         ;; Highlight current line
(line-number-mode 1)                            ;; Show line-number in the mode line
(column-number-mode 1)                          ;; Show column-number in the mode line
(mouse-wheel-mode t)                            ;; Mouse-wheel enabled
(show-paren-mode 1)                             ;; Highlight parenthesis pairs
(setq truncate-partial-width-windows nil)       ;; Don't truncate long lines
(setq read-file-name-completion-ignore-case 't) ;; Ignore case when completing file names
(setq read-buffer-completion-ignore-case 't)    ;; Ignore case when completing buffer names
(setq-default case-fold-search t)               ;; Search is case sensitive
(defalias 'yes-or-no-p 'y-or-n-p)               ;; y/n instead of yes/no


(global-linum-mode 1)
(setq linum-format "%d ")


;;
;; Fira code hack for emacs
;;

;; This works when using emacs --daemon + emacsclient
(add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; This works when using emacs without server/client
(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
;; I haven't found one statement that makes both of the above situations work, so I use both for now

(defconst fira-code-font-lock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ;; The first argument to concat is a string containing a literal tab
                                   ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
          '(("\\(www\\)"                   #Xe100)
            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
            ("\\(\\*\\*\\*\\)"             #Xe102)
            ("\\(\\*\\*/\\)"               #Xe103)
            ("\\(\\*>\\)"                  #Xe104)
            ("[^*]\\(\\*/\\)"              #Xe105)
            ("\\(\\\\\\\\\\)"              #Xe106)
            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
            ("\\({-\\)"                    #Xe108)
            ("\\(\\[\\]\\)"                #Xe109)
            ("\\(::\\)"                    #Xe10a)
            ("\\(:::\\)"                   #Xe10b)
            ("[^=]\\(:=\\)"                #Xe10c)
            ("\\(!!\\)"                    #Xe10d)
            ("\\(!=\\)"                    #Xe10e)
            ("\\(!==\\)"                   #Xe10f)
            ("\\(-}\\)"                    #Xe110)
            ("\\(--\\)"                    #Xe111)
            ("\\(---\\)"                   #Xe112)
            ("\\(-->\\)"                   #Xe113)
            ("[^-]\\(->\\)"                #Xe114)
            ("\\(->>\\)"                   #Xe115)
            ("\\(-<\\)"                    #Xe116)
            ("\\(-<<\\)"                   #Xe117)
            ("\\(-~\\)"                    #Xe118)
            ("\\(#{\\)"                    #Xe119)
            ("\\(#\\[\\)"                  #Xe11a)
            ("\\(##\\)"                    #Xe11b)
            ("\\(###\\)"                   #Xe11c)
            ("\\(####\\)"                  #Xe11d)
            ("\\(#(\\)"                    #Xe11e)
            ("\\(#\\?\\)"                  #Xe11f)
            ("\\(#_\\)"                    #Xe120)
            ("\\(#_(\\)"                   #Xe121)
            ("\\(\\.-\\)"                  #Xe122)
            ("\\(\\.=\\)"                  #Xe123)
            ("\\(\\.\\.\\)"                #Xe124)
            ("\\(\\.\\.<\\)"               #Xe125)
            ("\\(\\.\\.\\.\\)"             #Xe126)
            ("\\(\\?=\\)"                  #Xe127)
            ("\\(\\?\\?\\)"                #Xe128)
            ("\\(;;\\)"                    #Xe129)
            ("\\(/\\*\\)"                  #Xe12a)
            ("\\(/\\*\\*\\)"               #Xe12b)
            ("\\(/=\\)"                    #Xe12c)
            ("\\(/==\\)"                   #Xe12d)
            ("\\(/>\\)"                    #Xe12e)
            ("\\(//\\)"                    #Xe12f)
            ("\\(///\\)"                   #Xe130)
            ("\\(&&\\)"                    #Xe131)
            ("\\(||\\)"                    #Xe132)
            ("\\(||=\\)"                   #Xe133)
            ("[^|]\\(|=\\)"                #Xe134)
            ("\\(|>\\)"                    #Xe135)
            ("\\(\\^=\\)"                  #Xe136)
            ("\\(\\$>\\)"                  #Xe137)
            ("\\(\\+\\+\\)"                #Xe138)
            ("\\(\\+\\+\\+\\)"             #Xe139)
            ("\\(\\+>\\)"                  #Xe13a)
            ("\\(=:=\\)"                   #Xe13b)
            ("[^!/]\\(==\\)[^>]"           #Xe13c)
            ("\\(===\\)"                   #Xe13d)
            ("\\(==>\\)"                   #Xe13e)
            ("[^=]\\(=>\\)"                #Xe13f)
            ("\\(=>>\\)"                   #Xe140)
            ("\\(<=\\)"                    #Xe141)
            ("\\(=<<\\)"                   #Xe142)
            ("\\(=/=\\)"                   #Xe143)
            ("\\(>-\\)"                    #Xe144)
            ("\\(>=\\)"                    #Xe145)
            ("\\(>=>\\)"                   #Xe146)
            ("[^-=]\\(>>\\)"               #Xe147)
            ("\\(>>-\\)"                   #Xe148)
            ("\\(>>=\\)"                   #Xe149)
            ("\\(>>>\\)"                   #Xe14a)
            ("\\(<\\*\\)"                  #Xe14b)
            ("\\(<\\*>\\)"                 #Xe14c)
            ("\\(<|\\)"                    #Xe14d)
            ("\\(<|>\\)"                   #Xe14e)
            ("\\(<\\$\\)"                  #Xe14f)
            ("\\(<\\$>\\)"                 #Xe150)
            ("\\(<!--\\)"                  #Xe151)
            ("\\(<-\\)"                    #Xe152)
            ("\\(<--\\)"                   #Xe153)
            ("\\(<->\\)"                   #Xe154)
            ("\\(<\\+\\)"                  #Xe155)
            ("\\(<\\+>\\)"                 #Xe156)
            ("\\(<=\\)"                    #Xe157)
            ("\\(<==\\)"                   #Xe158)
            ("\\(<=>\\)"                   #Xe159)
            ("\\(<=<\\)"                   #Xe15a)
            ("\\(<>\\)"                    #Xe15b)
            ("[^-=]\\(<<\\)"               #Xe15c)
            ("\\(<<-\\)"                   #Xe15d)
            ("\\(<<=\\)"                   #Xe15e)
            ("\\(<<<\\)"                   #Xe15f)
            ("\\(<~\\)"                    #Xe160)
            ("\\(<~~\\)"                   #Xe161)
            ("\\(</\\)"                    #Xe162)
            ("\\(</>\\)"                   #Xe163)
            ("\\(~@\\)"                    #Xe164)
            ("\\(~-\\)"                    #Xe165)
            ("\\(~=\\)"                    #Xe166)
            ("\\(~>\\)"                    #Xe167)
            ("[^<]\\(~~\\)"                #Xe168)
            ("\\(~~>\\)"                   #Xe169)
            ("\\(%%\\)"                    #Xe16a)
           ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

(defun add-fira-code-symbol-keywords ()
  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

(add-hook 'prog-mode-hook
          #'add-fira-code-symbol-keywords)
