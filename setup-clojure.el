(when (not (package-installed-p 'nrepl)) (package-install 'nrepl))
(when (not (package-installed-p 'paredit)) (package-install 'paredit))
(when (not (package-installed-p 'rainbow-delimiters)) (package-install 'rainbow-delimiters))

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode) 
(add-hook 'clojure-mode-hook 'show-paren-mode) 


(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))

(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(provide 'setup-clojure)
