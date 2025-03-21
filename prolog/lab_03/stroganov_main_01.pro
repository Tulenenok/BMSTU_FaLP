/* База знаний предки */

DOMAINS
    name = symbol.
    sex = symbol.

PREDICATES
    % это будем задавать как базу знаний
    parent(name, name, sex).           % описать мать или отца 
    sister_brother(name, name, sex).        % описать сестру или брата


    % это будем искать
    grandgrandparent(name, name, sex, sex, sex). 
    grandparent(name, name, sex, sex).      % найти бабушку или дедушку
    aunt_uncle(name, name, sex, sex).       % найти тетю или дедю
    cousin(name, name, sex).                % найти кузину
    child(name, name).                      % найти ребенка


CLAUSES
    parent(child_a, mother_a, w).
    parent(child_a, father_a, m).

    parent(mother_a, mother_of_mother_a, w).
    parent(mother_a, father_of_mother_a, m).

    parent(father_a, mother_of_father_a, w).
    parent(father_a, father_of_father_a, m).

    parent(father_of_mother_a, mother_of_father_of_mother_a, m).        % прабабушка

    parent(child_c, sister_of_mother_a, w).
    parent(child_d, brother_of_father_a, m).
    parent(child_e, brother_of_father_a, m).
    parent(child_f, brother_of_father_a, m).

    parent(child_b, mother_b, w).
    parent(mother_b, father_of_mother_b, m).

    sister_brother(mother_a, sister_of_mother_a, w).
    sister_brother(father_a, brother_of_father_a, m).

    grandparent(Child_, GrandParent_, ParentSex_, GrandParentSex_) :-
        parent(Child_, Parent_, ParentSex_),
        parent(Parent_, GrandParent_, GrandParentSex_).

    grandgrandparent(Child_, GrandGrandParent_, ParentSex_, GrandParentSex_, GrandGrandParentSex_) :-
        grandparent(Child_, GrandParent_, ParentSex_, GrandParentSex_),
        parent(GrandParent_, GrandGrandParent_, GrandGrandParentSex_).

    aunt_uncle(Child_, AuntUncle_, ParentSex_, AuntUncleSex_) :-
        parent(Child_, Parent_, ParentSex_),
        sister_brother(Parent_, AuntUncle_, AuntUncleSex_).
    
    cousin(Child_, Cousin_, ParentSex_) :-
        aunt_uncle(Child_, AuntOrUncle_, ParentSex_, _),
        parent(Cousin_, AuntOrUncle_, _).

    child(Child_, Parent_) :-
        parent(Child_, Parent_, _).

GOAL
    % grandgrandparent(child_a, GrandGrandMother, _, _, _).
    /*
        GrandGrandMother=mother_of_father_of_mother_a
        1 Solution
    */

    % aunt_uncle(child_a, Aunt, _, w).
    /*
        Aunt=sister_of_mother_a
        1 Solution
    */

    % aunt_uncle(child_a, Uncle, _, m).
    /*
        Uncle=brother_of_father_a
        1 Solution
    */

    % aunt_uncle(child_a, AuntOrUncle, _, _).
    /*
        AuntOrUncle=sister_of_mother_a
        AuntOrUncle=brother_of_father_a
        2 Solutions
    */

    %cousin(child_a, Cousin, _).
    /*
        Cousin=child_c
        Cousin=child_d
        Cousin=child_e
        Cousin=child_f
        4 Solutions
    */

    child(Child, mother_of_father_of_mother_a).
    /*
        Child=father_of_mother_a
        1 Solution
    */