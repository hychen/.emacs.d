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
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(setq ido-enable-flex-matching t
      ido-enable-dot-prefix t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers 'auto)

(add-to-list 'ido-ubiquitous-command-overrides
             '(disable exact "todo-add-category"))

(require 'smex nil t)
(eval-after-load 'smex
  '(progn
     (smex-initialize)
     (global-set-key [remap execute-extended-command] 'smex)
     (global-set-key (kbd "M-X") 'smex-major-mode-commands)
     (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

(provide 'rc-ido)
