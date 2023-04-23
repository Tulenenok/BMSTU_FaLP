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
        grandparent(child_a, GrandMother, _, w).
