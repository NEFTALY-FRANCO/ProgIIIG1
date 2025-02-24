%hechos
es_estaunidense(coronel_west).
nacion_hostil(corea_del_sur).
venta_armas(coronel_west,corea_del_sur).

%reglas
es_criminal(X) :- venta_armas(X,Y), nacion_hostil(Y).
