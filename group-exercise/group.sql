-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(`enrolment_date`) AS "Anno", COUNT(*) AS "Iscritti"
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT `office_address` AS "Edificio", COUNT(*) AS "Numero Professori"
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id` AS "Appello", AVG(`vote`)  AS "Media Voti"
FROM `exam_student`
WHERE `vote` >= 18
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `degrees`.`department_id` AS "Dipartimento" , COUNT(*) AS "Numero Corsi"
FROM `degrees`
GROUP BY `department_id`;