(setq initial-scratch-message "")
(setq make-backup-files nil)
(put 'eval-expression 'disabled nil)
(show-paren-mode) 
(global-linum-mode t)

(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;;; stuff from the giraffe book:
(global-set-key "\C-x\ n"  'other-window)
(global-set-key "\C-x\ p"  'other-window-backward)

(defun other-window-backward (&optional n)
  "Select the previous window."
  (interactive "p")
  (if n
      (other-window (- n)))
  (other-window -1))
