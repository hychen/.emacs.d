;;; rc-org.el --- Org Mode Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: Chen Hsin-Yi <ossug.hychen@gmail.com>
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

;;; Code:

;; Common

;; Based on
;; ref: http://doc.norang.ca/org-mode.html
(require-package 'org)
(require 'org)

;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa

;; don't ask before evaluating ditaa blocks
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "ditaa")))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; Switching Notes directory.
(defun goto-notes ()
  "Switch to my work dir."
   (interactive)
   (find-file "~/Dropbox/Org/Notes")
   )

(global-set-key (kbd "<f12>") 'goto-notes)

(provide 'rc-org)
;;; rc-org.el ends here
