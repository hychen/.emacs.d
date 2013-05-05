;; ref: 
;; - https://github.com/gabrielelanaro/emacs-for-python
;; - http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
(eval-after-load 'python
  '(progn
     (package-require 'virtualenv)
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

(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "RET") 'newline-and-indent)
	    (define-key python-mode-map (kbd "M-<right>") 'python-indent-shift-right)
	    (define-key python-mode-map (kbd "M-<left>") 'python-indent-shift-left)
	    ;; Insert operators with surrounding spaces smartly.
	    (smart-operator-mode)
	    ))

(provide 'rc-python)


