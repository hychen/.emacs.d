(require-package 'idle-highlight-mode)
(require-package 'color-theme-solarized)

(require 'idle-highlight-mode)

;; Load default theme
;;(load-theme 'solarized-light t)
(load-theme 'solarized-dark t)

;; Turn off mouse interfae early in startup to avoid momentary display
;; (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
;;    (when (fboundp mode) (funcall mode -1)))

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

;; Sets an idle timer that highlights all occurences in the buffer
;; of the word under the point.
(setq idle-highlight-mode t)

;; Highlight current line
;(global-hl-line-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Display buffer name in window title
(setq frame-title-format "%b@emacs")

;; Making Buffer Names Unique
(setq uniquify-buffer-name-style 'forward)

;; Colorfull diff 
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

;; Enable display/open image in Emacs
(auto-image-file-mode)

;; Display empty lines
(set-default 'indicate-empty-lines t)

(provide 'rc-appearance)
