(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-hook 'emacs-startup-hook 'delete-other-windows)

(setq inhibit-splash-screen t)
(global-linum-mode t)
(set-scroll-bar-mode 'right)

(set-face-attribute'default nil
			    :family "Consolas" ;; font
			    :height 112);; font size

(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "UmePlus Gothic")) ;; font

(set-background-color "#fffacd") ;; background color
(set-foreground-color "black")   ;; font color

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; interactively do things mode
(require 'ido)
(ido-mode t)

;; disable nxml-mode and activate xml-mode with psgml
(require 'nxml-mode)
(require 'psgml)

;; psgml syntax highlighting and indenting
(setq sgml-set-face t)
(setq sgml-auto-activate-dtd t)
(setq sgml-indent-data t)

;; *.xml will be recognized xml-mode
(setq auto-mode-alist
      (append
       (list
        '("\\.xml" . xml-mode)
        '("\\.tmx" . xml-mode)
	'("\\.srx" . xml-mode))
       auto-mode-alist))
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

;; install-elisp
(add-to-list 'load-path "~/.emacs.d/")
(require 'install-elisp)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; direx (side pane)
(require 'direx)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")

;; psgml change face
(setq sgml-markup-faces '(
    (start-tag . font-lock-keyword-face)
    (end-tag . font-lock-keyword-face)
    (comment . font-lock-comment-face)
    (pi . font-lock-constant-face) ;; <?xml?>
    (sgml . font-lock-type-face)
    (doctype . bold)
    (entity . italic)
    (shortref . font-lock-reference-face)))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; pymacs
(add-to-list 'load-path "~/.emacs.d/pymacs-0.25/")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

; ropemacs
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

;; auto-complete
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; fill-column indicator
(add-to-list 'load-path "~/.emacs.d")
(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

;; python-mode
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.3")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

;; auto-install
(add-to-list 'load-path (expand-file-name "~/elisp"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/lisp/")

;; workgroups
;;(add-to-list 'load-path "/path/to/workgroups.el")
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
;;(workgroups-mode 1)
;;(wg-load "/home/hitokazu/Tools/git/myemacs/shell.wg")

;; startup tools 
;; (add-to-list 'load-path "~/.emacs.d")
;; (load-library "direx")
;; (load-library "eshell")

;; add package functionality to emacs 23
;;(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
;;(add-to-list 'package-archives 
;;    '("gnu" .
;;      "http://elpa.gnu.org/packages/"))
;;(package-initialize)

;; add package archives to emacs 24
;;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                         ("marmalade" . "http://marmalade-repo.org/packages/")
;;                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; enable melpa
(require 'package)

; add to package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))


; initialization
(package-initialize)

; melpa.el
;; (require 'melpa)


