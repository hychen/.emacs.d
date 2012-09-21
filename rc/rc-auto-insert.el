(require 'autoinsert)

(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory (locate-user-emacs-file "skeleton"))
(setq auto-insert 'other)
(setq auto-insert-query nil)

(define-auto-insert 'python-mode "default.py")

(provide 'rc-auto-insert)
