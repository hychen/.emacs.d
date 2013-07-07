;; ref: 
;; - https://github.com/gabrielelanaro/emacs-for-python
;; - http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
(eval-after-load 'python
  '(progn
     (require-package 'virtualenv)
     (require 'virtualenv)
     ;;==================================================
     ;; use IPython
     ;;==================================================
     (setq
      python-shell-interpreter "ipython"
      python-shell-interpreter-args ""
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code
      "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code
      "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code
      "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
     ))


; patches by balle
; http://www.datenterrorist.de
(defun balle-python-shift-left ()
  (interactive)
  (let (start end bds)
    (if (and transient-mark-mode
	   mark-active)
	(setq start (region-beginning) end (region-end))
      (progn
	(setq bds (bounds-of-thing-at-point 'line))
	(setq start (car bds) end (cdr bds))))
  (python-indent-shift-left start end))
  (setq deactivate-mark nil)
)

(defun balle-python-shift-right ()
  (interactive)
  (let (start end bds)
    (if (and transient-mark-mode
	   mark-active)
	(setq start (region-beginning) end (region-end))
      (progn
	(setq bds (bounds-of-thing-at-point 'line))
	(setq start (car bds) end (cdr bds))))
  (python-indent-shift-right start end))
  (setq deactivate-mark nil)
)

(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "RET") 'newline-and-indent)
	    (define-key python-mode-map (kbd "M-<right>") 'balle-python-indent-shift-right)
	    (define-key python-mode-map (kbd "M-<left>") 'balle-python-indent-shift-left)
	    ;; Insert operators with surrounding spaces smartly.
	    (smart-operator-mode)
	    ))

(provide 'rc-python)


