;; This my config for the greatest extensible IDE out there
;; I use this mainly for lisp, pascal, python, lua and some php.


(setq package-enable-at-startup nil)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "ebfa8d0654af120fff174bc7ec08bf1fef63df97bdeff63161dbff6f61cef747" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "outline" :family "Hack")))))

;; Melpa packages repo
;; On my windows I had to install gnutls binaries (to debug use function toggle-debug-on-error)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


;; Use plan9 theme I love it, my favourite light theme
;; (load-theme 'plan9)
;; I Use cyberpung theme I love it, my favourite dark theme
(load-theme 'cyberpunk)


;; disable scroll bar mode
(scroll-bar-mode 0)

;; disable tool bar mode
(tool-bar-mode 0)


;; default ac mode
(ac-config-default)

;; nyan mode YAY (I have to fork this and make a mooGNU)!

(nyan-mode)

(nyan-start-animation)

(nyan-toggle-wavy-trail)


;; WEB mode config mainly for php and jinja2 for python

(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
	))

;; paren mode stuff
(show-paren-mode 1)
(setq show-paren-style 'expression)

;; some lisp addons I like

;; Neotree a cool tree browser like vim's nerdtree
(require 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)


;; magit for VSC (only git)
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)


;; move quicker between windows hell yes!
(windmove-default-keybindings)


;; php dev plugins

;; flymake for syntax checking
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; company-php for auto complete
(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             (add-to-list 'company-backends 'company-ac-php-backend )))
