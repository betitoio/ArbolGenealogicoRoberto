%hombres

%varon(x): x es varon

varon(silverio).
varon(braulio).
varon(carlos).
varon(roberto).
varon(alfredo).
varon(reynaldo).
varon(roger).
varon(carlos_alejandro).
varon(yamil).
varon(ernesto).
varon(freddy).
varon(miguel).
varon(rolando).
varon(marco).
varon(bryan).
varon(ariel).
varon(dennis).
varon(miguel_angel).
varon(sebastian).
varon(marco_antonio).
varon(gabriel).
varon(sergio).
varon(luciano).
varon(benjamin).


%mujeres

%mujer(x): x es mujer
mujer(lucia).
mujer(carmen).
mujer(virginia).
mujer(ilenka).
mujer(tania).
mujer(jenny).
mujer(zenaida).
mujer(cristina).
mujer(maria).
mujer(gaby).
mujer(paty).
mujer(deyna).
mujer(briana).
mujer(sol).
mujer(talia).
mujer(claudia).

%relacion de padre
%padre(x,y): x es padre de y
padre(silverio,carlos).
padre(silverio,virginia).
padre(carlos,roberto).
padre(carlos,alfredo).
padre(carlos,tania).
padre(carlos,reynaldo).
padre(carlos,roger).
padre(carlos,carlos_alejandro).
padre(carlos,claudia).
padre(braulio,ernesto).
padre(braulio,freddy).
padre(braulio,ricardo).
padre(braulio,rolando).
padre(braulio,miguel).
padre(braulio,marco).
padre(braulio,maria).
padre(braulio,cristina).
padre(braulio,zenaida).
padre(roberto,deyna).
padre(alfredo,gabriel).
padre(alfredo,briana).
padre(reynaldo,sergio).
padre(reynaldo,luciano).
padre(roger,sol).
padre(roger,benjamin).
padre(ernesto,gaby).
padre(ricardo,paty).


%relacion de madre
%madre(x,y): x es madre de y
madre(lucia,carlos).
madre(lucia,virginia).
madre(virginia,yamil).
madre(virginia,ilenka).
madre(virginia,jenny).
madre(carmen,ernesto).
madre(carmen,freddy).
madre(carmen,ricardo).
madre(carmen,rolando).
madre(carmen,miguel).
madre(carmen,marco).
madre(carmen,zenaida).
madre(carmen,cristina).
madre(carmen,maria).
madre(zenaida,tania).
madre(zenaida,roberto).
madre(zenaida,alfredo).
madre(zenaida,reynaldo).
madre(zenaida,roger).
madre(tania,talia).


%REGLAS
diferente(X,Y):-not(X=Y).
%abuelo(X,Y): Xes abuelo de Y.
abuelo(X,Y):-padre(X,Z),((padre(Z,Y));(madre(Z,Y))).

%abuela
abuela(X,Y):-madre(X,Z),((padre(Z,Y));(madre(Z,Y))).

%hijo(x,y):x es hijo de y
hijo(X,Y):-varon(X),(padre(Y,X);madre(Y,X)).

%hija(x,y):x es hija de y
hija(X,Y):-mujer(X),(padre(Y,X);madre(Y,X)).

%tio(X,Y):x es tio de y
tio(X,Y):-varon(X),((padre(P,Y),hermano(X,P);madre(M,Y),hermano(X,M));(padre(X,M2),madre(AU,M2),(hermana(AU,M1),madre(M1,Y);hermana(AU,P1),padre(P1,Y)))).
%tio(X,Y):-varon(X),(sobrina(Y,X);sobrino(Y,X)).

%tia
tia(X,Y):-mujer(X),((padre(P,Y),hermana(X,P);madre(M,Y),hermana(X,M));(madre(X,M2),padre(AU,M2),(hermano(AU,M1),madre(M1,Y);hermano(AU,P1),padre(P1,Y)))).
%primo(X,Y): X Es primo de Y
primo(X,Y):-(padre(Z,Y);madre(Z,X)),(padre(Z1,Y);madre(Z1,Y)),(hermana(Z,Z1);hermana(Z,Z1)),varon(X),diferente(X,Y).
%prima(X,Y): X Es prima de Y
prima(X,Y):-(padre(Z,Y);madre(Z,X)),(padre(Z1,Y);madre(Z1,Y)),(hermana(Z,Z1);hermana(Z,Z1)),mujer(X),diferente(X,Y).

%sobrino(X,Y) : X ES SOBRINO DE Y
sobrino(X,Y):-hijo(X,P),(hermano(P,Y);hermana(P,Y)).

%sobrina (X,Y): X ES SOBRINA DE Y
% sobrina(X,Y):-hija(X,P),(hermano(P,Y);hermana(P,Y)),((madre(Y,HA),mujer(Y),padre(Z1,HA));(varon(Y),padre(Y,HB),madre(Z2,HB))).
sobrina(X,Y):-hija(X,P),(hermano(P,Y);hermana(P,Y)).

%hermano(x,y): x es hermano de y
hermano(X,Y):-padre(Z,X),padre(Z,Y),madre(Z1,X),madre(Z1,Y),not(X=Y),varon(X).

%hermana
hermana(X,Y):-padre(Z,X),padre(Z,Y),madre(Z1,X),madre(Z1,Y),not(X=Y),mujer(X).

% ANCESTRO CASO BASE
ancestro(X,Y):-padre(X,Y).
ancestro(X,Y):-madre(X,Y).
ancestro(X,Y):-padre(X,Z),ancestro(Z,Y).
ancestro(X,Y):-madre(X,Z),ancestro(Z,Y).
%CASO RECUERRENTE
ancestro(X,Y):-(padre(X,Z);madre(X,Z)),ancestro(Z,Y).

%DESCENDIENTE
descendiente(X,Y):-ancestro(Y,X).

%hermanastra(X,Y):-(padre(Z,X);madre(Z,X)),(padre(Z,Y);madre(Z,Y)),not(X=Y),not(varon(Y)).

