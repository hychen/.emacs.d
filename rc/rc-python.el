

(add-hook 'python-mode-hook
      (lambda ()
	;; Insert operators with surrounding spaces smartly.
	(smart-operator-mode)
	))

(provide 'rc-python)
