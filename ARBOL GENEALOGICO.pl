%hechos
padres(abraham,mona,herbert).
padres(abraham,mona,homero).
padres(homero,marge,bart).
padres(homero,marge,lisa).
padres(homero,marge,maggie).
padres(clancy,jacqueline,marge).
padres(clancy,jacqueline,patty).
padres(clancy,jacqueline,selma).
padres(desconocido,selma,ling).

%reglas
es_padre(X,Z) :- padres(X,_,Z).
es_madre(Y,Z) :- padres(_,Y,Z).
padres_de(X,Y,Z) :- padres(X,Y,Z).
es_hijo(Z,R) :- padres(R,_,Z);  padres(_,R,Z).
son_hermanos(A,B) :- padres_de(X,Y,A), padres_de(X,Y,B).
es_tio(A,Z) :- padres_de(X,Y,Z), (son_hermanos(A,X);son_hermanos(A,Y)), \+ es_hijo(Z,A).
es_abuelo(A,Z) :-  padres_de(X,Y,Z), (es_padre(A,X); es_padre(A,Y)).
es_abuela(A,Z) :-  padres_de(X,Y,Z), (es_madre(A,X); es_madre(A,Y)).
es_primo(A,B) :- padres_de(X,Y,A), (es_tio(X,B); es_tio(Y,B)).
