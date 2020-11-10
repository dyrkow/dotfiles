# Конфигурация

весь код кастомизации необходимо помезать в папку ~/.emacs.d в файл init.el
Чтобы применить изменения, просто  перезапускаем  emacs 

## Сборка в байт-код для лучшей производительности

1.  Установить лисп на машину 'brew install clisp'
clis - скомпилить

## Установка emacs на мак

brew install emacs

emacs --version

текстовый редактор с интерфейсом тут https://emacsformacosx.com/

```
;; PERSONALIZATION

;; Set user email
(setq user-mail-address "webworkdeveloper@gmail.com")

;; NORMALIZATION

;; Set normal scroll
(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

;; HIDING

;; Disable some bars
(tool-bar-mode 0)
(menu-bar-mode 0)

;; TODO лучше с самого начала накляпать скриптом для сборки файлов настройки и релиза их в операционку
;; TODO: команда  build - собрать конфиг
;; TODO: команда push - релизнуть конфиг в ОС
;; TODO: команда release - собрать конфиг и релизнуть  его в ОС
;; TODO:  команда revert - берем закешированный из ОС конфиг и накатываем  его  взамен тому   который сейчас  есть (откат грубо говоря)

;;Если ваш файл `.emacs' содержит большой объем кода, вам стоит переместить его в другой файл, как `~/что-нибудь.el', скомпилировать его и сделать так, чтобы ваш файл `.emacs' загружал его через (load "~/что-нибудь"). @xref{Byte Compilation,, Byte Compilation, @external{elisp}, the Emacs Lisp Reference Manual}, для получения большей информации о компилировании программ на Emacs Lisp.

```
C =  Ctrl
## Keys

C-d - delete-char - удаляет символ справа
C-x C-f - find-file - 

## Moves
C-f - forward-char - вперед
C-b - backward-char - назыд
C-n - next-line - вниз
C-o - previous-line - вверх
C-a - move-beginning-of-line  -  в начало строки
C-e - move-end-of-line - в конец

## Saving
C-x C-s - save-buffer - сохранить буфер в текущий файл
C-x-s - save-some-buffers - сохранить буфер куда-то
C-x C- w - write-file - сохранить буфер в дургой файл

## Exiting
C-x C-c  - save-buffers-kill-terminal - 

### Buffer
C-x C-b - list-buffers
C-x-b - switch-to-buffer - создает буфер по имени
C-x Left - previous-buffer
C-x Right - next-buffer



# Lisp

# Setup
1. Install on common lisp compiler on your device `brew install clisp`

# Run code on clisp

- Interpreter - `clisp` and load file `(load "file.lisp")`
- Compile - `clip` and compile `(compile-file "file.lisp")` ~> file.fas next `(load "file.fas")`

# Exit from clisp

Just run `(quit)`
