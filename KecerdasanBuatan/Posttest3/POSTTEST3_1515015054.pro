domains
%j=jam, r=ruang
j, r=symbol

predicates
nondeterm ruang(r,j,j,j,j,j,j)
nondeterm ruang(r,j,j,j)
nondeterm j_pagi(j,j,j,j)
nondeterm j_siang(j,j,j,j)
nondeterm j_sore(j,j,j,j)

clauses
ruang(r405,ipa,mtk,bahasa,agama,binggris,biologi).
ruang(r406,kimia,pkn,kalkulus).
ruang(r407,komas,visual,ai).
j_pagi(mtk,agama,kimia,komas).
j_siang(ipa,binggris,pkn,visual).
j_sore(sosiologi,biologi,kalkulus,ai).

goal
write("Mata kuliah yang ada di ruang 405 :"),nl,ruang(r405,J1,J2,J3,J4,J5,J6);
nl,write("Mata kuliah yang ada di ruang 406 :"),nl,ruang(r406,J1,J2,J3);
nl,write("Mata kuliah yang ada di ruang 407 :"),nl,ruang(r407,J1,J2,J3);
nl,write("Jadwal di Pagi hari :"),nl,j_pagi(J1,J2,J3,J4);
nl,write("Jadwal di Siang hari :"),nl,j_siang(J1,J2,J3,J4);
nl,write("Jadwal di Sore hari :"),nl,j_sore(J1,J2,J3,J4);
nl,write("Semua Mata Kuliah :"),nl,ruang(_,J1,J2,J3);ruang(_,J1,J2,J3,J4,J5,J6).
