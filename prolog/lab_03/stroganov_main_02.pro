DOMAINS
    name = symbol.
    rank = integer.

PREDICATES
    name_father(name, name).
    get_nth_grandfather(name, name, rank).

CLAUSES
    name_father(child_a, father_a).
    name_father(father_a, father_father_a).
    name_father(father_father_a, father_father_father_a).

    get_nth_grandfather(Child, Father, 0) :- name_father(Child, Father).

    get_nth_grandfather(Child, Father, Rank) :-
      Rank > 0,
        name_father(Child, F),
        DecRank = Rank - 1,
        get_nth_grandfather(F, Father, DecRank).

GOAL
    get_nth_grandfather(child_a, Father, 0).
