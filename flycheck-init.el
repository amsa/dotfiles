;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode -1)
(global-linum-mode 1)
;(normal-erase-is-backspace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

;Marmalade
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Solarized color theme
(setq solarized-termcolors 256)
(setq solarized-broken-srgb t)
(load-theme 'solarized-dark t)

;; AutoComplete
(require 'auto-complete-config)
(ac-config-default)

;; Enable flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'php-mode-hook 'flymake-php-load)
;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
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

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t) 
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "\C-c !" t) 
(eval-after-load 'ruby-mode '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))
(inf-ruby-switch-setup)
;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(add-to-list 'load-path "~/.emacs.d/js")
(load "js-config.el")
