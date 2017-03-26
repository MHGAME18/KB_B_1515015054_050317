/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains 	%untuk menyatakan jenis variable atau argumen.
  name,sex,occupation,object,vice,substance = symbol	%baris ini dinyatakan sebagai simbol
  age=integer	%umur dinyatakan sebagai integer

predicates	%predicates adalah pendeklarasian relasi.
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o) 
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)
  killed_with(name,object) - determ (i,o)
  killed(name) - procedure (o)
  killer(name) - nondeterm (o)
  motive(vice) - nondeterm (i)
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)
  owns(name,object) - nondeterm (i,i)
  operates_identically(object,object) - nondeterm (o,i)
  owns_probably(name,object) - nondeterm (i,i)
  suspect(name) - nondeterm (i)

/* * * Facts about the murder * * */
clauses
  person(bert,55,m,carpenter).		%bert seorang tukang kayu, jenis kelamin laki-laki berusia 55 tahun.
  person(allan,25,m,football_player).	%allan seorang pemain bola, jenis kelamin laki-laki berusia 25 tahun
  person(allan,25,m,butcher).
  person(john,25,m,pickpocket).		%john seorang perampok, jenis kelamin laki-laki berusia 25 tahun
	
  had_affair(barbara,john).	%barbara memiliki hubungan dengan jhon
  had_affair(barbara,bert).	%barbara memiliki hubungan dengan bert
  had_affair(susan,john).	%susan memiliki hubungan dengan jhon

  killed_with(susan,club). 	%susan terbunuh dengan di pentung.
  killed(susan).		%susan terbunuh.

  motive(money).		%motif karna uang.
  motive(jealousy).		%motif karna cemburu.
  motive(righteousness).	%motif karna kebenaran atau rahasia.

  smeared_in(bert,blood).	%bert berlumur darah.
  smeared_in(susan,blood).	%susan berlumur darah.
  smeared_in(allan,mud).	%allan berlumur lumpur.
  smeared_in(john,chocolate).	%jhon berlumur coklat
  smeared_in(barbara,chocolate).%babara berlumur coklat

  owns(bert,wooden_leg).	%bert memiliki kaki kayu
  owns(john,pistol).		%jhon memiliki pistol

/* * * Latar Belakang Pengetahuan * * */

  operates_identically(wooden_leg, club).	%kaki kayu digunakan seperti pentungan
  operates_identically(bar, club).		%balok digunakan seperti pentungan
  operates_identically(pair_of_scissors, knife).%gunting digunakan seperti pisau
  operates_identically(football_boot, club).	%sepatu bola digunakan seperti pentungan

  owns_probably(X,football_boot):-		%X kemungkinan memiliki sepatu bola jika maka
	person(X,_,_,football_player).		%X dan orang lainnya pemain sepak bola.
  owns_probably(X,pair_of_scissors):-		%X kemungkinan memiliki gunting jika maka
	person(X,_,_,hairdresser).		%X dan orang lainnya pekerja salon
	  owns_probably(X,Object):-		%kemungkinan objek milik X jika maka
	owns(X,Object).				%X memiliki objek.

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * dicurigai atau tersangka yang memiliki senjata              *
 * yang kerjanya mirip dengan senjata penyebab susan terbunuh  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-					%X tersangka jika maka
	killed_with(susan,Weapon) ,		%susan terbunuh dengan senjata dan
	operates_identically(Object,Weapon) ,	%objek digunakan seperti senjata dan
	owns_probably(X,Object).		%X kemungkinan memiliki objek.

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Tersangka laki-laki yang Memiliki hubungan dengan susan *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-					%X tersangka jika maka
	motive(jealousy),			%Cemburu adalah motif dan
	person(X,_,m,_),			%X seorang laki-laki dan
	had_affair(susan,X).			%susan memiliki hubungan dengan x

/* * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Tersangka perempuan yang memiliki hubungan dengan   *
 * seseorang yang juga memiliki hubungan dengan susan  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-					%X tersangka jika maka
	motive(jealousy),			%cemburu adalah motif dan
	person(X,_,f,_),			%X adalah seorang perempuan dan
	had_affair(X,Man),			%X memiliki hubungan dengan lakilaki dan
	had_affair(susan,Man).			%susan memiliki hubungan dengan lakilaki

/* * * * * * * * * * * * * * * * * * * * *
 * Tersangka merampok dengan motif uang  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-					%X tersangka jika maka
	motive(money),				%uang adalah motif dan
	person(X,_,_,pickpocket).		%Xseorang perampok

  killer(Killer):-				%pembunuh adalah pembunuh jika maka
	person(Killer,_,_,_),			%pembunuh seorang pembunuh dan
	killed(Killed),				%seorang terbunuh dan
	Killed <> Killer, /*Bukan bunuh diri*/ 	%Relasi dari terbunuh adalah pembunuh dan
	suspect(Killer),			%Pembunuh adalah tersangka dan
	smeared_in(Killer,Goo),			%pembunuh berlumuran darah dan
	smeared_in(Killed,Goo).			%terbunuh berlumuran darah

goal
  killer(X).
  /*ANALISIS PROGRAM
  Pembunuh adalah Bert.
  Karena dari latar belakang pengetahuan susan terbunuh karena dengan dipentung,
  yang ditemukan ada sepatu kayu,balok dan sepatu bola yang di pentungkan. 
  sepatu kayu dimiliki oleh Bert dan sepatu bola pasti dimiliki pemain bola yaitu allan,
  dicurigai tersangka yang memiliki senjata yang kerjanya mirip dengan senjata penyebab susan terbunuh,
  ialah Bert dan bert di seleksi killer pada smeared_in atau berlumuran darah sama dengan susan yang terbunuh dengan berlumur darah.
  jadi pembunuh adalah Bert.
  */