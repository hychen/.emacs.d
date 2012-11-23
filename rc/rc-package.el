;;; rc-packages.el -- Install required packages if need

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
(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Auto update index
(when (not package-archive-contents)
  (package-refresh-contents))

;; Fuctions

;; install package if package is not installed
(defun rc-package-try2install(p)
  (when (not (package-installed-p p))
    (package-install p)))

;; require a package, if package is not installed, then install it
(defun rc-require(p)
  (rc-package-try2install p)
    (require p))

(provide 'rc-package)
;;; rc-packages.el end
