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
    ("345f8f92edc3508574c61850b98a2e0a7a3f5ba3bb9ed03a50f6e41546fe2de0" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "ebfa8d0654af120fff174bc7ec08bf1fef63df97bdeff63161dbff6f61cef747" default)))
 '(org-agenda-files (quote ("c:/Users/Mohamed Aziz Knani/px1/roadmap.org")))
 '(package-selected-packages
   (quote
    (elpy company-php dracula-theme cider zenburn-theme php-eldoc flymake-php php+-mode web-mode plan9-theme php-auto-yasnippets nyan-mode neotree magit cyberpunk-theme 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Inconsolata")))))

;; Melpa packages repo
;; On my windows I had to install gnutls binaries (to debug use function toggle-debug-on-error)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


;; Use plan9 theme I love it, my favourite light theme
;; (load-theme 'plan9)
;; I Use cyberpung theme I love it, my favourite dark theme
(load-theme 'zenburn)


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
(add-to-list 'auto-mode-alist '("\\.jhtml\\'" . web-mode))
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

;; my initial buffer
(setq initial-buffer-choice "c:\Emacs/lol.jpg")

;; play some hard rock music
(defconst acdc-music-file "c:/Emacs/acdc.mp3")

(defvar acdc-music-process nil)

(defun acdc-start-music ()
  (interactive)
  (unless acdc-music-process
    (setq acdc-music-process (start-process-shell-command "acdc-music" "acdc-music" (concat "mplayer.exe " acdc-music-file " -loop 0")))))


(defun acdc-stop-music ()
  (interactive)
  (when acdc-music-process
    (delete-process acdc-music-process)
    (setq acdc-music-process nil)))

;; (acdc-start-music)


;; set up my linum-mode

(require 'linum)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)


;; code written by Emanuele Tomasi
(require 'linum)

(defvar linum-current-line 1 "Current line number.")
(defvar linum-border-width 1 "Border width for linum.")

(defface linum-current-line
  `((t :inherit linum
       :foreground "goldenrod"
       :weight bold
       ))
  "Face for displaying the current line number."
  :group 'linum)

(defadvice linum-update (before advice-linum-update activate)
  "Set the current line."
  (setq linum-current-line (line-number-at-pos)
        ;; It's the same algorithm that linum dynamic. I only had added one
        ;; space in front of the first digit.
        linum-border-width (number-to-string
                            (+ 1 (length
                                  (number-to-string
                                   (count-lines (point-min) (point-max))))))))

(defun linum-highlight-current-line (line-number)
  "Highlight the current line number using `linum-current-line' face."
  (let ((face (if (= line-number linum-current-line)
                  'linum-current-line
                'linum)))
    (propertize (format (concat " " "%" linum-border-width "d" " ") line-number)
                'face face)))

(setq linum-format 'linum-highlight-current-line)

(elpy-enable)

(setq elpy-rpc-backend "jedi")


(put 'upcase-region 'disabled nil)
