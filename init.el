;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not (package-installed-p 'magit)) (package-install 'magit))
(when (not (package-installed-p 'undo-tree)) (package-install 'undo-tree))

(add-to-list 'load-path user-emacs-directory)
(eval-after-load 'clojure-mode (require 'setup-clojure))
(eval-after-load 'keychord (require 'setup-keychord))
;(eval-after-load 'javascript-mode (require 'setup-javascript))

(require 'setup-smex)

(setq initial-scratch-message "")
(setq backup-directory-alist `(("." . "/tmp/")))

(key-chord-define-global ",." 'next-multiframe-window)
(key-chord-define-global ".," 'previous-multiframe-window) 
(key-chord-define-global ";;" '(lambda()(interactive)(enlarge-window 5)))
(key-chord-define-global "::" '(lambda()(interactive)(shrink-window 5)))

(ido-mode t)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
(load-theme 'zenburn)
