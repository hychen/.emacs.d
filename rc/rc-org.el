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

;; Switching Notes directory.
(defun goto-notes ()
  "Switch to my work dir."
   (interactive)
   (find-file "~/Dropbox/Org/Notes")
   )

;; Helper for inserting note header.
(defsubst org-mode-insert-note-header ()
  "Insert \"#+TITLE: ...\" at the beginning of org file."
  (insert "#+TITLE: " (file-name-nondirectory (file-name-sans-extension (buffer-file-name))) "\n") ;; filename only, without dir or extension
  (insert "#+AUTHOR: " (user-full-name) "\n")
  (insert "#+OPTIONS: H:2 num:t toc:nil\n")
  (insert "#+OPTIONS: ^:nil\n")
  (insert "#+OPTIONS: <:nil todo:nil *:t ^:{} @:t ::t |:t TeX:t\n")
  (insert "#how to change image size: #+attr_html: width=\"40%\"\n"))

(global-set-key (kbd "<f12>") 'goto-notes)

(provide 'rc-org)
;;; rc-org.el ends here
