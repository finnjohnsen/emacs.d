(defvar clojure-packages 
  '(clojure-mode
  clojure-test-mode
  nrepl
  paren
  rainbow-delimiters))
(dolist (p clojure-packages)
  (unless (package-installed-p p)
    (package-install p)))
  
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode) 
(setq show-paren-style 'expression)
(add-hook 'clojure-mode-hook 'show-paren-mode) 
(add-hook 'clojure-mode-hook 'clojure-test-mode)

(defun start-nrepl-if-not-started() 
  (unless (get-buffer "*nrepl*") 
      (nrepl-jack-in)))

(defun nrepl-restart() 
  (interactive)
  (progn
      (nrepl-quit)
      (nrepl-jack-in t)))

(add-hook 'clojure-mode-hook 'start-nrepl-if-not-started)

(provide 'setup-clojure)

