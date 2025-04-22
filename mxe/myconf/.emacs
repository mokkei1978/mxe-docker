
;; C-kで行全体を削除
(setq kill-whole-line t)

;; モードラインに列番号を表示
(column-number-mode t)

(setq transient-mark-mode t)

;; xterm のマウスイベントを取得する
(xterm-mouse-mode t)
;; Windows のクリップボードからのコピーは shift + マウス中央ボタン(mouse-3?)

;; マウスホイールを取得する
(mouse-wheel-mode t)
;; 画面をスクロール
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))

(setq f90-mode-hook
      '(lambda () (setq f90-do-indent 2
                        f90-if-indent 2
                        f90-type-indent 2
                        f90-program-indent 2
                        f90-font-lock-keywords f90-font-lock-keywords-4
                  )))
(add-to-list 'auto-mode-alist '("\\.F90\\'" . f90-mode))
