#lang racket/gui

(require racket/pretty

         gonz/gui-helpers

         "parameters.rkt"
         "loader.rkt"
         "gui/auto-save-frame.rkt")

(define (main-window)
  (define top-frame (new auto-save-frame%
                         [label "Invoker 2.0 [2015-07-XX]"]
                         [alignment '(center top)]
                         [auto-save-callback (lambda ()
                                               #f)]
                         [style (window-style)]))

  (define built-in-panel (new horizontal-panel%
                              [parent top-frame]
                              [alignment '(center top)]))

  (btn edit-mode-switch built-in-panel "Edit-mode"
       (lambda (b e)
         (edit-mode (not (edit-mode)))))

  (btn iconize-window built-in-panel "Iconize window"
       (lambda (b e)
         (send built-in-panel iconize #t)))

  (btn clear-clipboard built-in-panel "Clear clipboard"
       (lambda (b e)
         (send the-clipboard
               set-clipboard-string
               ""
               (send e get-time-stamp))))

  (btn add-button built-in-panel "Add component"
       (lambda (b e)
         (new add-dialog%
              [label "Add component"]
              [parent top-frame])))

  (define template-content-panel (make-components (call-with-input-file
                                                    "components.blob"
                                                    read)
                                                  top-frame))

  (define (components)
    (serialize-object template-content-panel))

  (define (save-components [filename "components.blob"])
    (write-components-to-file (components) 
                              filename))
  (send top-frame set-auto-save-callback save-components)

  (define (print-components [frame top-frame])
    (pretty-print (components)))

  (send top-frame show #t)
  top-frame)

(define (view-children object)
  (define (children-of o)
    (with-handlers
      ([exn:fail:object?
         (lambda (exn)
           #f)])
      (send o get-children)))

  (define children (children-of object))
  (if children
    (cons object (map view-children children))
    object))

(define (serialize-object object)
  (send object serialize))

(define (write-components-to-file components [filename "components.blob"])
  (call-with-output-file
    filename
    (lambda (output-port)
      (pretty-write components output-port))
    #:exists 'replace))


(module+ main
  (define top-frame (main-window))
  )