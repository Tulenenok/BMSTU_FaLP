// СКРИПТ ДЛЯ ЗАПОЛНЕНИЯ БАЗЫ В NEO4J

// Введение в запрос create
//   child_a   -- переменная, с которой мы будем в дальнейшем работать
//   Person    -- метка, присвоенная переменной
//   name, sex -- свойства переменной

create 
    // Создаем вершины графа
    (child_a:Person {name: "child_a", sex:"f"}),

    (father_a:Person {name: "father_a", sex:"m"}),
    (mother_a:Person {name: "mother_a", sex:"f"}),

    (father_of_mother_a:Person {name: "father_of_mother_a", sex:"m"}),
    (mother_of_mother_a:Person {name: "mother_of_mother_a", sex:"f"}),

    (father_of_father_a:Person {name: "father_of_father_a", sex:"m"}),
    (mother_of_father_a:Person {name: "mother_of_father_a", sex:"f"}),

    (mother_of_father_of_mother_a:Person {name: "mother_of_father_of_mother_a", sex:"f"}),

    (sister_of_mother_a:Person {name: "sister_of_mother_a", sex:"f"}),
    (brother_of_father_a:Person {name: "brother_of_father_a", sex:"m"}),

    (child_c:Person {name: "child_c", sex:"m"}),
    (child_d:Person {name: "child_d", sex:"m"}),
    (child_e:Person {name: "child_e", sex:"m"}),
    (child_f:Person {name: "child_f", sex:"f"}),

    // Настраиваем родительские связи
    (mother_a)-[:Parent]->(child_a),
    (father_a)-[:Parent]->(child_a),

    (mother_of_mother_a)-[:Parent]->(mother_a),
    (father_of_mother_a)-[:Parent]->(mother_a),

    (mother_of_father_a)-[:Parent]->(father_a),
    (father_of_father_a)-[:Parent]->(father_a),

    (mother_of_father_of_mother_a)-[:Parent]->(father_of_mother_a),

    (sister_of_mother_a)-[:Parent]->(child_c),
    (brother_of_father_a)-[:Parent]->(child_d),
    (brother_of_father_a)-[:Parent]->(child_e),
    (brother_of_father_a)-[:Parent]->(child_f),

    // Настраиваем детские связи
    (child_a)-[:Child]->(mother_a),
    (child_a)-[:Child]->(father_a),

    (mother_a)-[:Child]->(mother_of_mother_a),
    (mother_a)-[:Child]->(father_of_mother_a),

    (father_a)-[:Child]->(mother_of_father_a),
    (father_a)-[:Child]->(father_of_father_a),

    (father_of_mother_a)-[:Child]->(mother_of_father_of_mother_a),

    (child_c)-[:Child]->(sister_of_mother_a),
    (child_d)-[:Child]->(brother_of_father_a),
    (child_e)-[:Child]->(brother_of_father_a),
    (child_f)-[:Child]->(brother_of_father_a),

    // Настраиваем связи брат сестра 
    (sister_of_mother_a)-[:Sibling]->(mother_a),
    (mother_a)-[:Sibling]->(sister_of_mother_a),

    (brother_of_father_a)-[:Sibling]->(father_a),
    (father_a)-[:Sibling]->(brother_of_father_a),

    // Настраиваем связи брак
    (mother_a)-[:Marriage]->(father_a),
    (father_a)-[:Marriage]->(mother_a),

    (mother_of_mother_a)-[:Marriage]->(father_of_mother_a),
    (father_of_mother_a)-[:Marriage]->(mother_of_mother_a),

    (mother_of_father_a)-[:Marriage]->(father_of_father_a),
    (father_of_father_a)-[:Marriage]->(mother_of_father_a)
;