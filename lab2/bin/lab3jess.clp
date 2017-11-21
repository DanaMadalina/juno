(defglobal ?*TASK_PRIORITY_1* = 500)
(defglobal ?*TASK_PRIORITY_2* = 500)

(deftemplate animal
    (slot denumire)
    (slot mancare);vegetarian / carnivor
    (slot modViata);diur / nocturn
    (slot mediuViata);acvatic semiacvatic terestru aerian
    (slot modalitateReproducere); pui oua
    (slot zona)
    (slot medieViata)
    (slot putere); 0 la ierbivore 1,2 la carnivore
     )

(assert(animal
        (denumire leu)
        (mancare carnivor)
        (putere 2)))
(assert(animal
        (denumire hiena)
        (mancare carnivor)
        (putere 1)))
(assert(animal
        (denumire caprioara)
        (mancare vegetarian)))
(assert(animal
        (denumire foca)
        (zona polara)))
(assert(animal
        (denumire broasca)
        (mancare vegetarian)
        (modViata diurn)
        (mediuViata semiacvatic)
        (zona mediteraniana)))
(assert(animal
        (denumire ariciMare)
        (mancare vegetarian)
        (modViata diurn)
        (mediuViata semiacvatic)
        (zona mediteraniana)))
(assert(animal
        (denumire ursPolar)
        (zona polara)))

;afisare zona polare
(defrule antipattern
    ?p <- (animal{zona == polara}(denumire $?name))
    =>
    (printout t "Animale polare: " $?name crlf))


(defrule MediuAcvatic
    (declare(salience ?*TASK_PRIORITY_1*))
    ?p <- (animal{mancare == vegetarian && zona == mediteraniana}(denumire ?name))
    =>
    (printout t "Animalul care este vegetarian si traieste in zona mediteraniana: " ?name crlf))


; (mancare == animal1.mancare && mancare == carnivor)

(defrule pradator-prada
    ?animal1 <- (animal)
    	;(bind ?m1 animal1.mancare)
    ?animal <- (animal {mancare == animal1.mancare && mancare == carnivor
        				&& (putere < animal1.putere
            			; || animal1.mancare == vegetarian
            )})
    ?animal3 <- (animal{ mancare == carnivor})
    ?animal4 <- (animal{ mancare == vegetarian})
    =>
    (printout t "**Pradatorul este " animal1.denumire " si prada " ?animal2.denumire crlf )
    (printout t "**Pradatorul: " animal3.denumire " si prada: " ?animal4.denumire crlf))

(deftemplate note
    (slot matematica(type INTEGER))
    (slot informatica(type INTEGER))
    (slot fizica(type INTEGER))
    (slot chimie(type INTEGER))
    (slot limbaRomana(type INTEGER))
    (slot limbaEngleza(type INTEGER))
    (slot limbaGermana(type INTEGER))
    (slot economie(type INTEGER))
    (slot psihologie(type INTEGER))
    )

(assert (note (matematica 0)(informatica 0)(fizica 0)(chimie 0)(limbaRomana 0)(limbaEngleza 0)(limbaGermana 0)(economie 0)(psihologie 0)))

(defrule citeste
    ?id <- (note (matematica 0)(informatica 0)(fizica 0)(chimie 0)(limbaRomana 0)(limbaEngleza 0)(limbaGermana 0)(economie 0)(psihologie 0))
    =>
    (printout t "Notele elevului: " crlf)
    (printout t " -matematica: ")
    (bind ?m (read))
    (printout t " -informatica: ")
    (bind ?i (read))
    (printout t " -fizica: ")
    (bind ?f (read))
    (printout t " -chimie: ")
    (bind ?c (read))
    (printout t " -limbaRomana: ")
    (bind ?lr (read))
    (printout t " -limbaEngleza: ")
    (bind ?le (read))
    (printout t " -limbaGermana: ")
    (bind ?lg (read))
    (printout t " economie: ")
    (bind ?e (read))
    (printout t " psihologie: ")
    (bind ?p (read))
    (retract ?id)
    (assert (note (matematica ?m)(informatica ?i)(fizica ?f)(chimie ?c)(limbaRomana ?lr)(limbaEngleza ?le)(limbaGermana ?lg)(economie ?e)(psihologie ?p)))
    )

(defrule FacultateMateInfo
    (note (matematica ?m & :(>= ?m 8))(informatica ?i & :(>= ?i 8))(fizica ?f & :(>= ?f 8)))
    =>
    (printout t "Studentul poate sa isi depuna dosarul la Facultatea de Matematica si Informatica" crlf))
(run)