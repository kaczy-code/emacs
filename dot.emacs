;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

;; (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;;                     (not (gnutls-available-p))))
;;        (proto (if no-ssl "http" "https")))
;;   (when no-ssl
;;     (warn "\
;; Your version of Emacs does not support SSL connections,
;; which is unsafe because it allows man-in-the-middle attacks.
;; There are two things you can do about this warning:
;; 1. Install an Emacs version that does support SSL and be safe.
;; 2. Remove this warning from your init file so you won't see it again."))
;;   ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
;;   (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
;;   ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
;;   (when (< emacs-major-version 24)
;;     ;; For important compatibility libraries like cl-lib
;;     (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; Adds the Melpa archive to the list of available repositories

(add-to-list 'package-archives' ("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;;(require 'zmq)
;; make the fringe stand out from the background
;; (setq solarized-distinct-fringe-background t)

;; ;; Don't change the font for some headings and titles
;; (setq solarized-use-variable-pitch nil)

;; ;; make the modeline high contrast
;; ;; (setq solarized-high-contrast-mode-line t)

;; ;; Use less bolding
;; ;; (setq solarized-use-less-bold t)

(require 'company)
(global-company-mode t)


;;(require 'jupyter)
;; ;; Use more italics
(setq solarized-use-more-italic t)

;; ;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; ;; Don't change size of org-mode headlines (but keep other size-changes)
;; (setq solarized-scale-org-headlines nil)

;; ;; Avoid all font-size changes
;; (setq solarized-height-minus-1 1.0)
;; (setq solarized-height-plus-1 1.0)
;; (setq solarized-height-plus-2 1.0)
;; (setq solarized-height-plus-3 1.0)
;; (setq solarized-height-plus-4 1.0)

(load-theme 'solarized-dark t)

(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)

(show-paren-mode 1)
;; Here is some Emacs Lisp that will make the % key show the matching parenthesis, like in vi.
;; In addition, if the cursor isn't over a parenthesis, it simply inserts a % like normal. 
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
	((looking-at "\\s)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;; cursor a horizontal bar
;; (setq-default cursor-type 'hbar)

;; Change all prompts to y or n
;; (fset 'yes-or-no-p 'y-or-n-p)
(defalias 'yes-or-no-p 'y-or-n-p)

;; (require 'vc)
;; flycheck
;;(global-flycheck-mode)

;; (ido-mode 1)
;; (setq ido-separator "\n")
(recentf-mode 1) ; keep a list of recently opened files

(global-hl-line-mode 1) ; highlights the line containing point

(add-hook 'prog-mode-hook 'linum-mode)

;; disable splash screen on startup
(setq inhibit-splash-screen t)

;;(require 'iedit)

(elpy-enable)
;; Elpy uses the Python interpreter setup from the Emacs python package.
;; use the Python standard interpreter (default);;
(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i")

(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

;;(require 'projectile)

;;(require 'hlinum)
;;(hlinum-activate)


;; flycheck
;; (global-flycheck-mode)
;; (when (load "flycheck" t t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; show cursor position within line
;; (column-number-mode 1)

;; ;;;;;;;; electric-pair ;;;;;;;;;;;
;; (defun electric-pair ()
;;   "If at end of line, insert character pair without surrounding spaces.
;;    Otherwise, just insert the typed character."
;;   (interactive)
;;   (if (eolp) (let (parens-require-spaces) (insert-pair)) 
;;     (self-insert-command 1)))

;; auto close bracket insertion. New in emacs 24
;; (electric-pair-mode 1)
;; turn on highlight matching brackets when cursor is on one
;; (show-paren-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; hideshow ;;;;;;;;
;; (load-library "hideshow")
;;(global-set-key (kbd "C-+") 'toggle-hiding)
;;(global-set-key (kbd "C-\\") 'toggle-selective-display)
;; (add-hook 'prog-mode-hook 'hs-minor-mode)
;;(add-hook 'c-mode-common-hook   'hs-minor-mode)
;;(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;;(add-hook 'java-mode-hook       'hs-minor-mode)
;;(add-hook 'lisp-mode-hook       'hs-minor-mode)
;;(add-hook 'perl-mode-hook       'hs-minor-mode)
;;(add-hook 'sh-mode-hook         'hs-minor-mode)
;;(add-hook 'python-mode-hook     'hs-minor-mode)
;; Hide the comments too when you do a 'hs-hide-all'
;;(setq hs-hide-comments nil)
;; Set whether isearch opens folded comments, code, or both
;; where x is code, comments, t (both), or nil (neither)
;;(setq hs-isearch-open 'x)
;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; jedi ;;;;;;;
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)                 ; optional

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (define-key python-mode-map "\"" 'electric-pair)
;;             (define-key python-mode-map "\'" 'electric-pair)
;;             (define-key python-mode-map "(" 'electric-pair)
;;             (define-key python-mode-map "[" 'electric-pair)
;;             (define-key python-mode-map "{" 'electric-pair)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit solarized-theme jdee iedit elpy color-theme-sanityinc-tomorrow)))
