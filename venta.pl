venta(tandil,fiambre(salame,10,casero),fecha(2,6,2019)).
venta(caroya,queso(gruyere),fecha(2,6,2019)).
venta(tandil,bebida(vino,italia),fecha(1,6,2019)).
venta(tandil,bebida(vino,francia),fecha(1,6,2019)).
venta(caroya,bebida(agua,argentina),fecha(1,6,2019)).

vendeAlgunaCosaInternacional(Lugar):-
	    venta(Lugar,Producto,_),
	    esExtranjero(Producto).

vendeAlgoQueNoEsVino(Lugar):-
	    Producto \= bebida(vino,_),
	    venta(Lugar,Producto,_).

vendeInternacional(Lugar):-
	esUnLugar(Lugar),
	forall(
	    venta(Lugar,Producto,_),
	    esExtranjero(Producto)
	).


/*
vendeInternacional(Lugar):-
	forall(
	    venta(Lugar,Producto,_),
	    not(esNacional(Producto))
	).
*/
/*
vendeInternacional(Lugar):-
	not(vendeAlgoNacional(Lugar)).

vendeAlgoNacional(Lugar):-
	    venta(Lugar,Producto,_),
	    esNacional(Producto).
*/
/*
vendeInternacional(Lugar):-
	esUnLugar(Lugar),
	not((venta(Lugar,Producto,_),esNacional(Producto))).
*/

esNacional(Producto):-venta(_,Producto,_),not(esExtranjero(Producto)).


esExtranjero(bebida(_,Origen)):-
	fueraDelPais(Origen).

esExtranjero(queso(Tipo)):-
	procedencia(Tipo,Lugar),
	fueraDelPais(Lugar).

esExtranjero(fiambre(_,_,_)).

procedencia(gruyere,francia).
procedencia(cuartirolo,argentina).
procedencia(roquefort,roquefort).


fueraDelPais(italia).
fueraDelPais(francia).
fueraDelPais(roquefort).



esUnLugar(tandil).
esUnLugar(caroya).









continente(america,[argentina,chile,uruguay,peru,brasil,colombia]).
continente(africa,[sahara,egipto,etiopia,sudafrica,zaire,madagascar]).

estaEn(Pais,Continente):-
    continente(Continente,Paises),
    member(Pais,Paises).






