;; -*- coding: utf-8 -*-
;; Time-stamp: <2013-10-16 11:00:25 ryan>
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *spell-check-support-enabled* nil)
(setq *macbook-pro-support-enabled* nil)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt))
(setq *cygwin* (eq system-type 'cygwin))
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)))
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)))
(setq *linux-x* (and window-system *linux*))
(setq *xemacs* (featurep 'xemacs))
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))))

;----------------------------------------------------------------------------
; Functions (load all files in defuns-dir)
; Copied from https://github.com/magnars/.emacs.d/blob/master/init.el
;----------------------------------------------------------------------------
(setq defuns-dir (expand-file-name "~/.emacs.d/defuns"))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
      (load file)))
;----------------------------------------------------------------------------
; Load configs for specific features and modes
;----------------------------------------------------------------------------
(require 'init-modeline)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
;;; (require 'init-cedet)

(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el

(require 'init-elpa)

;; (require 'init-ecb)
(require 'init-exec-path) ;; Set up $PATH
;; (require 'init-frame-hooks)
(require 'init-xterm)
;; (require 'init-osx-keys)
(require 'init-gui-frames)
;; (require 'init-maxframe)
;; (require 'init-proxies) ; mac only.
(require 'init-dired)
(require 'init-isearch)
(require 'init-uniquify)
(require 'init-ibuffer)
;; (require 'init-flymake)
(require 'init-artbollocks-mode)
(require 'init-recentf)
(require 'init-better-registers)        ; C-x j - jump to register
(require 'init-zencoding-mode) ; behind init-better-register to override C-j
(require 'init-ido)            ; override C-j
;; (require 'init-helm)
(require 'init-hippie-expand)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)
;(require 'init-growl)
(require 'init-editing-utils)
(require 'init-git)

(require 'init-crontab)
;; (require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
;; (require 'init-erlang)
(require 'init-javascript)
(require 'init-sh)

(require 'init-php)
(require 'init-org)
(require 'init-org-clock)
(require 'init-org-capture)
(require 'init-org-html)
(require 'init-org-pdf)
;;; (require 'init-org-mime)

(require 'init-nxml)
(require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
(require 'init-cperl-mode)
;; (require 'init-haskell)
(require 'init-ruby-mode)
;; (require 'init-rails)
;;(require 'init-erc)
(if (not (boundp 'light-weight-emacs)) (require 'init-rails))
(require 'init-rcirc)

(require 'init-lisp)
(require 'init-slime)
(require 'init-clojure)
(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-marmalade)
;; Finally set up themes, after most possibly-customised faces have been defined
(require 'init-themes) ; color-themes 6.6.1 has some problem
;; Chinese inut method
(require 'init-org2blog)
;; (require 'init-fill-column-indicator) ;make auto-complete dropdown wierd
(if (not (boundp 'light-weight-emacs)) (require 'init-yasnippet))

;; Use bookmark instead
;; (require 'init-better-registers) ; C-x j - jump to register
(require 'init-zencoding-mode) ;behind init-better-register to override C-j
(require 'init-yari)

(require 'init-cc-mode)
;; (require 'init-auto-complete) ;; after init-yasnippeta to override TAB
(require 'init-company-mode)
;;; (require 'init-semantic)
(require 'init-cmake-mode)
(require 'init-csharp-mode)
;;; (require 'init-linum-mode)
;;; (require 'init-delicious) ;make startup slow, I don't use delicious in w3m
(require 'init-emacs-w3m)
;; Chinese inut method
;; (require 'init-eim)
(require 'init-thing-edit)
(require 'init-which-func)
(require 'init-keyfreq)
;; (require 'init-gist)
(require 'init-emacspeak)

(require 'init-pomodoro)
(require 'init-undo-tree)
(require 'init-moz)

(require 'init-gtags)
;; use evil mode (vi key binding)
;; (if (not (boundp 'light-weight-emacs)) (require 'init-evil))

(require 'init-misc)
(require 'init-ctags)
(require 'init-gtags)

(require 'init-ace-jump-mode)
(require 'init-multiple-cursors)

(require 'init-anything)
(require 'init-dot)

;; (require 'init-uml)

(require 'init-sunrise-commander)
(require 'init-bbdb)
(require 'init-gnus)
(require 'init-smarter-compile)
(require 'init-twittering-mode)
(require 'init-weibo)
;; itune cannot play flac, so I use mplayer+emms instead (updated, use mpd!)
;; (if (not (boundp 'light-weight-emacs)) (if *is-a-mac* (require 'init-emms)) )
(require 'init-lua-mode)
(require 'init-doxygen)
(require 'init-workgroups)
(require 'init-move-window-buffer)
(require 'init-term-mode)


(require 'init-header)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
;; Don't use emacsclient, and this code make emacs start up slow
(defconst --batch-mode (member "--batch-mode" command-line-args)
         "True when running in batch-mode (--batch-mode command-line switch set).")

(unless --batch-mode
 (require 'server)
 (when (and (= emacs-major-version 23)
            (= emacs-minor-version 1)
            (equal window-system 'w32))
   ;; Suppress error "directory ~/.emacs.d/server is unsafe" on Windows.
   (defun server-ensure-safe-dir (dir) "Noop" t))
 (condition-case nil
     (unless (server-running-p) (server-start))
   (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
   (error
    (let* ((server-dir (if server-use-tcp server-auth-dir server-socket-dir)))
      (when (and server-use-tcp
                 (not (file-accessible-directory-p server-dir)))
        (display-warning
         'server (format "Creating %S" server-dir) :warning)
        (make-directory server-dir t)
        (server-start))))))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(if (file-readable-p (expand-file-name "~/.emacs.d/custom.el"))
     (load-file (expand-file-name "~/.emacs.d/custom.el"))
       nil)

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales) ;does not work in cygwin


(when (require 'time-date nil t)
   (message "Emacs startup time: %d seconds."
    (time-to-seconds (time-since emacs-load-start-time)))
   )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold))) t))
;;; Local Variables:
;;; no-byte-compile: t
;;; End:
