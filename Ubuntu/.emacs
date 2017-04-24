(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(debug-on-error t)
 '(display-time-mode t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-language-environment "Korean")
(prefer-coding-system 'utf-8-unix)
(modify-coding-system-alist 'process "ssh" 'utf-8-unix)

(require 'smtpmail)
(require 'starttls)
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 587)
(setq mail-host-address "naver.com")
(setq user-mail-address "swbae@naver.com")


(setq-default browse-url-browser-function 'w3m-browse-url)
(setq browse-url-new-window-flag t)
(setq w3m-use-cookies t)
(setq w3m-do-cleanup-temp-files t)
(setq w3m-default-display-inline-images t)

(setq use-file-dialog nil)
(setq use-dialog-box nil)

(setq-default indent-tabs-mode nil)
(electric-indent-mode 1)
(setq-default require-final-newline t)

(setq save-place-file "~/.emacs.d/saved-places")
(setq save-place-forget-unreadable-files nil)
(setq ido-save-directory-list-file "~/.emacs.d/ido.last")
(setq recentf-save-file "~/.emacs.d/recentf")
(setq slime-repl-history-file "~/.emacs.d/slime-history.eld")
(put 'downcase-region 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(defalias 'man 'woman)
(eval-after-load 'woman '(defalias 'man 'woman))
(add-hook 'woman-pre-format-hook
          (lambda ()
            (set-face-attribute 'woman-italic nil :inherit 'italic :foreground "#ffd700")
            (set-face-attribute 'woman-bold nil :inherit 'bold :foreground "#a1db00")))

(server-start)
(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (when server-buffer-clients
              (local-set-key (kbd "C-x k") 'server-edit))))

(setq source-directory "~/.local/share/emacs-24.5/")

(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))

(setq tramp-backup-directory-alist backup-directory-alist)
;; (setq tramp-auto-save-directory backup-directory-alist)
(setq backup-enable-predicate
      (lambda (name)
        (and (normal-backup-enable-predicate name)
             (not
              (let ((method (file-remote-p name 'method)))
                (when (stringp method)
                  (member method '("su" "sudo"))))))))

(helm-mode 1)
;; (load-theme 'adwaita t)
;; (load-theme 'pastelmac t)
(load-theme 'deeper-blue t)

;; (require 'ergoemacs-mode)
;; (require 'org-trello)

(put 'scroll-left 'disabled nil)

(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "F" 'my-dired-find-file)
     (defun my-dired-find-file (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))

(require 'tramp)
(setq tramp-verbose 10)
(setq tramp-debug-buffer t)
(setq tramp-chunksize 500)
(setq tramp-default-method "ssh")

;; (setq common-lisp-hyperspec-root "http://www.lispworks.com/reference/HyperSpec/")
(setq common-lisp-hyperspec-root "file:/usr/share/doc/hyperspec/")
;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq slime-net-coding-system 'utf-8-unix)
(setq slime-lisp-mode-in-events-buffer t)
;; (setq slime-outline-mode-in-events-buffer t)
;; (add-to-list 'slime-filename-translations
;;              (slime-create-filename-translator
;;               :machine-instance "gagbits"
;;               :remote-host "gagbits.com"
;;               :username "pi"))
(setq slime-lisp-implementations
      '((clisp ("/usr/bin/clisp" "-q -I"))
        (sbcl ("/usr/bin/sbcl") :coding-system utf-8-unix)))
(setq slime-default-lisp 'clisp)
;; (slime-setup '(slime-fancy slime-tramp))
;; (slime-connect "localhost" 4005)
(global-set-key "\C-c\C-]" 'slime-close-all-parens-in-sexp)

(require 'auto-complete)
(global-auto-complete-mode 1)
(add-hook 'prog-mode-hook
          (lambda ()
            (hl-line-mode 1)
            (linum-mode 1)
            (auto-complete-mode 1)))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\(lambda\\)\\>" (0 (prog1 ()
                                                   (compose-region (match-beginning 1)
                                                                   (match-end 1)
                                                                   ?λ))))))

(require 'paren-face)
(global-paren-face-mode 1)
(set-face-attribute 'parenthesis nil :foreground "gray16")
(add-to-list 'paren-face-modes 'slime-repl-mode)

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
(global-set-key [f11] 'toggle-fullscreen)
(set-frame-parameter nil 'fullscreen 'fullboth)
;; (set-frame-parameter nil 'fullscreen 'maximized)

;; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(85 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-log-arguments '("--graph" "--color" "--decorate" "-n256"))
(setq magit-completing-read-function 'magit-ido-completing-read)
(setq magit-diff-refine-hunk 'all)
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (auto-complete-mode 1)
            (eldoc-mode 1)))

(add-hook 'vimrc-mode-hook
          (lambda ()
            (rainbow-mode 1)))

(defalias 'perl-mode 'cperl-mode)
(setq cperl-hairy t)
(setq cperl-indent-level 4)

(add-hook 'python-mode-hook
          (lambda ()
            (linum-mode 1)))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))

(add-to-list 'auto-mode-alist '("\\.sexp$" . lisp-mode))
(add-to-list 'auto-mode-alist '("saved-places" . lisp-mode))
(add-to-list 'auto-mode-alist '("ido\\.last$" . lisp-mode))
(add-to-list 'auto-mode-alist '("recentf" . lisp-mode))

(add-to-list 'auto-mode-alist '("\\.plugin$" . perl-mode))

(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\.lock" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.hbs$" . html-mode))

(add-to-list 'auto-mode-alist '("\\.nse$" . lua-mode))

(put 'narrow-to-region 'disabled nil)

(global-set-key (kbd "M-x") 'helm-M-x)

;; (require 'emms)
;; (require 'emms-player-simple)
;; (require 'emms-source-file)
;; (require 'emms-source-playlist)
;; (setq emms-player-list '(emms-player-mpg321))

(setq calendar-latitude 37.33
      calendar-longitude 126.48)

(add-hook 'fish-mode-hook (lambda ()
                            (add-hook 'before-save-hook 'fish_indent-before-save)))

(autoload 'ssh-config-mode "ssh-config-mode" t)
(add-to-list 'auto-mode-alist '("/\\.ssh/config\\'"     . ssh-config-mode))
(add-to-list 'auto-mode-alist '("/sshd?_config\\'"      . ssh-config-mode))
;; (add-to-list 'auto-mode-alist '("/known_hosts\\'"       . ssh-known-hosts-mode))
;; (add-to-list 'auto-mode-alist '("/authorized_keys2?\\'" . ssh-authorized-keys-mode))
(add-hook 'ssh-config-mode-hook 'turn-on-font-lock)

;; (add-hook 'markdown-mode-hook
;;           (lambda ()
;;             (setq-local browse-url-browser-function 'browse-url-generic)
;;             (setq-local browse-url-generic-program "/opt/google/chrome/google-chrome")))

(load "~/.ercpass")
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords
      `((freenode
         (("opt9" . ,freenode-opt9-pass)))))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/.org/agenda/work.org"
                             "~/.org/agenda/home.org"
                             "~/.org/agenda/idea.org"))

(setq org-export-backends '(ascii html icalendar latex md odt))
(setq org-export-with-toc nil)
(setq org-export-with-author nil)
