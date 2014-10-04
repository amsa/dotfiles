;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------
;;; Code:

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/go")
;(require 'semantic/ia)
;(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(require 'go-mode-load)

;(add-hook 'after-init-hook 'global-company-mode)
;(require 'company-go)                                ; load company mode go backend
;(setq company-tooltip-limit 20)                      ; bigger popup window
;(setq company-minimum-prefix-length 0)               ; autocomplete right after '.'
;(setq company-idle-delay .3)                         ; shorter delay before autocompletion popup
;(setq company-echo-delay 0)                          ; removes annoying blinking
;(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;(custom-set-faces
 ;'(company-preview
   ;((t (:foreground "darkgray" :underline t))))
 ;'(company-preview-common
   ;((t (:inherit company-preview))))
 ;'(company-tooltip
   ;((t (:background "lightgray" :foreground "black"))))
 ;'(company-tooltip-selection
   ;((t (:background "steelblue" :foreground "white"))))
 ;'(company-tooltip-common
   ;((((type x)) (:inherit company-tooltip :weight bold))
    ;(t (:inherit company-tooltip))))
 ;'(company-tooltip-common-selection
   ;((((type x)) (:inherit company-tooltip-selection :weight bold))
    ;(t (:inherit company-tooltip-selection)))))


(ido-mode t)
(menu-bar-mode 1)
(global-linum-mode 1)
(show-paren-mode 1)
(speedbar 1)
;(normal-erase-is-backspace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 10   ; how many of the newest versions to keep
      kept-old-versions 2    ; and how many of the old
      )


;Marmalade
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)


;; initialize powerline theme
(powerline-default-theme)

;; Solarized color theme
(setq solarized-termcolors 256)
(setq solarized-broken-srgb t)
(load-theme 'solarized-dark t)
;; AutoComplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name
             "~/.emacs.d/elpa/auto-complete-1.4/dict"))
(ac-config-default)

(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
                ("\\.m$" . mercury-mode))
                  auto-mode-alist))

;; Enable flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'php-mode-hook 'flymake-php-load)

;; Go mode hooks
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
              (local-set-key (kbd "C-c i") 'go-goto-imports)))

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key (kbd "C-c a") 'increment-number-at-point)
(global-set-key (kbd "C-c x") 'decrement-number-at-point)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
;(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)
(global-set-key "\C-c%" 'goto-match-paren)

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t) 
(eval-after-load 'ruby-mode '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))
(inf-ruby-switch-setup)
;; (auto-indent-global-mode)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(add-to-list 'load-path "~/.emacs.d/js")
(load "js-config.el")
;(load-file "~/.emacs.d/ProofGeneral/generic/proof-site.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "rdiscount"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; org-mode configs
(add-hook 'org-mode-hook (lambda ()
              (local-set-key (kbd "C-c C-p") 'org-export-as-pdf-and-open)))

(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar")
(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/8002/plantuml.8002.jar")

(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;; Latex fontify export
(setq org-latex-listings t)
