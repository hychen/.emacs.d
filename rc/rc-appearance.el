;; Turn off mouse interfae early in startup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1)))

;; Turn off Startup Message
(setq inhibit-startup-message t)

;; Display column number in status bar
(setq column-number-mode t)

;; Display line number in status bar
(setq line-number-mode t)

;; Display line number in left
(global-linum-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)

(setq linum-format "%2d")

;; Custom faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "apple" :slant normal :weight normal :height 128 :width normal)))))

(provide 'rc-appearance)
