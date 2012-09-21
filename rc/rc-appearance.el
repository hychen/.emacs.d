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

;; split 2 column window
(split-window-right)
(provide 'rc-appearance)
