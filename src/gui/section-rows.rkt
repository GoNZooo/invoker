#lang racket/gui

(require "../parameters.rkt"
         "parent-manipulation.rkt"
         "row.rkt")

(provide section-rows%)
(define section-rows%
  (class vertical-panel%
    (super-new)

    (init rows)

    (define (make-rows rows)
      (for-each (lambda (r)
                  (new row%
                       [parent this]
                       [buttons (cdr r)]
                       [alignment '(center top)]))
                rows))

    (make-rows rows)

    (define (set-children cs)
      (send this
            change-children
            (lambda (children)
              cs)))

    (define/public
      (move-child child direction)
      (set-children
        (case direction
          [(left) (move-left child (send this get-children))]
          [(right) (move-right child (send this get-children))]
          [else #f])))

    (define/public
      (serialize)

      (cons 'rows
            (map (lambda (child)
                   (send child serialize))
                 (send this get-children))))
    ))