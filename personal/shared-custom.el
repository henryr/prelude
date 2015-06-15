;; Shared customisations between all my .emacs

;; Always use packages, and add the Marmalade repository
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(package-initialize)

;; .h files should be treated as C++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Google C style mode
(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)

;; C tweaks for Impala
(defconst my-cc-style
  '("Google" (c-offsets-alist .
                           ((innamespace . [0])
                            (arglist-cont-nonempty . 4)
                            (arglist-intro . 4)
                            (access-label . -1)
                            (member-init-intro . 4))
                           )))
(c-add-style "my-cc-style" my-cc-style)
(defun set-my-cc-style () (interactive) (google-set-c-style) (c-set-style "my-cc-style"))
(add-hook 'c-mode-common-hook 'set-my-cc-style)

(add-hook 'python-mode-hook '(lambda ()
 (setq python-indent 2)))

;; Set correct indentation for Java
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2)))

;; Various appearance tweaks
(setq linum-format " %d ")
(column-number-mode)
(fringe-mode 0)
(scroll-bar-mode)
(setq-default fill-column 90)
(global-linum-mode t)
(setq compilation-scroll-output t)

;; Whitespace mode everywhere
(prelude-enable-whitespace)
(global-whitespace-mode)
(setq whitespace-line-column 90)

;; Re-enable arrow-keys etc
(setq prelude-guru nil)

;; Custom keybindings
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c C-r") 'ff-find-other-file)
(global-set-key (kbd "M-=") 'er/expand-region)

;; Eval lisp region and buffer
(define-key emacs-lisp-mode-map (kbd "C-c C-b") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-c C-s") 'eval-region)

;; git-emacs provided for git-grep
(require 'git-emacs)
(define-key git-global-map "M" 'magit-status)

(provide 'shared-custom)
