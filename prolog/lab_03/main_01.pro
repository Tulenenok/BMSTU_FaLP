DOMAINS
    name = symbol.
    sex = symbol.

PREDICATES
    parent(name, name, sex).
    grandparent(name, name, sex, sex).

CLAUSES
    parent(child_a, mother_a, w).
    parent(child_a, father_a, m).

    parent(mother_a, mother_of_mother_a, w).
    parent(mother_a, father_of_mother_a, m).

    parent(father_a, mother_of_father_a, w).
    parent(father_a, father_of_father_a, m).

    parent(child_b, mother_b, w).
    parent(mother_b, father_of_mother_b, m).

    grandparent(Child_, GrandParent_, ParentSex_, GrandParentSex_) :-
        parent(Child_, Parent_, ParentSex_),
        parent(Parent_, GrandParent_, GrandParentSex_).

GOAL
        % Задание 1
        % По имени субъекта определить всех его бабушек

        % grandparent(child_a, GrandMother, _, w).
        /*
            GrandMother=mother_of_mother_a
            GrandMother=mother_of_father_a
            2 Solutions
        */

        % grandparent(child_b, GrandMother, _, w).
        /*
            No Solution
        */


        % Задание 2
        % По имени субъекта определить всех его дедушек

        % grandparent(child_a, GrandFather, _, m).
        /*
            GrandFather=father_of_mother_a
            GrandFather=father_of_father_a
            2 Solutions
        */

        % grandparent(child_b, GrandFather, _, m).
        /*
            GrandFather=father_of_mother_b
            1 Solution
        */


        % Задание 3
        % По имени субъекта определить всех его бабушек и дедушек

        % grandparent(child_a, Grand, _, _).
        /*
            Grand=mother_of_mother_a
            Grand=father_of_mother_a
            Grand=mother_of_father_a
            Grand=father_of_father_a
            4 Solutions
        */

        % grandparent(child_b, Grand, _, _).
        /*
            Grand=father_of_mother_b
            1 Solution
        */

        % Задание 4
        % По имени субъекта определить его бабушку по материнской линии

        % grandparent(child_a, GrandMother, w, w).
        /*
            GrandMother=mother_of_mother_a
            1 Solution
        */

        % grandparent(child_b, GrandMother, w, w).
        /*
            No Solution
        */

        % Задание 5
        % По имени субъекта определить его бабушку и дедушку по материнской линии

        % grandparent(child_a, Grand, w, _).
        /*
            Grand=mother_of_mother_a
            Grand=father_of_mother_a
            2 Solutions
        */

        % grandparent(child_b, Grand, w, _).
        /*
            Grand=father_of_mother_b
            1 Solution
        */
