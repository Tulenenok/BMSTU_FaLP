/* База знаний предки */

DOMAINS
    name = symbol.
    father = symbol.
    rank = integer.

PREDICATES
    name_father(name, father).
    get_nth_grandfather(name, father, rank).

CLAUSES
    name_father(child_a, father_a).
    name_father(father_a, father_father_a).
    name_father(father_father_a, father_father_father_a).

    get_nth_grandfather(Child_, Father_, Rank_) :-
        Rank_ > 0,
        name_father(Child_, F),
        get_nth_grandfather(F, Father_, Rank_ - 1).

    get_nth_grandfather(Child_, Father_, Rank_) :-
        Rank_ == 0,
        name_father(Child_, Father_).

GOAL
    get_nth_grandfather(child_a, Father, 0).
   