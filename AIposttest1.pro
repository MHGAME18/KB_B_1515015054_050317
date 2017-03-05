predicates			%digunakan untuk mendeklarasikan predikat
  hobby(symbol,symbol) - nondeterm (o,i), nondeterm (i,i) %hobby adalah predikat yang dideklarasikan

clauses				%digunakan untuk mendefinisikan predikat, atau isi dari predikat
  hobby(firnawan,ngopi).	%hobby adalah predikat, firnawan,ngopi adalah deklasrasi isi definisi dari predikat
  hobby(budi,foto).
  hobby(dony,basket).
  hobby(nando,futsal).
  hobby(willy,basket).
  hobby(hanafi,jogging).
  hobby(willy,bola).
  hobby(dony,renang).
  hobby(hanafi,futsal).

goal				%goal adalah tujuan yang akan mengeluarkan output dari pernyataan yang di berikan di bawah
  hobby(Person,futsal); 	%memanggil nama orang(person) yang menyukai hobby futsal, dan tanda titik koma(;)artinya atau ialah memanggil person yang menyukai futsal atau bisa yang lain yang telah di deklrasikan
  hobby(Person,basket); 	%sama seperti diatas, tetapi memanggil hobby basket
  hobby(Person,jogging).	%sama seperti diatas, tetapi memanggil hobby jogging dan diakhiri dengan tanda titik(.)