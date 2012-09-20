;;; rc-misc.el -- Misc Settings

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (locate-user-emacs-file "backups")))))

;; Seed the random-number generator
(random t)

;; undo-tree mode 
(eval-after-load 'undo-tree
  '(global-undo-tree-mode))

;; text-mode with auto fill and flyspell
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;; ispell
(setq ispell-dictionary "american")

;; Transparently open compressed files
(auto-compression-mode t)

;; ido-mode is like magic pixie dust!
(rc-require 'ido-ubiquitous)

(ido-mode t)
(ido-ubiquitous t)
(ido-everywhere t)
(setq ido-enable-prefix nil 
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil 
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;; Auto-Complete
(rc-require 'auto-complete)
(global-auto-complete-mode t)

;; Use y instead of yes, and n insted of no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Display empty lines
(set-default 'indicate-empty-lines t)

;; Colorfull diff 
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(provide 'rc-misc)
