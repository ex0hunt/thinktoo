(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
(add-to-list 'load-path "~/.emacs.d/appload/")
(load "package")
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			                           ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'ido)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
        )
(setq auto-save-file-name-transforms
            `((".*" ,"~/.emacs.d/autosave")))
(ido-mode t)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(global-linum-mode t)
(load-theme 'wombat t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("/mnt/rec/Projects/"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;JEDI config
;; don't use default keybindings from jedi.el; keep C-. free
(setq py-python-command "/usr/bin/python3")
(setq jedi:setup-keys t)
(setq jedi:tooltip-method nil)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(defvar jedi:goto-stack '())
(defun jedi:jump-to-definition ()
  (interactive)
  (add-to-list 'jedi:goto-stack
	       (list (buffer-name) (point)))
  (jedi:goto-definition))
(defun jedi:jump-back ()
  (interactive)
  (let ((p (pop jedi:goto-stack)))
    (if p (progn
	    (switch-to-buffer (nth 0 p))
	    (goto-char (nth 1 p))))))
;; redefine jedi's C-. (jedi:goto-definition)
;; to remember position, and set C-, to jump back
(add-hook 'python-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-.") 'jedi:jump-to-definition)
	     (local-set-key (kbd "C-,") 'jedi:jump-back)
	     (local-set-key (kbd "C-c d") 'jedi:show-doc)
	                  (local-set-key (kbd "C-<tab>") 'jedi:complete)))
