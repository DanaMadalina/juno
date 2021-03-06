

/*----------------------LAB2---------------*/
/*(deftemplate Persoana (multislot nume)(multislot mama)(multislot tata)(multislot casatorit))
(assert (Persoana(nume Ioan Popescu)(mama nil)(tata nil)(casatorit Ionela Popescu)))
(assert (Persoana(nume Ionela Popescu)(mama nil)(tata nil)(casatorit Ioan Popescu)))
(assert (Persoana(nume Vasile Pop)(mama nil)(tata nil)(casatorit Ana Pop)))
(assert (Persoana(nume Ana Pop)(mama nil)(tata nil)(casatorit Vasile Pop)))
(assert (Persoana(nume Ion Popescu)(mama Ionela Popescu)(tata Ioan Popescu)(casatorit Maria Popescu)))
(assert (Persoana(nume Maria Popescu)(mama nil)(tata nil)(casatorit Ion Popescu)))
(assert (Persoana(nume Cristian Popescu)(mama Maria Popescu)(tata Ion Popescu)(casatorit Elena Popescu)))
(assert (Persoana(nume Gheorghe Vasilescu)(mama nil)(tata nil)(casatorit Eleonora Vasilescu)))
(assert (Persoana(nume Eleonora Vasilescu)(mama nil)(tata nil)(casatorit Gheorghe Vasilescu)))
(assert (Persoana(nume Marin Vasilescu)(mama Eleonora Vasilescu)(tata Gheorghe Vasilescu)(casatorit Julieta Vasilescu)))
(assert (Persoana(nume Julieta Vasilescu)(mama nil)(tata nil)(casatorit Marin Vasilescu)))
(assert (Persoana(nume Loredana Vasilescu)(mama Julieta Vasilescu)(tata Marin Vasilescu)(casatorit nil)))
(assert (Persoana(nume Elena Popescu)(mama Eleonora Vasilescu)(tata Gheorghe Vasilescu)(casatorit Cristian Popescu)))
(assert (Persoana(nume Adrian Popescu)(mama Maria Popescu)(tata Ion Popescu)(casatorit Cristina Popescu)))
(assert (Persoana(nume Cristina Popescu)(mama nil)(tata nil)(casatorit Adrian Popescu)))
(assert (Persoana(nume Tudor Popescu)(mama Cristina Popescu)(tata Adrian Popescu)(casatorit Tudorita Popescu)))
(assert (Persoana(nume Tudorita Popescu)(mama nil)(tata nil)(casatorit Tudor Popescu)))
(assert (Persoana(nume Tudorel Popescu)(mama Tudorita Popescu)(tata Tudor Popescu)(casatorit nil)))
(assert (Persoana(nume Ciprian Popescu)(mama Maria Popescu)(tata Ion Popescu)(casatorit Adriana Popescu)))
(assert (Persoana(nume Adriana Popescu)(mama nil)(tata nil)(casatorit Ciprian Popescu)))
(assert (Persoana(nume Maria Andreescu)(mama Maria Popescu)(tata Ion Popescu)(casatorit Petre Andreescu)))
(assert (Persoana(nume Petre Andreescu)(mama nil)(tata nil)(casatorit Maria Andreescu)))
(assert (Persoana(nume Ionel Andreescu)(mama Maria Andreescu)(tata Petre Andreescu)(casatorit nil)))
(facts)*/

(deftemplate Persoana (multislot nume)(multislot mama)(multislot tata)(multislot casatorit))
(assert (Persoana(nume Elena Baloi)(mama nil)(tata nil)(casatorit Costel Baloi)))
(assert (Persoana(nume Costel Baloi)(mama nil)(tata nil)(casatorit Elena Baloi)))
(assert (Persoana(nume Ica Doros)(mama Elena Baloi)(tata Costel Baloi)(casatorit Romeo Doros)))
(assert (Persoana(nume Romeo Doros)(mama nil)(tata nil)(casatorit Ica Doros)))
(assert (Persoana(nume Romina Doros)(mama Ica Doros)(tata Romeo Doros)(casatorit nil)))
(assert (Persoana(nume Elena Bordica)(mama Elena Baloi)(tata Costel Baloi)(casatorit Bogdan Bordica)))
(assert (Persoana(nume Iasmina Bordica)(mama Elena Bordica)(tata Bogdan Bordica)(casatorit Elena Bordica)))


; TEMA ---->> PENTRU VERISORI
(defrule verisori
    (Persoana(nume $?c1)(mama $?m1)(tata $?t1))
    (Persoana(nume $?m1)(mama $?b1)(tata $?b2))
    (Persoana(nume $?t1)(mama $?b3)(tata $?b4))
	(Persoana(nume $?c2)(mama $?m2)(tata $?t2))
	(Persoana(nume $?m2)(mama $?b5)(tata $?b6))
    (Persoana(nume $?t2)(mama $?b7)(tata $?b8))
	=>
	(if (and (eq $?b1 $?b5) (eq $?b2 $?b6)) then
        (printout t "-->IF1: --> " "Copilul: "$?c1 "este verisor cu " $?c2 crlf)  
       else (if (and (eq $?b1 $?b7) (eq $?b2 $?b8)) then
            (printout t "-->IF2: --> " "Copilul: "$?c1 "este verisor cu " $?c2 crlf) 
            else (if (and (eq $?b3 $?b5) (eq $?b4 $?b6)) then
                (printout t "-->IF3: --> " "Copilul: "$?c1 "este verisor cu " $?c2 crlf) 
                 else (if (and (eq $?b3 $?b7) (eq $?b4 $?b7)) then
                    (printout t "-->IF4: --> " "Copilul: "$?c1 "este verisor cu " $?c2 crlf) 
                    else
                    	(printout t "Nu exista " crlf)))))		
    )
(run)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 