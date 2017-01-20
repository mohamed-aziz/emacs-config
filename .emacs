;; I use this mainly for lisp, pascal, python, lua and some php.
;; the config is messy :'(


(setq package-enable-at-startup nil)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "df21cdadd3f0648e3106338649d9fea510121807c907e2fd15565dde6409d6e9" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "4ddbbccc0c15d18ef73228f2f71a33fac8c892f22889d2a460e29fe58177edfd" "55d31108a7dc4a268a1432cd60a7558824223684afecefa6fae327212c40f8d3" "0ef42dd115a0ee9468a8038ae4b97ac6508cd6b464222ac44a82db943e92e96a" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "715fdcd387af7e963abca6765bd7c2b37e76154e65401cd8d86104f22dd88404" "c2e17e5644f2aa5f37da75e7135f19e0a9b98ddeeb5862e912192ee4accfc0f8" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "12b7ed9b0e990f6d41827c343467d2a6c464094cbcc6d0844df32837b50655f9" "b2db1708af2a7d50cac271be91908fffeddb04c66cb1a853fff749c7ad6926ae" "345f8f92edc3508574c61850b98a2e0a7a3f5ba3bb9ed03a50f6e41546fe2de0" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "ebfa8d0654af120fff174bc7ec08bf1fef63df97bdeff63161dbff6f61cef747" default)))
 '(elpy-rpc-timeout 10)
 '(fringe-mode nil nil (fringe))
 '(linum-format (quote linum-relative))
 '(linum-relative-format "%3s  ")
 '(linum-relative-global-mode t)
 '(org-agenda-files (quote ("c:/Users/Mohamed Aziz Knani/px1/roadmap.org")))
 '(package-selected-packages
   (quote
    (git-gutter-fringe linum-relative evil-magit evil relative-line-numbers workgroups2 undo-tree vue-mode coffee-mode blackboard-theme ## meacupla-theme autumn-light-theme avk-emacs-themes sx htmlize django-mode projectile ample-zen-theme afternoon-theme base16-theme emmet-mode lua-mode cherry-blossom-theme markdown-mode multi-term snippet hamburg-theme elpy company-php dracula-theme cider zenburn-theme php-eldoc flymake-php php+-mode web-mode plan9-theme php-auto-yasnippets nyan-mode neotree magit cyberpunk-theme 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "pyrs" :family "Roboto Mono")))))

;; Melpa packages repo
;; On my windows I had to install gnutls binaries (to debug use function toggle-debug-on-error)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))



(load-theme 'blackboard)


;; disable the menu bar

(menu-bar-mode 0)

;; disable scroll bar mode
(scroll-bar-mode 0)

;; disable tool bar mode
(tool-bar-mode 0)


;; default ac mode
(ac-config-default)

;; removes python-mode symbol from ac-modes symbol because I use company mode.
(setq ac-modes (delq 'python-mode ac-modes))

;; nyan mode YAY (I have to fork this and make a mooGNU)!

(nyan-mode)

(nyan-start-animation)

(nyan-toggle-wavy-trail)


;; web-mode + emmet-mode
(define-derived-mode myWebMode
  web-mode "Web-Mode+Emmet" "Web Mode + Emmet"
  (emmet-mode))

;; WEB mode config mainly for php and jinja2 for python
(add-to-list 'auto-mode-alist '("\\.jhtml\\'" . myWebMode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("django"  . "\\.jhtml\\'")) ;for jinja2 files
      )

(setq web-mode-enable-current-element-highlight t)

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



(elpy-enable)

(setq elpy-rpc-backend "jedi")

(put 'upcase-region 'disabled nil)


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(require 'git-gutter-fringe)
(global-git-gutter-mode +1)



;; helm config
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-S-x") #'helm-show-kill-ring)

(yas-global-mode)


(setenv "WORKON_HOME" "/home/mohamed/vEnvs")

(setenv "PROJECT_HOME" "/home/mohamed/Projects")

(require 'winner)
(winner-mode 1)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(setq org-src-fontify-natively t)

;; prettify some symbols in my python code

(global-prettify-symbols-mode +1)

(add-hook 'python-mode-hook
	  (lambda ()
	    (push '("def" . ?ƒ) prettify-symbols-alist)))

(require 'evil)
(evil-mode)

(require 'evil-magit)
(evil-magit-init)

(require 'linum-relative)

(linum-relative-global-mode)
