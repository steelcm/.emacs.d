(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5b8530674b4e81f0327b725b581f7534b43800b9075e74630e1790481a190c2d" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" default)))
 '(fringe-mode 0 nil (fringe))
 '(global-linum-mode t)
 '(hl-paren-colors (quote ("gold" "IndianRed1")))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "~/.emacs.d/splash")
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight normal :height 120 :family "Consolas"))))
 '(linum-highlight-face ((t (:inherit default :background "#1d1f21" :foreground "gold")))))

;; IN-BUILT CUSTOMIZATIONS

;; stop creating ~backup and #autosave# files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; wrap the lines at word level, and allow the navigation at "visual lines" level
(setq-default truncate-lines t)

;; No tabs, only 4 spaces, as default
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; enable ido
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-file-extensions-order '(".c" ".cpp" ".org" ".txt" ".el")) ; file order preference
(ido-mode t)

;; maximize on startup
(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)

;;; CUSTOMIZATIONS FOR EXTERNAL PACKAGES GOES IN HERE

;; Emacs loads packages after processing the init file, 
;; so loading a theme will fail because the path to a theme is not known yet.;; That's why you need to initialize the package system before loading the theme
(setq package-enable-at-startup nil)
(package-initialize)
;; (package-initialize) will go through all the installed packages (in ~/.emacs.d/elpa/ or similar, depending on configuration), and add them to the load path.

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

;; LOAD THEME
(require 'sublime-themes)
(load-theme 'brin)

;; THEME CUSTOMIZATIONS
(set-face-background 'default "#1d1f21")
(set-face-background 'linum "#1d1f21")

;; Highlight current line number
(require 'hlinum)
(hlinum-activate)

;; Highlight current line
(global-hl-line-mode +1)

;; evil mode
;; set vars before evil is loaded
(require 'evil)
(evil-mode 1)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;(setq-default fringe-indicator-alist 
;;	      '((truncation left-arrow right-arrow)
;;		(continuation nil right-arrow)))

;; SMOOTH SCROLLING

; Scroll just one line when hitting bottom of window
(setq scroll-conservatively 10000)
