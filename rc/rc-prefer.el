;; Revert buffer from disk always if content is different.
(global-auto-revert-mode t)

;; Don't inserts tabs in place of multiple spaces when it formats a region. 
(setq-default indent-tabs-mode nil)

;; Saving or writing a file silently puts a newline at the end if there
;; isn't already one there.
(setq require-final-newline t)

;; Use text-mode as default
(setq default-major-mode 'text-mode)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (locate-user-emacs-file "backups")))))

;; Seed the random-number generator
(random t)

;; Transparently open compressed files
(auto-compression-mode t)

;; Use y instead of yes, and n insted of no
(defalias 'yes-or-no-p 'y-or-n-p)

;; overrides Emacs’ default mechanism for making buffer names unique
;; which use parts of the file names to make the buffer names distinguishable.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; When you visit a file, point goes to the last place where it was when you
;; previously visited the same file.
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

(provide 'rc-prefer)
