(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(custom-safe-themes (quote ("a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" default)))
 '(global-linum-mode t)
 '(hl-paren-colors (quote ("gold" "IndianRed1")))
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(linum-delay t)
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 105 :family "Consolas"))))
 '(fringe ((t (:foreground "#dee2eb"))))
 '(highlight ((t (:background "#181d28"))))
 '(linum-highlight-face ((t (:inherit default :foreground "gold")))))

;;; CUSTOMIZATIONS FOR EXTERNAL PACKAGES GOES IN HERE

;; Emacs loads packages after processing the init file, 
;; so loading a theme will fail because the path to a theme is not known yet.;; That's why you need to initialize the package system before loading the theme
(setq package-enable-at-startup nil)
(package-initialize)
;; (package-initialize) will go through all the installed packages (in ~/.emacs.d/elpa/ or similar, depending on configuration), and add them to the load path.

;; Highlight current line number
(require 'hlinum)
(hlinum-activate)

;; Highlight matching parentheses
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; Emacs version of vim powerline by milkypostman
(require 'powerline)
(powerline-default-theme)

(load-theme 'brin t)

(setq-default fringe-indicator-alist 
	      '((truncation left-arrow right-arrow)
		(continuation nil right-arrow)))

;; SMOOTH SCROLLING

; Scroll just one line when hitting bottom of window
(setq scroll-conservatively 10000)

