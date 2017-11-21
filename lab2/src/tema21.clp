
(deftemplate Multimi
    (slot valElem)
    (slot multime))

(defglobal ?*a* = 0)
(bind ?*a* (read))
(defglobal ?*b* = 0)
(bind ?*b* (read))

(assert(Multimi(valElem 1)(multime  A)))
(assert(Multimi(valElem 23)(multime  A)))
(assert(Multimi(valElem 43)(multime  A)))
(assert(Multimi(valElem 456)(multime  A)))
(assert(Multimi(valElem 984)(multime  A)))
(assert(Multimi(valElem 1322)(multime  B)))
(assert(Multimi(valElem 4)(multime  B)))
(assert(Multimi(valElem 354)(multime  B)))
(assert(Multimi(valElem 56)(multime  B)))
(assert(Multimi(valElem 17)(multime  C)))
(assert(Multimi(valElem 45)(multime  C)))
(assert(Multimi(valElem 5665)(multime  C)))
(assert(Multimi(valElem 34)(multime  C)))
(assert(Multimi(valElem 54)(multime  C)))
(assert(Multimi(valElem 233)(multime  D)))
(assert(Multimi(valElem 44)(multime  D)))

(deftemplate suma (slot value))
(assert(suma(value 0)))


(defrule Sum
	
    ?e <-(Multimi(valElem ?i))
    ?s <-(suma(value ?x))
    (Multimi(valElem ?i &:(> ?i ?*a*)&:(< ?i ?*b*)))
    =>
    (modify ?s(value (+ ?i ?x)))
    (retract ?e)
    )
(defrule Print
    (suma(value ?x))
    =>
    (printout t "suma=" ?x crlf)
    )


(run)
(watch all)