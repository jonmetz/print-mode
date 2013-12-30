(defvar print-mode-keymap (make-keymap) "print-mode keymap.")

(define-minor-mode print-mode
  :version "0.0.1"
  :keymap print-mode-keymap)

(setq counter 0)
(setq mode (format "%s" major-mode))
(define-key print-mode-keymap (kbd "C-c i") 'print-mode-insert-statement)

;; (defun print-mode-set-statement ()
;;   (if (equal mode "emacs-lisp-mode")
;;       (setq print-mode-statement "\n(print %d)\n")
;;     (setq print-mode-statement "// No valid mode detected %d\n")
;;     ))

;; (defun print-mode-create-statement (print-statement)
;;   let (

(defun print-mode-set-statement ()
  (if (equal mode "emacs-lisp-mode")
      (setq print-mode-statement "\n (print \"\\n %d \\n\") \n")
    (if (equal mode "c-mode")
        (setq print-statement "\nprintf(\"\\n %d \\n\");")
      (if (equal mode "python-mode")
          (setq print-statement "\nprint('\\n %d \\n')")
        ("\n// No mode recognized")))))

(print-mode-set-statement)

;; (defun print-mode-insert-statement ()
;;   (interactive)
;;   (progn 
;;     (insert (format (print-mode-set-statement counter))
;;     (message (format "print statement inserted on %s" (what-line)))
;;     (setq counter (+ 1 counter)))))
(defun print-mode-insert-statement ()
  (interactive)
  (progn 
    (insert (format print-mode-statement counter))
    (message (format "print statement inserted on %s" (what-line)))
    (setq counter (+ 1 counter))))

(provide 'print-mode)











