

;;[2018-04-16 Mon 09:45]
;;We configure Emacs in this file!

;; comment starts with ';'((package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
(require 'cl)
;;cl stands for common lisp
;;add whatever packages you want here
(defvar xiaohenge/packages '(
			     company
			     monokai-theme
			     hungry-delete
			     elpy
			     ein
			     better-defaults
			     py-autopep8
			     auctex
			     cdlatex
			     
			     )
  "Default pacakages")

(defun xiaohenge/packages-installed-p()
  (loop for pkg in xiaohenge/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (xiaohenge/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg xiaohenge/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;====================End shortcuts===========================

;;====================This is for e-mail=======================
(setq user-full-name "Hang Zhang")   
(setq user-mail-address "hang.zhang0205@gmail.com")   

  
;;;;;;;;;;;;;;;;;;;;  
;;自动显示图片  
;;;;;;;;;;;;;;;;;;;;  
(auto-image-file-mode)  
(setq mm-inline-large-images t)  

  
(setq gnus-select-method  
      '(nnimap "gmail"  
           (nnimap-address "imap.gmail.com")  
           (nnimap-server-port 993)  
           (nnimap-stream ssl)))  
  
(setq message-send-mail-function 'smtpmail-send-it  
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))  
      smtpmail-auth-credentials '(("smtp.gmail.com" 587  
                   "csfreebird@gmail.com" nil))  
      smtpmail-default-smtp-server "smtp.gmail.com"  
      smtpmail-smtp-server "smtp.gmail.com"  
      smtpmail-smtp-service 587  
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]") 
;;====================Ehd e-mail===============================

;;======================this is for latex============================
     (add-to-list 'load-path
              "~/.emacs.d/lisps/auctex/site-lisp/site-start.d")
(load "auctex.el" nil t t)
(if (string-equal system-type "windows-nt")
    (require 'tex-mik))

 (mapc (lambda (mode)
         (add-hook 'LaTeX-mode-hook mode))
         (list 'auto-fill-mode
               'LaTeX-math-mode
               'turn-on-reftex
               'linum-mode))
(setq TeX-file-line-error nil)


    (add-hook 'LaTeX-mode-hook
              (lambda ()
                 ; display compilation windows
                (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
                (setq TeX-save-query nil)
                (imenu-add-menubar-index)
                (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))
;;======================latex============================


;;====================this is for python ====================

(elpy-enable)

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;====================PYTHON=================================
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)
(load-theme 'monokai t)
(delete-selection-mode t)
(global-hl-line-mode)
;; ===================hook==============================
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(require 'hungry-delete)
(global-hungry-delete-mode)


(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(global-set-key (kbd "<f2>") 'open-my-init-file)
(defalias 'list-buffers 'ibuffer)
(global-company-mode t)
(setq bookmark-save-flag t)

(setq-default cursor-type 'bar)
;; inhibit backup
(setq make-backup-files nil)
(setq initial-frame-alist (quote ((fullscreen . maximized))))


(require 'org)
(setq org-src-frontify-natively )

;; (desctop-save-mode 1) restore all the previous files in last emacs session.
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(TeX-electric-math nil)
 '(TeX-engine (quote default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
