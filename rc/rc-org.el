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
(require 'org)

;; Basic settings
(setq org-directory "~/org")
(setq refilepath "~/org/refile.org")
(setq diarypath "~/org/diary.org")

;; Task Management
;; ---------------
(setq org-agenda-files (quote ("~/org/refile.org"
			       "~/org/work.org"
			       "~/org/work-fo.org"
			       "~/org/work-st.org"
			       )))
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
	      (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

;; stuck project
(setq org-tags-exclude-from-inheritance '("project")
      org-stuck-projects '("+project/-HOLD-CANCELLED"
			   ("TODO" "NEXT") ()))

;; Refill
;; --------------------------------------------------------------------------------------
(setq org-default-notes-file refilepath)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, and org-protocol
(setq org-capture-templates
      (quote (("t" "Todo" entry (file refilepath)
	       "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
	      ("r" "Respond" entry (file refilepath)
	       "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
	      ("n" "Note" entry (file refilepath)
	       "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
	      ("j" "Journal" entry (file+datetree diarypath)
	       "* %?\n%U\n" :clock-in t :clock-resume t)
	      ("w" "org-protocol" entry (file refilepath)
	       "* TODO Review %c\n%U\n" :immediate-finish t)
	      ("p" "Phone call" entry (file refilepath)
	       "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t))))

;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
				 (org-agenda-files :maxlevel . 9))))
;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Use IDO for both buffer and file completon and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
;; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)

;; Custom Agenda View
;; ------------------
;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

(setq org-agenda-start-on-weekday  nil)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (;;-- commands start
	      ("N" "Notes" tags "note"
              ((org-agenda-overriding-header "Notes")
	       (org-tags-match-list-sublevels t)))
	      ;;--
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (todo "TODO|NEXT"
                           ((org-agenda-overriding-header "Next Tasks")
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-agenda-todo-ignore-with-date t)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))		
		(stuck ""
		       ((org-agenda-overriding-header "Stuck Projects"))
		       )
		(todo "WAITING|HOLD"
                           ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                            (org-agenda-skip-function 'bh/skip-stuck-projects)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled 'future)
                            (org-agenda-todo-ignore-deadlines 'future)))
		))	      
	      ;;--
              ("r" "Tasks to Refile" tags "REFILE"
               ((org-agenda-overriding-header "Tasks to Refile")
                (org-tags-match-list-sublevels nil)))
	      ;;--
              ("n" "Next Tasks" todo "TODO|NEXT"
               ((org-agenda-overriding-header "Next Tasks")
                (org-agenda-todo-ignore-scheduled t)
                (org-agenda-todo-ignore-deadlines t)
                (org-agenda-todo-ignore-with-date t)
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
	      ;;--
	      ("w" "Waiting Tasks" todo "WAITING|HOLD"
               ((org-agenda-overriding-header "Waiting and Postponed tasks")))
	      ;;--
	      ("W" "Weekly Review"
		 ((agenda "" ((org-agenda-ndays 7))) ;; review upcoming deadlines and appointments
		  ;; type "l" in the agenda to review logged items 
		  (stuck ""
			 ((org-agenda-overriding-header "Stuck Projects"))
			 )
		  (tags "project"
			((org-agenda-overriding-header "Projects"))
			) 
		  (todo "HOLD"
			((org-agenda-overriding-header "Postpond Tasks"))
			) 
		  (todo "WAITING"
			((org-agenda-overriding-header "Waitting Tasks"))
			)
		  ) 
		)	      
	      ;;--
              ("p" "Projects" tags "+project/-HOLD-CANCELLED"
               ((org-agenda-overriding-header "Projects")
                (org-agenda-sorting-strategy
                 '(category-keep))))	      
	      ;;-- commands end
	      )))

;; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))
(setq org-refile-target-verify-function 'bh/verify-refile-target)

;; Custom Key Bindings
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "<f11>") 'org-capture)
(global-set-key (kbd "<f12>") 'org-agenda)

(provide 'rc-org)
;;; rc-org.el ends here
