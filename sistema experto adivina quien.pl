% predicados dinamicos para poder interactuar con base de conocimientos
:- dynamic

%ariedades
sabe/3,personaje/1,genero/1,sombrero/1,nariz/1,cabello/1,ojos/1. 

%funcion de limpieza despues mostrar personaje exito
personaje:-retractall(sabe(_,_,_)),personaje(X),write("tu personaje es:"),nl,write(X),tab(1),write("???"). 

% descarte de preguntas segun atributos y valores faltantes para funcion sabe

personaje:-sabe(genero,Y,si),sabe(sombrero,Z,si),sabe(nariz,W,si),sabe(cabello,G,si),sabe(ojos,H,si),writ
("Cual es el personaje?"),nl,read(X),assert((personaje(X):-genero(Y),sombrero(Z),nariz(W),cabello(G),ojos(H))).

personaje:- sabe(genero,Y,si),sabe(sombrero,Z,si),sabe(nariz,W,si),sabe(ojos,H,si),write("Cual es el personaje?"),nl,read(X),write("de que color es su cabello?"),read(G),assert((personaje(X):-genero(Y),sombrero(Z),nariz(W),cabello(G),ojos(H))).

personaje:-sabe(genero,Y,si),sabe(sombrero,Z,si),sabe(sombrero,Z,si),sabe(ojos,H,si),write("Cual es el personaje?"),nl,read(X),write("cuan grande es su nariz?"),read(W),write("de que color del cabello?"),read(G),assert((personaje(X):-genero(Y),sombrero(Z),nariz(W),cabello(G),ojos(H))).

personaje:-sabe(genero,Y,si),sabe(ojos,H,si),write("Cual es el personaje"),nl,read(X),write("el personaje tiene sombrero?"),read(Z),write("cuan grande es su nariz?"),read(W),write("de que color es su cabello?"),read(G),assert((personaje(X):-genero(Y),sombrero(Z),nariz(W),cabello(G),ojos(H))).

personaje:-sabe(ojos,H,si),write("Cual es el personaje?"),nl,read(X),write("cual es el genero de tu personaje?"),read(Y),write("tu personaje usa sombrero?"),read(Z),write("cuan grande es su nariz"),read(W),write("de que color es su cabello?"),read(G),assert((personaje(X):-genero(Y),sombrero(Z),nariz(W),cabello(G),ojos(H))).

personaje:-write("Cual es el personaje?"),nl,read(X),write("cual es el genero de tu personaje?"),read(Y),write("tu personaje usa sombrero?"),read(Z),write("cuan grande es su nariz"),read(W),write("de que color es su cabello?"),read(G),write("de que color son sus ojos?"),read(H),assert((personaje(X):-genero(Y),sombrero(Z),nariz(W),cabello(G),ojos(H))).

%base de conocimientos
personaje(bernard):- genero(hombre),sombrero(si),nariz(grande),cabello(negro), ojos(negro).
personaje(anita):- genero(mujer), sombrero(no),nariz(pequenia),cabello(amarillo), ojos(azul).
genero(X):- interfaz(genero,X).
sombrero(X):- interfaz(sombrero,X).
nariz(X):- interfaz(nariz,X).
cabello(X):- interfaz(cabello,X).
ojos(X):- interfaz(ojos,X).

%verificacion de atributo y valor faltante asi como formulacion de pregunta por medio de los mismos
interfaz(Atributo,Valor):-sabe(Atributo,Valor,si).
interfaz(Atributo,Valor):-not(sabe(Atributo,Valor,_)),write(Atributo),tab(1),write(Valor),write("?"),nl,read(X),assert(sabe(Atributo,Valor,X)), X=si.

% modo desarrollador
d:- nl,nl,write("                      Interfaz de Desarrollo"),nl,nl,write("1.Elimina a un Personaje"),nl,nl,write("2.Modifica a un Personaje"),nl,nl,write("3.Mira a todos los personajes y sus caracteristicas"),nl,read(X),op(X).

%funcion para eliminar un personaje.
op(1):-write("Que Personaje Quieres eliminar"),read(X),retract((personaje(X):-genero(_),sombrero(_),nariz(_),cabello(_),ojos(_))),write("personaje eliminado").

%funcion para modificar.
op(2):- write("dime que personaje quieres modificar"),read(X),retract((personaje(X):-genero(_),sombrero(_),nariz(_),cabello(_),ojos(_)),write("cual es su genero sexual"),read(E),write("tiene sombrero"),read(F),write("como es su nariz"),read(G),write("que color es su cabello"),read(H),write("de que color son sus ojos"),read(I),
assert((personaje(X)):-genero(E),sombrero(F),nariz(G),cabello(H),ojos(I))).

%listar predicados.

op(3):-write("Escribe 'personaje.' para ver una lista con todos los personajes y sus caracteristicas"),nl,read(X),listing(X).
