-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name`, `degrees`.`name`
FROM `students`
INNER JOIN `degrees`
    ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` LIKE "%Economia%";

-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
-- Neuroscienze

SELECT `departments`.`name`,`degrees`.`name`, `degrees`.`level`
FROM `departments`
INNER JOIN `degrees`
	ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
	AND `degrees`.`level` = "magistrale";


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.`name` AS "Nome_corso", `teachers`.`name` AS "Nome", `teachers`.`surname` AS "Cognome"
FROM `course_teacher`
INNER JOIN `courses`
	ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `course_teacher`.`teacher_id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
-- nome

SELECT `students`.`surname`AS "Cognome", `students`.`name` AS "Nome", `degrees`.`name` AS "Nome Corso", `departments`.`name` AS "Dipartimento"
FROM `students`
INNER JOIN `degrees`
	ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname` ASC, `students`.`name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`name` AS "Corso Laurea", `courses`.`name` AS "Corso", `teachers`.`name` AS "Nome", `teachers`.`surname` AS "Cognome" 
FROM `course_teacher`
INNER JOIN `teachers`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
	ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
	ON `degrees`.`id` = `courses`.`degree_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di
-- Matematica (54)

SELECT `departments`.`name` AS "Dipartimento", `teachers`.`surname` AS "Cognome", `teachers`.`name` AS "Nome", `degrees`.`name` AS "Corso"
FROM `departments`
INNER JOIN `degrees`
	ON `degrees`.`department_id` = `departments`.`id`
INNER JOIN `courses`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` = "Dipartimento di Matematica";

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
-- per ogni esame, stampando anche il voto massimo. Successivamente,
-- filtrare i tentativi con voto minimo 18.

SELECT CONCAT(`students`.`name`, " ", `students`.`surname`) AS "nome_studente" , `courses`.`name` AS "corso" , COUNT(`exam_student`.`student_id`) AS "tentativi" , MAX(`exam_student`.`vote`) AS "voto_massimo" 
FROM `exam_student`
INNER JOIN `exams`
    ON `exam_student`.`exam_id` = `exams`.`id`
INNER JOIN `students`
    ON `exam_student`.`student_id` = `students`.`id`
INNER JOIN `courses`
    ON `exams`.`course_id` = `courses`.`id`
GROUP BY `students`.`id`, `courses`.`name`;