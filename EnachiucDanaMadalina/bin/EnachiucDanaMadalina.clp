
(deftemplate Animals (multislot race)(multislot sex)(slot height))
(deffacts NoahArk
    (Animals(race mouse)(sex masculine)(height 2))
    (Animals(race mouse)(sex feminine)(height 1))
    (Animals(race squirrel)(sex masculine)(height 15))
    (Animals(race squirrel)(sex feminine)(height 10))
    (Animals(race cat)(sex masculine)(height 30))
    (Animals(race cat)(sex feminine)(height 20))
    (Animals(race dog)(sex masculine)(height 100))
    (Animals(race dog)(sex feminine)(height 90))
    (Animals(race cow)(sex masculine)(height 180))
    (Animals(race cow)(sex feminine)(height 160))
    (Animals(race elephant)(sex masculine)(height 330))
    (Animals(race elephant)(sex feminine)(height 270))
    (Animals(race giraffe)(sex masculine)(height 550))
    (Animals(race giraffe)(sex feminine)(height 480))
    )(reset)

(defrule rule2
    (Animals(race $?x)(sex feminine)(height $?y))
   => 
    (if (<=  $?y 270) 
        then 
        	(printout t "Female animals with height <= 270 are: " $?x $?y crlf )
	)
)
(facts)(run)
