;;; rc-ido.el - IDO

;; Copyright (C) 2014 Chen Hsin-Yi (陳信屹)

;; Author: Chen Hsin-Yi (陳信屹)
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;; ido-mode is like magic pixie dust!
;;(ido-mode 1)
;;(ido-everywhere 1)
;;(ido-ubiquitous-mode 1)
;;(setq ido-enable-flex-matching t
;;      ido-enable-dot-prefix t
;;      ido-create-new-buffer 'always
;;      ido-use-filename-at-point 'guess
;;      ido-use-virtual-buffers 'auto)

;;(add-to-list 'ido-ubiquitous-command-overrides
;;             '(disable exact "todo-add-category"))

;;(require 'smex nil t)
;;(eval-after-load 'smex
;;  '(progn
;;     (smex-initialize)
;;     (global-set-key [remap execute-extended-command] 'smex)
;;     (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;     (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

;; Helm is incremental completion and selection narrowing framework for Emacs. 
(require-package 'projectile)
(require-package 'helm)
(require-package 'helm-projectile)

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(helm-mode t)

(projectile-global-mode)
(setq projectile-completion-system 'helm)

(helm-projectile-on)

;; More powerful M-x.
(global-set-key (kbd "M-x") 'helm-M-x)
;; Show kill ring.
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; helm-mini comprises of multiple sources.
;; - Current opening buffers, under the header Buffers.
;; - Recently opened files, under the header Recentf.
;; - Allow to create a new buffer by pressing RET, under the header
;;   `Create Buffer`.
(global-set-key (kbd "C-x b") 'helm-mini)

;; More power find files.
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Find matched words in current buffer.
(global-set-key (kbd "C-c h o") 'helm-occur)

;; Use Ack-Grep instead grep in helm.
(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

;; Google Suggest
(global-set-key (kbd "C-c h g") 'helm-google-suggest)

;; disable its interference with Helm window
(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(provide 'rc-ido)
