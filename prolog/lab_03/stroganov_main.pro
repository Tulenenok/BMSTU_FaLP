/* База знаний предки */

DOMAINS
    name = symbol.
    sex = symbol.

PREDICATES
    % это будем задавать как базу знаний
    parent(name, name, sex).                % описать мать или отца
    sister_brother(name, name, sex).        % описать сестру или брата


    % это будем искать
    grandgrandparent(name, name, sex, sex). 
    grandparent(name, name, sex, sex).      % найти бабушку или дедушку
    aunt_uncle(name, name, sex, sex).       % найти тетю или дедю
    cousin(name, name, sex, sex).           % найти кузину
    child(name, name, sex, sex).            % найти ребенка


CLAUSES
    parent(child_a, mother_a, w).
    parent(child_a, father_a, m).

    parent(mother_a, mother_of_mother_a, w).
    parent(mother_a, father_of_mother_a, m).

    parent(father_a, mother_of_father_a, w).
    parent(father_a, father_of_father_a, m).

    parent(father_of_mother_a, mother_of_father_of_mother_a, m).        % прабабушка

    sister_brother(mother_a, sister_of_mother_a, w).
    sister_brother(father_a, brother_of_father_a, m).

    parent(child_c, sister_of_mother_a, w).
    parent(child_d, brother_of_father_a, m).
    parent(child_e, brother_of_father_a, m).
    parent(child_f, brother_of_father_a, m).

    parent(child_b, mother_b, w).
    parent(mother_b, father_of_mother_b, m).

    grandparent(Child_, GrandParent_, ParentSex_, GrandParentSex_) :-
        parent(Child_, Parent_, ParentSex_),
        parent(Parent_, GrandParent_, GrandParentSex_).

    grandgrandparent(Child_, GrandGrandParent_, ParentSex_, GrandParentSex_, GrandGrandParentSex_) :-
        parent(Child_, Parent_, ParentSex_),
        parent(Parent_, GrandParent_, GrandParentSex_).
        parent(GrandParent_, GrandGrandParent_, GrandGrandParentSex_).

GOAL
    % grandparent(child_a, GrandMother, _, w).

    grandgrandparent(child_a, GrandGrandMother, _, _, _).

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
