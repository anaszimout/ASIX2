CREATE TABLE Factura (
  Numero_factura number(10) PRIMARY KEY,
  Exercici_facturacio number(10),
  Serie_facturacio varchar2(255),
  Data timestamp(0),
  Descripcio varchar2(255) NULL,
  ID_client number(10),
  NSS_treballador number(11),
  Pagament varchar2(255) NOT NULL,
  Import number(10) NULL
);


CREATE TABLE Producte (
  Codi number(10) PRIMARY KEY,
  Nom_comercial varchar2(255),
  Preu_unitat number(10),
  Volumen varchar2(255),
  Refrigeracio varchar2(255),
  Reciclatge varchar2(255),
  Descompte number(10) CHECK (Descompte in (3, 7, 10))
);


CREATE TABLE Detalls_factura (
  ID number(10) PRIMARY KEY,
  Quantitat number(10),
  Preu_final number(10),
  ID_Producte number(10),
  ID_Factura number(10)
);


CREATE TABLE Client (
  Nom varchar2(255),
  Nom_comercial varchar2(255),
  Poblacio varchar2(255),
  Direccio varchar2(255),
  CIF varchar2(255) NOT NULL UNIQUE,
  Telefon_contacte number(10),
  ID number(10) PRIMARY KEY
);


CREATE TABLE Treballador (
  NSS number(11) PRIMARY KEY,
  DNI varchar2(255) NOT NULL UNIQUE,
  Nom varchar2(255),
  Data_incorporacio timestamp(0),
  Telefon number(9)
);


CREATE TABLE Nomina (
  Sou number(10),
  Data_nomina timestamp(0),
  Any_nomina number(4),
  Treballador_NSS number(11),
  ID number(10) PRIMARY KEY
);


