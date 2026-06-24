% Estudiantes: nombre, curso y nota
% -------------------
% prolog
estudiante(ana, prolog, 6.5).
estudiante(luis, prolog, 3.8).
estudiante(maria, prolog, 5.0).
estudiante(pedro, prolog, 4.2).
estudiante(sofia, prolog, 2.9).
estudiante(carlos, prolog, 6.0).
estudiante(rebeca, prolog, 4.7).
% java
estudiante(valentina, java, 5.5).
estudiante(diego, java, 3.5).
estudiante(camila, java, 4.8).
estudiante(nicolas, java, 6.2).
estudiante(isidora, java, 2.1).
estudiante(sebastian, java, 4.0).
estudiante(esteban, java, 3.3).
% python
estudiante(fernanda, python, 5.8).
estudiante(matias, python, 3.2).
estudiante(gabriela, python, 4.5).
estudiante(rodrigo, python, 6.7).
estudiante(alejandra, python, 3.9).
estudiante(ignacio, python, 5.1).
% redes
estudiante(barbara, redes, 4.3).
estudiante(felipe, redes, 2.7).
estudiante(constanza, redes, 6.1).
estudiante(andres, redes, 5.4).
estudiante(paola, redes, 3.6).
estudiante(cristian, redes, 4.9).
% bases de datos
estudiante(javiera, bases_datos, 5.3).
estudiante(tomas, bases_datos, 3.1).
estudiante(daniela, bases_datos, 6.4).
estudiante(vicente, bases_datos, 4.6).
estudiante(antonia, bases_datos, 2.5).
estudiante(maximiliano, bases_datos, 5.9).
% -------------------
% Reglas
% -------------------
pertenece(Nombre, Curso) :-
    estudiante(Nombre, Curso, _).
% nota mayor o igual a 4.0 = aprobado
aprobado(Nombre) :-
    estudiante(Nombre, _, Nota),
    Nota >= 4.0.
% nota menor a 4.0 = reprobado
reprobado(Nombre) :-
    estudiante(Nombre, _, Nota),
    Nota < 4.0.
% -------------------
% Consulta interactiva
% -------------------
mostrar_estado_estudiante :-
    write('Ingrese el nombre del estudiante: '),
    read(Nombre),
    ( estudiante(Nombre, Curso, Nota) ->
        write('Nombre: '), write(Nombre), nl,
        write('Curso: '), write(Curso), nl,
        write('Nota: '), write(Nota), nl,
        ( Nota >= 4.0 ->
            write('Estado: Aprobado'), nl
        ;
            write('Estado: Reprobado'), nl
        )
    ;
        write('No se encontro el estudiante.'), nl
    ).
% -------------------
% Calculadora
% -------------------
calculadora :-
    write('Primer numero: '), read(A),
    write('Segundo numero: '), read(B),
    write('Operacion (+, -, *, /): '), read(Op),
    calcular(Op, A, B).
calcular(+, A, B) :- R is A + B, write('Resultado: '), write(R), nl.
calcular(-, A, B) :- R is A - B, write('Resultado: '), write(R), nl.
calcular(*, A, B) :- R is A * B, write('Resultado: '), write(R), nl.
calcular(/, _, 0) :- write('Error: division por cero'), nl.
calcular(/, A, B) :- B \= 0, R is A / B, write('Resultado: '), write(R), nl.
calcular(_, _, _) :- write('Operacion no valida'), nl.
% -------------------
% Menu principal
% -------------------
menu :-
    repeat,
        nl,
        write('--- Centro de Apoyo Academico ---'), nl,
        write('1. Consultar estudiante'), nl,
        write('2. Verificar pertenencia a curso'), nl,
        write('3. Ver si esta aprobado o reprobado'), nl,
        write('4. Calculadora'), nl,
        write('5. Salir'), nl,
        write('Opcion: '),
        read(Op),
        ejecutar_opcion(Op),
        Op =:= 5,
    !.
ejecutar_opcion(1) :- mostrar_estado_estudiante.
ejecutar_opcion(2) :-
    write('Nombre del estudiante: '), read(Nombre),
    write('Nombre del curso: '), read(Curso),
    ( pertenece(Nombre, Curso) ->
        write(Nombre), write(' pertenece al curso '), write(Curso), nl
    ;
        write(Nombre), write(' no esta en ese curso'), nl
    ). 
ejecutar_opcion(3) :-
    write('Nombre del estudiante: '), read(Nombre),
    ( aprobado(Nombre) ->
        write(Nombre), write(' esta Aprobado'), nl
    ; reprobado(Nombre) ->
        write(Nombre), write(' esta Reprobado'), nl
    ;
        write('Estudiante no encontrado'), nl
    ).
ejecutar_opcion(4) :- calculadora.
ejecutar_opcion(5) :- write('Hasta luego!'), nl.
ejecutar_opcion(_) :- write('Opcion no valida, intente de nuevo'), nl.
