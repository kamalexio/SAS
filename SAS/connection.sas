/*Credentials*/

%let usr = user;
%let mv_pass = password;

/*SAS password encryption*/

proc pwencode in = 'password';
run;

/*Connect Libraries*/

/*SAS*/

LIBNAME X META LIBRARY = 'X' METAOUT = DATA;

/*SAS Oracle with credentials*/

LIBNAME X ORACLE PATH = Y SCHEMA = Z 
USER = &usr. PASSWORD = &mv_pass.;

/*Oracle*/

LIBNAME X ORACLE PATH = Y SCHEMA = Z; 
options sastrace = ',,,d' sastraceloc = saslog nostsuffix;

/*Postgres with credentials*/

LIBNAME X ODBC DATASRC = Y SCHEMA = Z 
USER = &usr. PASSWORD = &mv_pass.
INSERTBUFF = 32767 READBUFF = 32767 dbconinit = "SET client_encoding = 'WIN1251'";

/*Kinit Auth*/

%kinit(mvPwdName = mv_pass, mv_USER = &usr.);