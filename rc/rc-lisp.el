;;; rc-lisp.el --- LISP Settings

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(provide 'rc-lisp)
;;; rc-lisp.el ends here
