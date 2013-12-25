(require 'easymenu)

(setq counter 0)

(let (mode (format "%" major-mode))
  (if (equal mode  "emacs-lisp-mode")
      (print "aaa")
    (print "b")
))

(defun insert-print-statement 
  (interactive)
  (progn 
    (insert (format print-statement counter))
    (message (format "print statement inserted on %s" (what-line)))
    (setq counter (+ 1 counter)))) 
  
;; (defun incrementing-print-statement ()


