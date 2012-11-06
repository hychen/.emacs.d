;; Load default theme
(load-theme 'tomorrow-night-bright t)

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

;; Set line number format in left
(setq linum-format "%2d")

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)

;; Highlight current line
;;(global-hl-line-mode 1)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Display buffer name in window title
(setq frame-title-format "%b@emacs")

;; Making Buffer Names Unique
(setq uniquify-buffer-name-style 'forward)

(provide 'rc-appearance)
