(provide 'move-line)

(defun move-line-up ()
  "moves current line 1 up"
  (interactive)
  (move-current-line t))

(defun move-line-down ()
  "moves current line 1 down"
  (interactive)
  (move-current-line))

(defmacro save-column (&rest body)
  "Save current column and restore after body"
  `(let ((column (current-column)))
     ,@body
     (move-to-column column)))

(defun more-region (&optional up)
  (message "move region not yet implemented"))
 
(defun move-current-line (&optional up)
  "moves current line up or down, argument decides which way"
  (if mark-active
  (move-region up)
  (save-column(if up (progn
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
