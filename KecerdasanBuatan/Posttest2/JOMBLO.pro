%Program ini dibuat untuk menentukan bagaimana seorang jomblo 
%bisa mendapatkan WANITA pujaanya namun mereka harus 
%membawa HADIAH berupa barang kesukaan wanita tersebut.
predicates
  nondeterm
  pdkt(symbol,symbol,symbol)
  jomblo(symbol)- nondeterm (o)  
  wanita(symbol)
  ingin(symbol,symbol)
  membawa(symbol,symbol) - nondeterm (i,o)
  hadiah(symbol)- nondeterm (i) 

clauses
  pdkt(X,Y,Z):-
	jomblo(X),
	wanita(Z),
	membawa(X,Y),
   	ingin(Z,Y),
   	hadiah(Y).

  jomblo(nando).
  jomblo(willy).
  jomblo(iyo). 
  jomblo(rizky).
  
  wanita(luna).    
  wanita(mei).
  
  membawa(nando, mobil).
  membawa(willy, coklat).
  membawa(iyo, mobil).
  membawa(rizky, bunga).
  membawa(adam, coklat).
  
  ingin(luna,mobil).
  ingin(mei,bunga).
  ingin(mei,coklat).

  hadiah(mobil).
  hadiah(coklat).
  hadiah(bunga).
  
goal
  pdkt(X,Y,jesica).%Jadi goalnya adalah "X" harus membawa "Y" jika ingin pdkt dengan "jesica".