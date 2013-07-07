

;;----------------------------------------------------------------------------
;; company
;;----------------------------------------------------------------------------
(package-require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-require-match nil)

;;----------------------------------------------------------------------------
;; auto-complete
;;----------------------------------------------------------------------------
(package-require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-expand-on-auto-complete nil)
(setq ac-auto-start nil)
(setq ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed

(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode sql-mode ielm-mode))
  (add-to-list 'ac-modes mode))

;; Exclude very large buffers from dabbrev
(defun sanityinc/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

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

;; Auto complete operator
;;(package-require 'smart-operator) ;; use git version.
(require 'smart-operator)

(provide 'rc-auto-complete)
