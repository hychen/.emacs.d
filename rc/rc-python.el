;;; rc-python.el -- Python Mode Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: Chen Hsin-Yi <ossug.hychen@gmail.com>

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

;; Enable Python Mode
(rc-require 'python-mode)
;; Check your program for style errors and common mistakes
(rc-require 'python-pep8)
(rc-require 'python-pylint)

;; Use pydoc by M-X pydoc
(defun pydoc (keyword)
  (interactive "sKeyword: ")
  (shell-command (concat "pydoc " keyword))
  (with-current-buffer "*Shell Command Output*"
    (local-set-key (kbd "q") 'quit-window)))

(provide 'rc-python)
;; rc-python.el ends here
