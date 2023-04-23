# Лабораторная работа №3

## Задание 1

Создать базу знаний "предки". Варианты вопросов:

1. По имени субъекта определить всех его бабушек
2. По имени субъекта определить всех его дедушек
3. По имени субъекта определить всех его бабушек и дедушек
4. По имени субъекта определить его бабушку по материнской линии
5. По имени субъекта определить его бабушку и дедушку по материнской линии

## Задание 2

Дополнить базу знаний правилами, позволяющими найти

1. Максимум из двух чисел (без и с использованием отсечения)
2. Максимум из трех чисел (без и с использованием отсечения)

## Защита от Строгонова 1

Создать базу знаний "5 видов родственников". Сравнить запросы к ней на прологе, естесственном языке и графовой СУБД Neodje.

База знаний выглядит примерно следующим образом:

<img src="img/falp_lab_03.svg">

### Как заполнить базу

```
create (child_a:Person {name: "child_a", sex:"f"}),

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
       (child_d:Person {name: "child_c", sex:"m"}),
       (child_e:Person {name: "child_c", sex:"m"}),
       (child_f:Person {name: "child_c", sex:"f"}),

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

       (child_a)-[:Child]->(mother_a),
       (child_a)-[:Child]->(father_a),

       (mother_a)-[:Child]->(mother_of_mother_a),
       (mother_a)-[:Child]->(father_of_mother_a),

       (father_a)-[:Child]->(mother_of_father_a),
       (father_a)-[:Child]->(father_of_father_a),

       (father_of_mother_a)-[:Child]->(mother_of_father_of_mother_a),

       (sister_of_mother_a)-[:Child]->(mother_a),
       (sister_of_mother_a)-[:Child]->(father_a),
       
       ;
```

