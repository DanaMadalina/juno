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

;TEMA - INVENTAM REGULI SI PTR CELELALTE FACULTATI