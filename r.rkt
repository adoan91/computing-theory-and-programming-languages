;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname hw2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; 1.
; The volume of a sphere of radius r
(define (spherevolume r) (/ (* (* 4 3.14) (expt r 3)) 3))

; shell-volume, that takes two arguments,
; inner-radius and outer-radius, and finds the volume of
; a hollow spherical shell with the appropriate
; inner and outer radii.
(define (shellvolume inner-r outer-r)
  (- (/ (* (* 4 3.14) (expt outer-r 3)) 3)
     (/ (* (* 4 3.14) (expt inner-r 3)) 3)
     )
  )
(shellvolume 7 3)
(shellvolume 5 2)
; 2.
(define (pfc x y)
  (cond
    ((<= (abs (- x y)) 0.001) #t)
    (else #f)
    ))

;(pfc 1 1.0005)

(define (epfc x y limit)
  (cond
    ((<= (abs (- x y)) limit) #t)
    (else #f)
    ))

;(epfc 6 12 3)

; 3.

(define (how-many a b c)
  (cond
    ( (> (* b b) (* 4 (* a c))) 2) ;if b*b > 4 * a* c
    ( (= (* b b) (* 4 (* a c))) 1) ;if b*b = 4 *a * c
    ( (< (* b b) (* 4 (* a c))) 0) ;if b*b < 4 * a * c
    ))
;(how-many 1 0 -1)
;(how-many 2 4 2)

; 4.
(define (filter-out-symbol lst s)
  (cond
    ((null? lst) '())
    ((eq? s (car lst)) (filter-out-symbol (cdr lst) s))
    (else (cons (car lst) (filter-out-symbol (cdr lst) s)))
    )
  )
(filter-out-symbol '(no no a thousand times no) 'no)
(filter-out-symbol '(no yes a thousand times no) 'no)

; 5.
(define (minoflist L)
  (cond
    ( (null? (cdr L)) (car L))
    ( (< (car L) (minoflist (cdr L))) (car L))
    (else (minoflist (cdr L)))
    )
  )
(define (maxoflist L)
  (cond
    ( (null? (cdr L)) (car L))
    ( (> (car L) (maxoflist (cdr L))) (car L))
    (else (maxoflist (cdr L)))
    )
  )
(define (pMinMax L)
  (list (minoflist L) (maxoflist L))
  )
(pMinMax '(1 2 3))
(pMinMax '(11 -2 33))

; 6.
(define (incnth n)
  (lambda (x) (+ n x))
  )
( (incnth 3) 2)
( (incnth -2) 3)