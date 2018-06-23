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
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(ansi-term-color-vector
   [unspecified "#ffffff" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#4271ae" "#4d4d4c"] t)
 '(ccm-recenter-at-end-of-file t)
 '(ccm-vpos-init (quote (round (window-text-height) 2)))
 '(company-irony-ignore-case t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "db2ecce0600e3a5453532a89fc19b139664b4a3e7cbefce3aaf42b6d9b1d6214" "9541f1dc11258239ef02aa1a5e9db3e1e46bc8fb1d7dbe83946c1541ae6dbdf9" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "093b2a26030dcd576cad4e59b5d804bc0496e56f4e2659e8900b4814279c3402" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (auto-sudoedit circe multi-term tldr multi-web-mode batch-mode auctex color-theme-sanityinc-tomorrow color-theme-tango arjen-grey-theme smart-cursor-color zenburn-theme color-theme-zenburn zenburn irony-eldoc smart-mode-line-powerline-theme smart-mode-line company-jedi toml-mode move-text multiple-cursors hungry-delete neotree ag realgud company-irony-c-headers ctags-update markdown-mode centered-cursor-mode magit expand-region elpy monokai-theme smart-compile company cargo racer rust-mode auto-complete)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(save-place t)
 '(show-paren-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
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
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

(package-install-selected-packages)

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
(set-frame-font "Monaco 12" nil t)
(color-theme-sanityinc-tomorrow-eighties)

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

;;
;; Interactively Do Things
;;
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Stops IDO from searching in other paths when the
;; file doesn't exists in the current path
(setq ido-auto-merge-work-directories-length -1)


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
(global-set-key (kbd "C-c C-c C-a") 'align-regexp)

;;
;; Expand region
;;
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;
;; Undo / Redo
;;
(require 'undo-tree)
;; (global-undo-tree-mode)  There is a bug in which emacs fails to open when this is set
(defalias 'undo ''undo-tree-undo)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'redo)
(global-set-key (kbd "C-y") 'redo)
(global-set-key (kbd "C-S-v") 'yank)

;; Switch current buffer to other window
(global-set-key (kbd "C-S-x b")
                (lambda ()
                  (interactive)
                  (switch-to-buffer-other-window (current-buffer))))

;;
;; Capitalize
;;
(global-set-key (kbd "C-x C-S-C") 'capitalize-region)

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
(global-set-key (kbd "C-c C-l") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;
;; Auto-SudoEdit
;;
(require 'auto-sudoedit)
(auto-sudoedit-mode 1)
;;
;; Company
;;
(add-hook 'prog-mode-hook #'company-mode)
(define-key prog-mode-map (kbd "TAB") #'company-indent-or-complete-common)

;;
;; Identation and code style
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

;; (setenv "ARDUINO_HOME" "/usr/share/arduino")
;; (put 'arduino-mode 'derived-mode-parent 'prog-mode)
;; (require 'company-arduino)

;; ;; Configuration for irony.el
;; ;; Add arduino's include options to irony-mode's variable.
;; (add-hook 'irony-mode-hook 'company-arduino-turn-on)

;; ;; Configuration for company-c-headers.el
;; ;; The `company-arduino-append-include-dirs' function appends
;; ;; Arduino's include directories to the default directories
;; ;; if `default-directory' is inside `company-arduino-home'. Otherwise
;; ;; just returns the default directories.
;; ;; Please change the default include directories accordingly.

;; (defun my-company-c-headers-get-system-path ()
;;   "Return the system include path for the current buffer."
;;   (let ((default '("/usr/include/" "/usr/local/include/")))
;;     (company-arduino-append-include-dirs default t)))
;; (setq company-c-headers-path-system 'my-company-c-headers-get-system-path)


;; (setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
;; (autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;; ;; Activate irony-mode on arduino-mode
;; (add-hook 'arduino-mode-hook 'irony-mode)

;; (add-hook 'arduino-mode-hook
;;       (lambda ()
;;         (add-to-list 'company-backends 'company-irony)
;;         (add-to-list 'company-backends 'company-c-headers)))

;; (add-hook 'arduino-mode-hook
;;       (lambda () (run-hooks 'prog-mode-hook)))


;;
;; Rust lang
;;
(require 'rust-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(setq company-tooltip-align-annotations t)

;;
;; C lang
;;
(require 'cc-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

(autoload 'turn-on-ctags-auto-update-mode
  "ctags-update"
  "turn on 'ctags-auto-update-mode'." t)

(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
;; NOTE: For some reason c-mode is not getting this key-binding from
;; prog-mode
(define-key c-mode-base-map (kbd "TAB") #'company-indent-or-complete-common)

(add-hook 'c-mode-common-hook
      (lambda ()
        (define-key c-mode-base-map (kbd "C-c b") 'smart-compile)))

;; Comment with '//' instead of '/**/'
(add-hook 'c-mode-hook (lambda ()
             (setq comment-start "//"
                   comment-end   "")))

;;
;; Python lang
;;
(add-hook 'python-mode-hook 'elpy-enable)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook
      (lambda ()
        (define-key python-mode-map (kbd "C-c b") 'smart-compile)))

(add-hook 'python-mode-hook
      (lambda ()
        (add-to-list 'company-backends 'company-jedi)))

;;
;; Compilation
;;
(require 'smart-compile)
(setq compilation-ask-about-save nil)        ;; I'm not scared of saving everything.
(setq compilation-scroll-output 'next-error) ;; Stop on the first error.
(setq compilation-skip-threshold 2)          ;; Don't stop on info or warnings.

(setq smart-compile-alist
      (append
       '(("\\.c\\'"           . "gcc -Wall -lm -g -lpthread %f -o %n")
     ("\\.[Cc]+[Pp]*\\'"  . "g++ -std=c++14 -Wall -g %f -o %n")
     ("\\.lua\\'"         . "lua %f")
     ("\\.py\\'"          . "python %f")
     ;; ("\\.ino\\'"         . "arduino --upload %f")
     ;; ("\\.pde\\'"         . "arduino --upload %f")
     ("\\.go\\'"          . "go build %f"))
       smart-compile-alist))

;;
;; Clean whitespace when saving
;;
(add-hook 'before-save-hook #'whitespace-cleanup)

;;
;; Highlight especial words
;;
(add-hook 'prog-mode-hook
    (lambda ()
      (font-lock-add-keywords
       nil
       '(("\\<\\(FIXME\\|TODO\\|BUG\\|NOTE\\|HACK\\|README\\|WARNING\\)"
      1 font-lock-warning-face t)))))


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
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(split-window-horizontally)
(setq scroll-step 1)
(tool-bar-mode -1)                              ;; No toolbar
(menu-bar-mode -1)                              ;; No menubar
(global-hl-line-mode 1)                         ;; Highlight current line
(line-number-mode 1)                            ;; Show line-number in the mode line
(column-number-mode 1)                          ;; Show column-number in the mode line
(mouse-wheel-mode t)                            ;; Mouse-wheel enabled
(show-paren-mode 1)                             ;; Highlight parenthesis pairs
(setq truncate-partial-width-windows nil)       ;; Don't truncate long lines
(global-visual-line-mode t)                     ;; Better linewrapping
(setq read-file-name-completion-ignore-case 't) ;; Ignore case when completing file names
(setq read-buffer-completion-ignore-case 't)    ;; Ignore case when completing buffer names
(setq-default case-fold-search t)               ;; Search is case sensitive
(defalias 'yes-or-no-p 'y-or-n-p)               ;; y/n instead of yes/no

(global-auto-revert-mode t)                     ;; Update buffers when files change in disk

(global-linum-mode 1)                           ;; Show line numbers
(setq linum-format "%d ")                       ;; Line numbers format

(smart-cursor-color-mode t)                     ;; Set cursor color to text color

(setq initial-scratch-message
      ";; Present day.\n;; Present time.\n;; Hahahahaha.\n\n")

;; This works when using emacs --daemon + emacsclient
(put 'downcase-region 'disabled nil)

;;
;; Template
;;
(defun template ()
  "My template"
  (interactive )
  (let (filename))
  (setq filename (read-file-name "File: "))
  (shell-command (concat "template -r " filename))
  (find-file filename))
(global-set-key (kbd "C-x t") 'template)

;;
;; Git
;;
(defalias 'git 'magit-status)
(put 'upcase-region 'disabled nil)

;;
;; Smarter move to beginning of line
;;
(defun smarter-move-beginning-of-line (arg)
  "Toggles between moving the cursor to the
first non-whitespace char in the line and
the actual beginning of the line"
  (interactive "^p")
  (setq arg (or arg 1))

  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))
(global-set-key (kbd "C-a") 'smarter-move-beginning-of-line)
(global-set-key (kbd "<home>") 'smarter-move-beginning-of-line)


;;
;; Delete line
;;
(defun delete-line ()
  "Deletes the line at the cursor"
  (interactive)
  (move-end-of-line 1)
  (set-mark (point))
  (move-beginning-of-line 1)
  (delete-region (region-beginning) (region-end)))
(global-set-key (kbd "C-c d") 'delete-line)


;;
;; Transpose windows
;;
;; NOTE(erick): Copied from https://github.com/bbatsov/crux/blob/master/crux.el
;; modified from https://www.emacswiki.org/emacs/TransposeWindows
(defun crux-transpose-windows (arg)
  "Transpose the buffers shown in two windows.
Prefix ARG determines if the current windows buffer is swapped
with the next or previous window, and the number of
transpositions to execute in sequence."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
        (next-win (window-buffer (funcall selector))))
    (set-window-buffer (selected-window) next-win)
    (set-window-buffer (funcall selector) this-win)
    (select-window (funcall selector)))
      (setq arg (if (cl-plusp arg) (1- arg) (1+ arg))))))
(global-set-key (kbd "C-x 4 t") 'crux-transpose-windows)

;;
;; Comment line or region
;;
;; NOTE(erick): Copied from https://github.com/bbatsov/crux/blob/master/crux.el
(defun crux-get-positions-of-line-or-region ()
  "Return positions (beg . end) of the current line or region."
  (let (beg end)
    (if (and mark-active (> (point) (mark)))
    (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
    (exchange-point-and-mark))
    (setq end (line-end-position))
    (cons beg end)))

(defun comment-line-or-region ()
  ""
  (interactive)
  (pcase-let* ((origin (point))
           (`(,beg . ,end) (crux-get-positions-of-line-or-region)))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "M-;") 'comment-line-or-region)

;;
;; Move parens
;;
(global-set-key (kbd "C-S-p") 'backward-list)
(global-set-key (kbd "C-S-n") 'forward-list)


;;
;; Multi-web modes
;;
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags
  '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
    (js-mode  "<script[^>]*>" "</script>")
    (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;;
;; Org mode
;;
(require 'ox-latex)
(setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

;; Artigo Padrão
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

;; Monografia - DCC
;; (add-to-list 'org-latex-classes
;;              '("projetofinal-dcc"
;;                "\\documentclass{projetofinal-dcc}"
;;                ("\\chapter{%s}" . "\\chapter*{%s}")
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
