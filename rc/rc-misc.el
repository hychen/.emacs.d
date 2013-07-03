;;; rc-misc.el -- Misc Settings
(package-require 'window-number)
(package-require 'undo-tree)
(package-require 'ido-ubiquitous)
;;(package-require 'edit-server)

;;(when (and (daemonp) (locate-library "edit-server"))
;;  (require 'edit-server)
;;  (edit-server-start))

;;(package-require 'smart-operator)

(require 'smart-operator)
(require 'undo-tree)
(require 'ido-ubiquitous)
(require 'window-number)

;; Revert buffer from disk always if content is different.
(global-auto-revert-mode t)

;; Window Navigation
;; Use meta + N to switch between windows instead of
;; C-x C-j
(window-number-meta-mode)

;; Use text-mode as default
(setq default-major-mode 'text-mode)

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

;; Use y instead of yes, and n insted of no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Display empty lines
(set-default 'indicate-empty-lines t)

;; Colorfull diff 
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

;; Enable display/open image in Emacs
(auto-image-file-mode)

;; http://www.emacswiki.org/emacs/PythonProgrammingInEmacs
(delete-selection-mode t)

(provide 'rc-misc)
