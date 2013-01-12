(when (not (package-installed-p 'slime)) (package-install 'slime))
(when (not (package-installed-p 'slime-js)) (package-install 'slime-js))
(when (not (package-installed-p 'js2-mode)) (package-install 'js2-mode))
(when (not (package-installed-p 'js2-refactor)) (package-install 'js2-refactor))

(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(autoload 'slime-js-jack-in-browser "setup-slime-js" nil t)

(provide 'setup-javascript)
