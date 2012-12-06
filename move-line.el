(provide 'move-line)

(defun move-line-up ()
  "moves current line 1 up"
  (interactive)
  (move-current-line t))

(defun move-line-down ()
  "moves current line 1 down"
  (interactive)
  (move-current-line))

(defun save-column (func)
  "restored current column after invoking func"
  (let ((column (current-column)))
    (funcall func)
     (move-to-column column)))

(defun move-current-line (&optional up)
  "moves current line up or down, argument decides which way"
  (save-column(lambda ()
		(if up (progn
			 (move-beginning-of-line())
			 (kill-whole-line)
			 (previous-line)
			 (move-beginning-of-line())
			 (yank)
			 (previous-line))
		  (progn
		    (move-beginning-of-line())
		    (kill-whole-line)
		    (next-line)
		    (yank)
		    (previous-line))))))






