

(deftemplate Persoana (multislot nume)(multislot mama)(multislot tata)(multislot casatorit))
(assert (Persoana(nume Maria Popescu)(mama Maria Popovici)(tata Ionel Popovici)(casatorit Aurel Popescu)))
(assert (Persoana(nume Aurel Popescu)(mama Ioana Pop)(tata Ion Pop)(casatorit Maria Popescu)))
(assert (Persoana(nume Cristian Popescu)(mama Maria Popescu)(tata Aurel Popescu)(casatorit Irina Popescu)))
(assert (Persoana(nume Irina Popescu)(mama Maria Pilat)(tata Ionel Pilat)(casatorit Cristian Popescu)))
(assert (Persoana(nume Cristinel Popescu)(mama Irina Popescu)(tata Cristian Popescu)(casatorit nil)))
(assert (Persoana(nume Alina Andreescu)(mama Maria Popescu)(tata Aurel Popescu)(casatorit Ciprian Andreescu)))
(assert (Persoana(nume Ciprian Andreescu)(mama Maria Popov)(tata Ionel Popov)(casatorit Alina Andreescu)))
(assert (Persoana(nume Denis Andreescu)(mama Alina Andreescu)(tata Ciprian Andreescu)(casatorit nil)))
(assert (Persoana(nume Cami Vasilescu)(mama Maria Popescu)(tata Aurel Popescu)(casatorit Marin Vasilescu)))
(assert (Persoana(nume Marin Vasilescu)(mama Maria Poscu)(tata Aurel Poscu)(casatorit Cami Vasilescu)))
(assert (Persoana(nume Iasmina Vasilescu)(mama Cami Vasilescu)(tata Marin Vasilescu)(casatorit nil )))
(assert (Persoana(nume Vasile Popescu)(mama Maria Popescu)(tata Aurel Popescu)(casatorit Ilinca Vasilescu)))
(assert (Persoana(nume Ilinca Popescu)(mama Andra Rina)(tata Aurel Rina)(casatorit Vasile Popescu)))
(assert (Persoana(nume Silvia Popescu)(mama Ilinca Popescu)(tata Vasile Popescu)(casatorit nil)))

(facts)

(deftemplate Brothers (multislot name)(multislot brother))
(facts)

(defrule brother
    (Persoana(nume $?x)(mama $?y)(tata $?z))
    (Persoana (nume $?l)(mama $?y)(tata $?z))
    =>
    (if (eq $?x $?l)then 
        ;(printout t "nu are frati")
        else 
		(assert(Brothers(name $?x)(brother $?l)))
))

 (defrule cousin-of-brother-and-sister
    (Brothers(name $?a)(brother $?b))
    (Persoana(nume $?x1)(mama $?ads)(tata $?a))
    (Persoana(nume $?y1)(mama $?b)(tata $?brff))
    =>
    (printout t $?x1 "Is cousin with " $?y1 crlf)
  
 )
 (run)

(defrule cousin-of-sister-and-brother
    (Brothers(name $?a)(brother $?b))
    (Persoana(nume $?x1)(mama $?a)(tata $?adasd))
    (Persoana(nume $?y1)(mama $?ds)(tata $?b))  
    =>
    (printout t $?x1 "Is cousin with " $?y1 crlf) 
 )
 (run)
(defrule cousin-of-mother
    (Brothers(name $?a)(brother $?b))
    (Persoana(nume $?x1)(mama $?a)(tata $?z))
    (Persoana(nume $?y1)(mama $?b)(tata $?z1))  
    =>
  
    (printout t $?x1 "Is cousin with" $?y1 crlf)   
 )

 (run)

(defrule cousin-of-father
    (Brothers(name $?a)(brother $?b))
    (Persoana(nume $?x1)(mama $?ads)(tata $?a))
    (Persoana(nume $?y1)(mama $?ds)(tata $?b))   
    =>
    (printout t $?x1 "Is cousin with " $?y1 crlf) 
 )
 (run)


/*
(bind ?a (read));citire de la tastatura
(bind ?b (read))
(if(> ?a ?b) then (printout t ?a crlf)
    else(printout t ?b crlf))
*/

(deftemplate element
    (slot val)
    (slot element))

(assert(element(val 2)(element  A)))
(assert(element(val 3)(element  B)))
(assert(element(val 7)(element  C)))
(assert(element(val 1001)(element  D)))
(bind ?a (read))
(bind ?b (read))
(deftemplate suma (slot valoare))
(assert(suma(valoare 0)))

(defrule CalculSuma
    ?idi <-(element(val ?i))
    ?idvs <-(suma(valoare ?vs))
    (element(val ?i &:(> ?i a)&:(< ?i b)))
    =>
    (modify ?idvs(valoare (+ ?i ?vs)))
    (retract ?idi)
    )
(defrule afisaresuma
    (suma(valoare ?vs))
    =>
    (printout t "suma=" ?vs crlf)
    )

(run)
(watch all)

