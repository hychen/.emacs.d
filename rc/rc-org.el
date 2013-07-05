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
(package-require 'org)
(require 'org)

;; Basic settings
(setq org-directory "~/org")
(setq refilepath "~/Ubuntu One/org/dayplanner/refile.org")
(setq diarypath "~/Ubuntu One/org/dayplanner/diary.org")

;; Task Management
;; ---------------
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DELEGATED(e@/!)" "DONE(d)")
	      (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("DELEGATED" :foreground "SteelBlue4" :weight bold)
	      ("CANCELLED" :foreground "forest green" :weight bold)	      
              ("PHONE" :foreground "forest green" :weight bold))))

;; stuck project
(setq org-tags-exclude-from-inheritance '("project")
      org-stuck-projects '("+project/-HOLD-CANCELLED-DONE"
			   ("TODO" "NEXT") ()))

;; Refill
;; --------------------------------------------------------------------------------------
(setq org-default-notes-file refilepath)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, and org-protocol
(setq org-capture-templates
      (quote (("t" "Todo" entry (file refilepath)
	       "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
	      ("r" "Respond" entry (file refilepath)
	       "* NEXT Respond to  on \nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t)
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

(setq org-agenda-start-on-weekday  1)

;; Always hilight the current agenda line
(add-hook 'org-agenda-mode-hook
          '(lambda () (hl-line-mode 1))
          'append)

;; Keep tasks with dates on the global todo lists
(setq org-agenda-todo-ignore-with-date nil)

;; Keep tasks with deadlines on the global todo lists
(setq org-agenda-todo-ignore-deadlines nil)

;; Keep tasks with scheduled dates on the global todo lists
(setq org-agenda-todo-ignore-scheduled nil)

;; Keep tasks with timestamps on the global todo lists
(setq org-agenda-todo-ignore-timestamp nil)

;; Remove completed deadline tasks from the agenda view
(setq org-agenda-skip-deadline-if-done t)

;; Remove completed scheduled tasks from the agenda view
(setq org-agenda-skip-scheduled-if-done t)

;; Remove completed items from search results
(setq org-agenda-skip-timestamp-if-done t)

(setq org-agenda-include-diary t)
(setq org-agenda-insert-diary-extract-time t)
;; Include agenda archive files when searching for things
(setq org-agenda-text-search-extra-files (quote (agenda-archives)))

;; Show all future entries for repeating tasks
(setq org-agenda-repeating-timestamp-show-all t)

(setq org-agenda-span 'day)

;; Show all agenda dates - even if they are empty
(setq org-agenda-show-all-dates t)
;; Sorting order for tasks on the agenda
(setq org-agenda-sorting-strategy
      (quote ((agenda habit-down time-up user-defined-up priority-down effort-up category-keep)
              (todo category-up priority-down effort-up)
              (tags category-up priority-down effort-up)
              (search category-up))))

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (;;-- commands start
	      ("N" "Notes" tags "NOTE"
              ((org-agenda-overriding-header "Notes")
	       (org-tags-match-list-sublevels t)))
	      ;;--
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags "@email/-DONE-HOLD-CANCELLED-WAITING"
                      ((org-agenda-overriding-header "Tasks to Respond or Notice")
				    (org-agenda-todo-ignore-scheduled t)
				    (org-agenda-todo-ignore-deadlines t)
				    (org-agenda-todo-ignore-with-date t)
			       (org-tags-match-list-sublevels nil)))		
                (todo "NEXT"
                           ((org-agenda-overriding-header "Next Tasks")
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-agenda-todo-ignore-with-date t)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))		
		(tags "FOLLOW"
                           ((org-agenda-overriding-header "Followup Tasks")           
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled 'future)
                            (org-agenda-todo-ignore-deadlines 'future)
			    (org-agenda-sorting-strategy
			     '(todo-state-down effort-up category-keep))))
		(stuck ""
		       ((org-agenda-overriding-header "Stuck Projects"))
		       )
		(tags "project/-DONE"
		      ((org-agenda-overriding-header "Projects")
		       (org-agenda-sorting-strategy
			'(todo-state-down effort-up category-keep)))
		      ) 
		(todo "WAITING|HOLD|DELEGATED"
                           ((org-agenda-overriding-header "Waiting and Postponed Tasks")           
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled 'future)
                            (org-agenda-todo-ignore-deadlines 'future)
			    (org-agenda-sorting-strategy
			     '(todo-state-down effort-up category-keep))))
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
			((org-agenda-overriding-header "Projects")
			 (org-agenda-sorting-strategy
			  '(todo-state-down effort-up category-keep)))
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

;; Clocking
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
 
;; Logging 
(setq org-log-done (quote time))
(setq org-log-into-drawer t)
(setq org-log-state-notes-insert-after-drawers nil)
;; Agenda log mode items to display (closed and state changes by default)
(setq org-agenda-log-mode-items (quote (closed state)))

;; Custom Key Bindings
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "<f11>") 'org-capture)
(global-set-key (kbd "<f12>") 'org-agenda)

;; Enable abbrev-mode
(add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))

;; Skeletons
;;
;; sblk - Generic block #+begin_FOO .. #+end_FOO
(define-skeleton skel-org-block
  "Insert an org block, querying for type."
  "Type: "
  "#+begin_" str "\n"
  _ - \n
  "#+end_" str "\n")

(define-abbrev org-mode-abbrev-table "sblk" "" 'skel-org-block)

;; splantuml - PlantUML Source block
(define-skeleton skel-org-block-plantuml
  "Insert a org plantuml block, querying for filename."
  "File (no extension): "
  "#+begin_src plantuml :file " str ".png :cache yes\n"
  _ - \n
  "#+end_src\n")

(define-abbrev org-mode-abbrev-table "splantuml" "" 'skel-org-block-plantuml)

(define-skeleton skel-org-block-plantuml-activity
  "Insert a org plantuml block, querying for filename."
  "File (no extension): "
  "#+begin_src plantuml :file " str "-act.png :cache yes :tangle " str "-act.txt\n"
  "@startuml\n"
  "skinparam activity {\n"
  "BackgroundColor<<New>> Cyan\n"
  "}\n\n"
  "title " str " - \n"
  "note left: " str "\n"
  "(*) --> (*)\n"
  _ - \n
  "@enduml\n"
  "#+end_src\n")

(define-abbrev org-mode-abbrev-table "sact" "" 'skel-org-block-plantuml-activity)

(define-skeleton skel-org-block-plantuml-activity-if
  "Insert a org plantuml block activity if statement"
  "" 
  "if \"\" then\n"
  "  -> [] \"" - _ "\"\n"
  "  --> ==M1==\n"
  "  -left-> ==M2==\n"
  "else\n"
  "end if\n"
  "--> ==M2==")

(define-abbrev org-mode-abbrev-table "sif" "" 'skel-org-block-plantuml-activity-if)

(define-skeleton skel-org-block-plantuml-activity-for
  "Insert a org plantuml block activity for statement"
  "" 
  "--> ==LOOP1==\n"
  "note left: Loop1: For each\n"
  "--> ==ENDLOOP1==\n"
  "note left: Loop1: End for each")

(define-abbrev org-mode-abbrev-table "sfor" "" 'skel-org-block-plantuml-activity-for)

(define-skeleton skel-org-block-plantuml-sequence
  "Insert a org plantuml activity diagram block, querying for filename."
  "File appends (no extension): "
  "#+begin_src plantuml :file " str "-seq.png :cache yes :tangle " str "-seq.txt\n"
  "@startuml\n"
  "title " str " - \n"
  "actor CSR as \"Customer Service Representative\"\n"
  "participant CSMO as \"CSM Online\"\n"
  "participant CSMU as \"CSM Unix\"\n"
  "participant NRIS\n"
  "actor Customer"
  _ - \n
  "@enduml\n"
  "#+end_src\n")

(define-abbrev org-mode-abbrev-table "sseq" "" 'skel-org-block-plantuml-sequence)

;; sdot - Graphviz DOT block
(define-skeleton skel-org-block-dot
  "Insert a org graphviz dot block, querying for filename."
  "File (no extension): "
  "#+begin_src dot :file " str ".png :cache yes :cmdline -Kdot -Tpng\n"
  "graph G {\n"
  _ - \n
  "}\n"
  "#+end_src\n")

(define-abbrev org-mode-abbrev-table "sdot" "" 'skel-org-block-dot)

;; sditaa - Ditaa source block
(define-skeleton skel-org-block-ditaa
  "Insert a org ditaa block, querying for filename."
  "File (no extension): "
  "#+begin_src ditaa :file " str ".png :cache yes\n"
  _ - \n
  "#+end_src\n")

(define-abbrev org-mode-abbrev-table "sditaa" "" 'skel-org-block-ditaa)

;; selisp - Emacs Lisp source block
(define-skeleton skel-org-block-elisp
  "Insert a org emacs-lisp block"
  ""
  "#+begin_src emacs-lisp\n"
  _ - \n
  "#+end_src\n")

(define-abbrev org-mode-abbrev-table "selisp" "" 'skel-org-block-elisp)

; Overwrite the current window with the agenda
(setq org-agenda-window-setup 'current-window)

(setq org-list-demote-modify-bullet (quote (("+" . "-")
                                            ("*" . "-")
                                            ("1." . "-")
                                            ("1)" . "-"))))

(provide 'rc-org)
;;; rc-org.el ends here
