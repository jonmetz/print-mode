(defvar print-mode-keymap (make-keymap) "print-mode keymap.")

(define-minor-mode print-mode
  :version "0.0.1"
  :keymap print-mode-keymap)

(setq counter 0)
(setq mode (format "%s" major-mode))
(define-key print-mode-keymap (kbd "C-c i") 'print-mode-insert-statement)

(defun print-mode-create-statement (print-statement)
    (format "\n%s \n" (format print-statement "\nDebug Message: %d \n")))
(defun print-mode-set-statement ()
  (if (equal mode "emacs-lisp-mode")
      (setq print-mode-statement (print-mode-create-statement "(print \"%s\")"))
    (if (equal mode "c-mode")
        (setq print-statement (print-mode-create-statement "printf(\"%s\");"))
      (if (equal mode "python-mode")
          (setq print-statement (print-mode-create-statement "print('%s')"))
        ("\n// No mode recognized")))))

(print-mode-set-statement)


(defun print-mode-insert-statement ()
  (interactive)
  (progn 
    (insert (format print-mode-statement counter))
    (message (format "print statement inserted on %s" (what-line)))
    (setq counter (+ 1 counter))))

(provide 'print-mode)











