;;; rc-coffee-mode.el --- CoffeeScript settings

;; Copyright (C) 2014  Chen Hsin-Yi

;; Author: hychen <ossug.hychen@gmail.com>
;; Keywords: docs, markdown

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
(require-package 'coffee-mode)
(require 'coffee-mode)

;; This gives you a tab of 2 spaces
(custom-set-variables '(coffee-tab-width 2))

(provide 'rc-coffee-mode)
;;; rc-coffee-mode.el ends here
