;; Semantic Settings
(setq semantic-default-submodes (append semantic-default-submodes
                                        '(global-semantic-idle-local-symbol-highlight-mode
                                          global-semantic-idle-summary-mode
                                          global-semantic-decoration-mode
                                          global-semantic-highlight-func-mode
                                          global-semantic-stickyfunc-mode)))

(setq semantic-decoration-styles '(("semantic-decoration-on-includes" . t)
                                   ("semantic-decoration-on-protected-members")
                                   ("semantic-decoration-on-private-members")))
;; Enable semantic-mode
(semantic-mode)

(provide 'rc-cedet)
