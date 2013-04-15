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

;;; Commentary:

;; 

;;; Code:
(require 'org)

;; org-babel functions for python evaluation
(require 'ob-python)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa
(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")
(setq org-directory "~/org")

(setq org-log-done 'time)

(setq org-tags-exclude-from-inheritance '("prj")
      org-stuck-projects '("+prj/-MAYBE-DONE"
                           ("TODO" "Next") ()))

(setq org-default-notes-file (concat org-directory "/notes.org"))

; preview image inline.
(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
(setq org-babel-results-keyword "results")

(setq org-confirm-babel-evaluate nil)
(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

;; hotkeys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(provide 'rc-org)
;;; rc-org.el ends here
