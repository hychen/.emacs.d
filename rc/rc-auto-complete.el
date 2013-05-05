(package-require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; Do What I Mean mode
(setq ac-dwim t)
(ac-config-default)

;; -------------------
;; Pairing parentheses
;; -------------------

;; ref: https://github.com/gabrielelanaro/emacs-for-python/blob/master/epy-completion.el
;; All languages:
(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)

;; Just python
(add-hook 'python-mode-hook 
	  (lambda () 
	    (define-key python-mode-map "'" 'skeleton-pair-insert-maybe)))

(provide 'rc-auto-complete)
