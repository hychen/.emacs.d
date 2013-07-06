(require 'cflow-mode)

(eval-after-load "cc-mode"
  '(progn
     ;; http://emacser.com/emacs-cflow.htm 
     (defun my/cflow-function (function-name)
       "Get call graph of inputed function. "
       (defvar cmd nil nil)
       (defvar cflow-buf nil nil)
       (defvar cflow-buf-name nil nil)
       (interactive "sFunction name:\n")
       (setq cmd (format "cflow -b --main=%s %s" function-name buffer-file-name))
       (setq cflow-buf-name (format "**cflow-%s:%s**"
				    (file-name-nondirectory buffer-file-name)
				    function-name))
       (setq cflow-buf (get-buffer-create cflow-buf-name))
       (set-buffer cflow-buf)
       (setq buffer-read-only nil)
       (erase-buffer)
       (insert (shell-command-to-string cmd))
       (pop-to-buffer cflow-buf)
       (goto-char (point-min))
       (cflow-mode)
       )

     (defun my/cflow-current-function (arg)
       ""
       (interactive "p")
       (my/cflow-function (current-word))
       )
     (define-key c-mode-map (kbd "<f2>") 'my/cflow-current-function)
     ))

(provide 'rc-c-cplus)
