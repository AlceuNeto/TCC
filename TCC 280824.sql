
CREATE DATABASE TCCPASTEL;
USE TCCPASTEL;

CREATE TABLE CLIENTES(
COD_CLIENTE INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
NOME_CLIENTE VARCHAR(50) NOT  NULL,
END_CLIENTE VARCHAR(200) NOT NULL,
TEL_CLIENTE CHAR(11) NULL,
MAIL_CLIENTE VARCHAR(50)
)Engine=InnoDB;

CREATE TABLE PRODUTOS(
COD_PRODUTO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOME_PRODUTO VARCHAR(50) NOT NULL,
PRECO_PRODUTO DEC(5,2) NOT NULL,
DESC_PRODUTO VARCHAR(200) NULL

)Engine=InnoDB;

CREATE TABLE PEDIDOS(

COD_PEDIDO INT PRIMARY KEY NOT NULL,
DATA_PEDIDO DATETIME NOT NULL,
FK_CLIENTE INT NOT NULL,
ENDERECO VARCHAR(50) NOT NULL,
FOREIGN KEY(FK_CLIENTE) REFERENCES CLIENTES(COD_CLIENTE),
STATUS_PEDIDO VARCHAR(11) NOT NULL,
PAG_PEDIDO VARCHAR(20) NOT NULL,
TOTAL_PEDIDO DEC(5,2) NOT NULL
)Engine=InnoDB;

CREATE TABLE PRODUTO_PEDIDO(
FK_PRODUTO INT NOT NULL, FOREIGN KEY(FK_PRODUTO) REFERENCES PRODUTOS(COD_PRODUTO),
SUBTOTAL DEC(5,2) NOT NULL,
FK_PEDIDO INT NOT NULL, FOREIGN KEY(FK_PEDIDO) REFERENCES PEDIDOS(COD_PEDIDO),
PRIMARY KEY (FK_PEDIDO,FK_PRODUTO),
QTD_PRODUTOS INT NOT NULL
)Engine=InnoDB;

CREATE TABLE ENTREGAS(
COD_ENTREGA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FINALIZADO BOOLEAN NOT NULL,
FK_PEDIDO INT NOT NULL, FOREIGN KEY(FK_PEDIDO) REFERENCES  PEDIDOS(COD_PEDIDO),
RETIRAR_LOCAL BOOLEAN NOT NULL

)Engine=InnoDB;
