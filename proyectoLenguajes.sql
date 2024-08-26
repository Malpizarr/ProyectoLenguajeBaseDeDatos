--------------------------------------------------------
--  File created - Sunday-August-25-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CATEGORIA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MALPZ"."CATEGORIA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DETALLES_PEDIDOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MALPZ"."DETALLES_PEDIDOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence INVENTARIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MALPZ"."INVENTARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PEDIDO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MALPZ"."PEDIDO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 52 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MALPZ"."PRODUCTOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_DIRECCION_ID
--------------------------------------------------------

   CREATE SEQUENCE  "MALPZ"."SEQ_DIRECCION_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ID_MENSAJES_CONTACTO
--------------------------------------------------------

   CREATE SEQUENCE  "MALPZ"."SEQ_ID_MENSAJES_CONTACTO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USUARIOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MALPZ"."USUARIOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 13 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CATEGORIAS_PRODUCTOS
--------------------------------------------------------

  CREATE TABLE "MALPZ"."CATEGORIAS_PRODUCTOS" 
   (	"ID_CATEGORIA" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" CLOB, 
	"FECHA_CREACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPCION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table DETALLES_PEDIDOS
--------------------------------------------------------

  CREATE TABLE "MALPZ"."DETALLES_PEDIDOS" 
   (	"ID_DETALLE" NUMBER(*,0), 
	"ID_PEDIDO" NUMBER(*,0), 
	"ID_PRODUCTO" NUMBER(*,0), 
	"CANTIDAD" NUMBER(*,0), 
	"PRECIO" NUMBER(10,2), 
	"FECHA_CREACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DIRECCIONES_USUARIOS
--------------------------------------------------------

  CREATE TABLE "MALPZ"."DIRECCIONES_USUARIOS" 
   (	"ID_DIRECCION" NUMBER(*,0), 
	"ID_USUARIO" NUMBER(*,0), 
	"DIRECCION_LINEA1" VARCHAR2(255 BYTE), 
	"DIRECCION_LINEA2" VARCHAR2(255 BYTE), 
	"CIUDAD" VARCHAR2(100 BYTE), 
	"ESTADO" VARCHAR2(100 BYTE), 
	"CODIGO_POSTAL" VARCHAR2(20 BYTE), 
	"PAIS" VARCHAR2(100 BYTE), 
	"FECHA_CREACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ESTADOS_PEDIDOS
--------------------------------------------------------

  CREATE TABLE "MALPZ"."ESTADOS_PEDIDOS" 
   (	"ID_ESTADO" NUMBER(*,0), 
	"NOMBRE_ESTADO" VARCHAR2(100 BYTE), 
	"DESCRIPCION" CLOB, 
	"FECHA_CREACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPCION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table INVENTARIO
--------------------------------------------------------

  CREATE TABLE "MALPZ"."INVENTARIO" 
   (	"ID_INVENTARIO" NUMBER(*,0), 
	"ID_PRODUCTO" NUMBER(*,0), 
	"CANTIDAD" NUMBER(*,0), 
	"ULTIMA_ACTUALIZACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MENSAJES_CONTACTO
--------------------------------------------------------

  CREATE TABLE "MALPZ"."MENSAJES_CONTACTO" 
   (	"ID_MENSAJE" NUMBER(*,0), 
	"ID_USUARIO" NUMBER(*,0), 
	"MENSAJE" CLOB, 
	"FECHA_CREACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("MENSAJE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table PEDIDOS
--------------------------------------------------------

  CREATE TABLE "MALPZ"."PEDIDOS" 
   (	"ID_PEDIDO" NUMBER(*,0), 
	"ID_USUARIO" NUMBER(*,0), 
	"ID_DIRECCION" NUMBER(*,0), 
	"TOTAL" NUMBER(10,2), 
	"ID_ESTADO" NUMBER(*,0), 
	"FECHA_CREACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTOS
--------------------------------------------------------

  CREATE TABLE "MALPZ"."PRODUCTOS" 
   (	"ID_PRODUCTO" NUMBER(*,0), 
	"ID_CATEGORIA" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" CLOB, 
	"PRECIO" NUMBER(10,2), 
	"FECHA_CREACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPCION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table USUARIOS
--------------------------------------------------------

  CREATE TABLE "MALPZ"."USUARIOS" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"NOMBRE_USUARIO" VARCHAR2(100 BYTE), 
	"CONTRASENA" VARCHAR2(100 BYTE), 
	"CORREO_ELECTRONICO" VARCHAR2(100 BYTE), 
	"ROL" VARCHAR2(50 BYTE), 
	"FECHA_CREACION" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View VISTA_CATEGORIAS_PRODUCTOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_CATEGORIAS_PRODUCTOS" ("ID_CATEGORIA", "CATEGORIA", "PRODUCTO", "PRECIO") AS 
  SELECT c.id_categoria, c.nombre AS categoria, p.nombre AS producto, p.precio
FROM categorias_productos c
         JOIN productos p ON c.id_categoria = p.id_categoria
;
--------------------------------------------------------
--  DDL for View VISTA_DETALLES_PEDIDOS_PRODUCTOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_DETALLES_PEDIDOS_PRODUCTOS" ("ID_DETALLE", "PRODUCTO", "CANTIDAD", "PRECIO") AS 
  SELECT d.id_detalle, p.nombre AS producto, d.cantidad, d.precio
FROM detalles_pedidos d
         JOIN productos p ON d.id_producto = p.id_producto
;
--------------------------------------------------------
--  DDL for View VISTA_INVENTARIO_PRODUCTOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_INVENTARIO_PRODUCTOS" ("ID_INVENTARIO", "PRODUCTO", "CANTIDAD", "ULTIMA_ACTUALIZACION") AS 
  SELECT i.id_inventario, p.nombre AS producto, i.cantidad, i.ultima_actualizacion
FROM inventario i
         JOIN productos p ON i.id_producto = p.id_producto
;
--------------------------------------------------------
--  DDL for View VISTA_MENSAJES_CONTACTO_USUARIOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_MENSAJES_CONTACTO_USUARIOS" ("ID_MENSAJE", "NOMBRE_USUARIO", "MENSAJE", "FECHA_CREACION") AS 
  SELECT m.id_mensaje, u.nombre_usuario, m.mensaje, m.fecha_creacion
FROM mensajes_contacto m
         JOIN usuarios u ON m.id_usuario = u.id_usuario
;
--------------------------------------------------------
--  DDL for View VISTA_PEDIDOS_POR_ESTADO
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_PEDIDOS_POR_ESTADO" ("ID_PEDIDO", "TOTAL", "NOMBRE_ESTADO") AS 
  SELECT p.id_pedido, p.total, e.nombre_estado
FROM pedidos p
         JOIN estados_pedidos e ON p.id_estado = e.id_estado
;
--------------------------------------------------------
--  DDL for View VISTA_PEDIDOS_USUARIOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_PEDIDOS_USUARIOS" ("ID_PEDIDO", "NOMBRE_USUARIO", "TOTAL", "FECHA_CREACION") AS 
  SELECT p.id_pedido, u.nombre_usuario, p.total, p.fecha_creacion
FROM pedidos p
         JOIN usuarios u ON p.id_usuario = u.id_usuario
;
--------------------------------------------------------
--  DDL for View VISTA_PRODUCTOS_CATEGORIAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_PRODUCTOS_CATEGORIAS" ("ID_PRODUCTO", "NOMBRE", "CATEGORIA", "PRECIO") AS 
  SELECT p.id_producto, p.nombre, c.nombre AS categoria, p.precio
FROM productos p
         JOIN categorias_productos c ON p.id_categoria = c.id_categoria
;
--------------------------------------------------------
--  DDL for View VISTA_TODOS_ESTADOS_PEDIDOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_TODOS_ESTADOS_PEDIDOS" ("ID_ESTADO", "NOMBRE_ESTADO", "DESCRIPCION", "ID_PEDIDO", "TOTAL", "FECHA_CREACION") AS 
  SELECT e.id_estado, e.nombre_estado, e.descripcion, p.id_pedido, p.total, p.fecha_creacion
FROM estados_pedidos e
         LEFT JOIN pedidos p ON e.id_estado = p.id_estado
;
--------------------------------------------------------
--  DDL for View VISTA_USUARIOS_DIRECCIONES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_USUARIOS_DIRECCIONES" ("ID_USUARIO", "NOMBRE_USUARIO", "DIRECCION_LINEA1", "CIUDAD", "ESTADO", "PAIS") AS 
  SELECT u.id_usuario, u.nombre_usuario, d.direccion_linea1, d.ciudad, d.estado, d.pais
FROM usuarios u
         JOIN direcciones_usuarios d ON u.id_usuario = d.id_usuario
;
--------------------------------------------------------
--  DDL for View VISTA_USUARIOS_PEDIDOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MALPZ"."VISTA_USUARIOS_PEDIDOS" ("ID_USUARIO", "NOMBRE_USUARIO", "ID_PEDIDO", "TOTAL", "FECHA_CREACION") AS 
  SELECT u.id_usuario, u.nombre_usuario, p.id_pedido, p.total, p.fecha_creacion
FROM usuarios u
         JOIN pedidos p ON u.id_usuario = p.id_usuario
;
REM INSERTING into MALPZ.CATEGORIAS_PRODUCTOS
SET DEFINE OFF;
Insert into MALPZ.CATEGORIAS_PRODUCTOS (ID_CATEGORIA,NOMBRE,FECHA_CREACION) values (30,'Electrónica',to_timestamp('20-JUL-24 05.23.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into MALPZ.DETALLES_PEDIDOS
SET DEFINE OFF;
Insert into MALPZ.DETALLES_PEDIDOS (ID_DETALLE,ID_PEDIDO,ID_PRODUCTO,CANTIDAD,PRECIO,FECHA_CREACION) values (8,50,30,1,300,to_timestamp('25-AUG-24 01.55.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.DETALLES_PEDIDOS (ID_DETALLE,ID_PEDIDO,ID_PRODUCTO,CANTIDAD,PRECIO,FECHA_CREACION) values (10,51,4,1,123,to_timestamp('25-AUG-24 01.55.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.DETALLES_PEDIDOS (ID_DETALLE,ID_PEDIDO,ID_PRODUCTO,CANTIDAD,PRECIO,FECHA_CREACION) values (32,22,30,2,299,null);
Insert into MALPZ.DETALLES_PEDIDOS (ID_DETALLE,ID_PEDIDO,ID_PRODUCTO,CANTIDAD,PRECIO,FECHA_CREACION) values (5,45,4,1,123,to_timestamp('25-AUG-24 01.28.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.DETALLES_PEDIDOS (ID_DETALLE,ID_PEDIDO,ID_PRODUCTO,CANTIDAD,PRECIO,FECHA_CREACION) values (9,51,30,2,300,to_timestamp('25-AUG-24 01.55.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.DETALLES_PEDIDOS (ID_DETALLE,ID_PEDIDO,ID_PRODUCTO,CANTIDAD,PRECIO,FECHA_CREACION) values (6,45,30,2,300,to_timestamp('25-AUG-24 01.28.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.DETALLES_PEDIDOS (ID_DETALLE,ID_PEDIDO,ID_PRODUCTO,CANTIDAD,PRECIO,FECHA_CREACION) values (7,50,4,1,123,to_timestamp('25-AUG-24 01.55.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into MALPZ.DIRECCIONES_USUARIOS
SET DEFINE OFF;
Insert into MALPZ.DIRECCIONES_USUARIOS (ID_DIRECCION,ID_USUARIO,DIRECCION_LINEA1,DIRECCION_LINEA2,CIUDAD,ESTADO,CODIGO_POSTAL,PAIS,FECHA_CREACION) values (30,30,'Calle 123','Apt 4','Ciudad','Estado','12345','País',to_timestamp('20-JUL-24 05.23.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into MALPZ.ESTADOS_PEDIDOS
SET DEFINE OFF;
Insert into MALPZ.ESTADOS_PEDIDOS (ID_ESTADO,NOMBRE_ESTADO,FECHA_CREACION) values (30,'Pendiente',to_timestamp('20-JUL-24 05.23.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into MALPZ.INVENTARIO
SET DEFINE OFF;
Insert into MALPZ.INVENTARIO (ID_INVENTARIO,ID_PRODUCTO,CANTIDAD,ULTIMA_ACTUALIZACION) values (2,30,50000,to_timestamp('25-AUG-24 02.36.38.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.INVENTARIO (ID_INVENTARIO,ID_PRODUCTO,CANTIDAD,ULTIMA_ACTUALIZACION) values (4,4,123,to_timestamp('25-AUG-24 02.44.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into MALPZ.MENSAJES_CONTACTO
SET DEFINE OFF;
Insert into MALPZ.MENSAJES_CONTACTO (ID_MENSAJE,ID_USUARIO,FECHA_CREACION) values (3,30,to_timestamp('22-JUL-24 05.48.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.MENSAJES_CONTACTO (ID_MENSAJE,ID_USUARIO,FECHA_CREACION) values (2,30,to_timestamp('20-JUL-24 05.23.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into MALPZ.PEDIDOS
SET DEFINE OFF;
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (27,30,30,1023,30,to_timestamp('25-AUG-24 12.56.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (28,30,30,1023,30,to_timestamp('25-AUG-24 12.56.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (29,30,30,1023,30,to_timestamp('25-AUG-24 12.57.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (22,30,30,599.98,30,to_timestamp('20-JUL-24 05.23.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (30,30,30,1023,30,to_timestamp('25-AUG-24 12.58.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (32,30,30,1023,30,to_timestamp('25-AUG-24 01.00.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (33,30,30,1023,30,to_timestamp('25-AUG-24 01.10.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (34,7,30,1023,30,to_timestamp('25-AUG-24 01.11.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (35,7,30,1023,30,to_timestamp('25-AUG-24 01.12.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (31,30,30,1023,30,to_timestamp('25-AUG-24 01.00.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (36,7,30,1023,30,to_timestamp('25-AUG-24 01.18.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (37,7,30,423,30,to_timestamp('25-AUG-24 01.20.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (38,7,30,300,30,to_timestamp('25-AUG-24 01.21.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (39,7,30,300,30,to_timestamp('25-AUG-24 01.22.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (40,7,30,300,30,to_timestamp('25-AUG-24 01.22.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (41,7,30,300,30,to_timestamp('25-AUG-24 01.22.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (42,7,30,300,30,to_timestamp('25-AUG-24 01.23.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (43,7,30,300,30,to_timestamp('25-AUG-24 01.27.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (44,7,30,723,30,to_timestamp('25-AUG-24 01.28.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (45,7,30,723,30,to_timestamp('25-AUG-24 01.28.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (50,7,30,423,30,to_timestamp('25-AUG-24 01.55.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PEDIDOS (ID_PEDIDO,ID_USUARIO,ID_DIRECCION,TOTAL,ID_ESTADO,FECHA_CREACION) values (51,7,30,723,30,to_timestamp('25-AUG-24 01.55.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into MALPZ.PRODUCTOS
SET DEFINE OFF;
Insert into MALPZ.PRODUCTOS (ID_PRODUCTO,ID_CATEGORIA,NOMBRE,PRECIO,FECHA_CREACION) values (30,30,'Taladro',300,to_timestamp('20-JUL-24 05.23.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.PRODUCTOS (ID_PRODUCTO,ID_CATEGORIA,NOMBRE,PRECIO,FECHA_CREACION) values (4,30,'123',123,to_timestamp('25-AUG-24 12.17.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into MALPZ.USUARIOS
SET DEFINE OFF;
Insert into MALPZ.USUARIOS (ID_USUARIO,NOMBRE_USUARIO,CONTRASENA,CORREO_ELECTRONICO,ROL,FECHA_CREACION) values (12,'12312321','123','2@2.com','cliente',to_timestamp('25-AUG-24 12.25.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.USUARIOS (ID_USUARIO,NOMBRE_USUARIO,CONTRASENA,CORREO_ELECTRONICO,ROL,FECHA_CREACION) values (30,'malpzz','123','1@11','admin',to_timestamp('20-JUL-24 05.23.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into MALPZ.USUARIOS (ID_USUARIO,NOMBRE_USUARIO,CONTRASENA,CORREO_ELECTRONICO,ROL,FECHA_CREACION) values (7,'gpt3','123','1@2.com','cliente',to_timestamp('25-AUG-24 12.17.44.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
--------------------------------------------------------
--  DDL for Index UNIQUE_NOMBRE_USUARIO
--------------------------------------------------------

  CREATE UNIQUE INDEX "MALPZ"."UNIQUE_NOMBRE_USUARIO" ON "MALPZ"."USUARIOS" ("NOMBRE_USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TBS_PACIENTES" ;
--------------------------------------------------------
--  DDL for Trigger INVENTARIO_BI
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "MALPZ"."INVENTARIO_BI" 
    BEFORE INSERT ON INVENTARIO
    FOR EACH ROW
BEGIN
    :NEW.ID_INVENTARIO := INVENTARIO_SEQ.NEXTVAL;
END;
/
ALTER TRIGGER "MALPZ"."INVENTARIO_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PEDIDO_BI
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "MALPZ"."PEDIDO_BI" 
    BEFORE INSERT ON pedidos
    FOR EACH ROW
BEGIN
    :NEW.id_pedido := pedido_seq.NEXTVAL;
END;
/
ALTER TRIGGER "MALPZ"."PEDIDO_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_ID_MENSAJES_CONTACTO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "MALPZ"."TRG_ID_MENSAJES_CONTACTO" 
    BEFORE INSERT ON MENSAJES_CONTACTO
    FOR EACH ROW
BEGIN
    :NEW.ID_MENSAJE := SEQ_ID_MENSAJES_CONTACTO.NEXTVAL;
END;
/
ALTER TRIGGER "MALPZ"."TRG_ID_MENSAJES_CONTACTO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_ACTUALIZAR_FECHA_CREACION_DIRECCION
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_FECHA_CREACION_DIRECCION" 
    BEFORE INSERT ON direcciones_usuarios
    FOR EACH ROW
BEGIN
    :NEW.fecha_creacion := SYSDATE;
END trigger_actualizar_fecha_creacion_direccion;
/
ALTER TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_FECHA_CREACION_DIRECCION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_ACTUALIZAR_FECHA_CREACION_MENSAJE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_FECHA_CREACION_MENSAJE" 
    BEFORE INSERT ON mensajes_contacto
    FOR EACH ROW
BEGIN
    :NEW.fecha_creacion := SYSDATE;
END trigger_actualizar_fecha_creacion_mensaje;
/
ALTER TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_FECHA_CREACION_MENSAJE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_ACTUALIZAR_FECHA_CREACION_PEDIDO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_FECHA_CREACION_PEDIDO" 
    BEFORE INSERT ON pedidos
    FOR EACH ROW
BEGIN
    :NEW.fecha_creacion := SYSDATE;
END trigger_actualizar_fecha_creacion_pedido;
/
ALTER TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_FECHA_CREACION_PEDIDO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_ACTUALIZAR_FECHA_CREACION_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_FECHA_CREACION_USUARIO" 
    BEFORE INSERT ON usuarios
    FOR EACH ROW
BEGIN
    :NEW.fecha_creacion := SYSDATE;
END trigger_actualizar_fecha_creacion_usuario;
/
ALTER TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_FECHA_CREACION_USUARIO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_ACTUALIZAR_ULTIMA_ACTUALIZACION_INVENTARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_ULTIMA_ACTUALIZACION_INVENTARIO" 
    BEFORE UPDATE ON inventario
    FOR EACH ROW
BEGIN
    :NEW.ultima_actualizacion := SYSDATE;
END trigger_actualizar_ultima_actualizacion_inventario;
/
ALTER TRIGGER "MALPZ"."TRIGGER_ACTUALIZAR_ULTIMA_ACTUALIZACION_INVENTARIO" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_CATEGORIA_PRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_CATEGORIA_PRODUCTO" (
    p_id_categoria IN INTEGER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB
) AS
BEGIN
    UPDATE categorias_productos
    SET nombre = p_nombre,
        descripcion = p_descripcion
    WHERE id_categoria = p_id_categoria;
END actualizar_categoria_producto;


/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_DETALLE_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_DETALLE_PEDIDO" (
    p_id_detalle IN INTEGER,
    p_id_pedido IN INTEGER,
    p_id_producto IN INTEGER,
    p_cantidad IN INTEGER,
    p_precio IN DECIMAL
) AS
BEGIN
    UPDATE detalles_pedidos
    SET id_pedido = p_id_pedido,
        id_producto = p_id_producto,
        cantidad = p_cantidad,
        precio = p_precio
    WHERE id_detalle = p_id_detalle;
END actualizar_detalle_pedido;


/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_DIRECCION_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_DIRECCION_USUARIO" (
    p_id_direccion IN INTEGER,
    p_id_usuario IN INTEGER,
    p_direccion_linea1 IN VARCHAR2,
    p_direccion_linea2 IN VARCHAR2,
    p_ciudad IN VARCHAR2,
    p_estado IN VARCHAR2,
    p_codigo_postal IN VARCHAR2,
    p_pais IN VARCHAR2
) AS
BEGIN
    UPDATE direcciones_usuarios
    SET id_usuario = p_id_usuario,
        direccion_linea1 = p_direccion_linea1,
        direccion_linea2 = p_direccion_linea2,
        ciudad = p_ciudad,
        estado = p_estado,
        codigo_postal = p_codigo_postal,
        pais = p_pais
    WHERE id_direccion = p_id_direccion;
END actualizar_direccion_usuario;


/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_ESTADO_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_ESTADO_PEDIDO" (
    p_id_pedido IN INTEGER,
    p_id_estado IN INTEGER
) AS
BEGIN
    UPDATE pedidos
    SET id_estado = p_id_estado
    WHERE id_pedido = p_id_pedido;
END actualizar_estado_pedido;


/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_INVENTARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_INVENTARIO" (
    p_id_inventario IN INTEGER,
    p_id_producto IN INTEGER,
    p_cantidad IN INTEGER
) AS
BEGIN
    UPDATE inventario
    SET id_producto = p_id_producto,
        cantidad = p_cantidad,
        ultima_actualizacion = SYSDATE
    WHERE id_inventario = p_id_inventario;
END actualizar_inventario;


/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_MENSAJE_CONTACTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_MENSAJE_CONTACTO" (
    p_id_mensaje IN INTEGER,
    p_id_usuario IN INTEGER,
    p_mensaje IN CLOB
) AS
BEGIN
    UPDATE mensajes_contacto
    SET id_usuario = p_id_usuario,
        mensaje = p_mensaje
    WHERE id_mensaje = p_id_mensaje;
END actualizar_mensaje_contacto;


/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_PEDIDO" (
    p_id_pedido IN INTEGER,
    p_id_usuario IN INTEGER,
    p_id_direccion IN INTEGER,
    p_total IN DECIMAL,
    p_id_estado IN INTEGER
) AS
BEGIN
    UPDATE pedidos
    SET id_usuario = p_id_usuario,
        id_direccion = p_id_direccion,
        total = p_total,
        id_estado = p_id_estado
    WHERE id_pedido = p_id_pedido;
END actualizar_pedido;


/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_PRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_PRODUCTO" (
    p_id_producto IN INTEGER,
    p_id_categoria IN INTEGER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN DECIMAL
) AS
    v_count INTEGER;
BEGIN
    -- Verificar que el ID de categoría existe
    SELECT COUNT(*)
    INTO v_count
    FROM categorias_productos
    WHERE id_categoria = p_id_categoria;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID de categoría no encontrado.');
    END IF;

    -- Actualización del producto
    UPDATE productos
    SET id_categoria = p_id_categoria,
        nombre = p_nombre,
        descripcion = p_descripcion,
        precio = p_precio
    WHERE id_producto = p_id_producto;
END ACTUALIZAR_PRODUCTO;

/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ACTUALIZAR_USUARIO" (
    p_id_usuario IN INTEGER,
    p_nombre_usuario IN VARCHAR2,
    p_contrasena IN VARCHAR2,
    p_correo_electronico IN VARCHAR2,
    p_rol IN VARCHAR2
) AS
BEGIN
    UPDATE usuarios
    SET nombre_usuario = p_nombre_usuario,
        contrasena = p_contrasena,
        correo_electronico = p_correo_electronico,
        rol = p_rol
    WHERE id_usuario = p_id_usuario;
END actualizar_usuario;

/
--------------------------------------------------------
--  DDL for Procedure AUMENTAR_CANTIDAD_INVENTARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."AUMENTAR_CANTIDAD_INVENTARIO" (
    p_id_producto IN INTEGER,
    p_cantidad_adicional IN INTEGER
) AS
BEGIN
    UPDATE inventario
    SET cantidad = cantidad + p_cantidad_adicional,
        ultima_actualizacion = SYSDATE
    WHERE id_producto = p_id_producto;
END aumentar_cantidad_inventario;


/
--------------------------------------------------------
--  DDL for Procedure CREAR_CATEGORIA_PRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_CATEGORIA_PRODUCTO" (
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB
) AS
BEGIN
    INSERT INTO categorias_productos (nombre, descripcion, fecha_creacion)
    VALUES (p_nombre, p_descripcion, SYSDATE);
END crear_categoria_producto;

/
--------------------------------------------------------
--  DDL for Procedure CREAR_DETALLE_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_DETALLE_PEDIDO" (
    p_id_pedido IN INTEGER,
    p_id_producto IN INTEGER,
    p_cantidad IN INTEGER,
    p_precio IN DECIMAL
) AS
BEGIN
    INSERT INTO detalles_pedidos (id_detalle, id_pedido, id_producto, cantidad, precio, fecha_creacion)
    VALUES (DETALLES_PEDIDOS_SEQ.NEXTVAL, p_id_pedido, p_id_producto, p_cantidad, p_precio, SYSDATE);
END CREAR_DETALLE_PEDIDO;

/
--------------------------------------------------------
--  DDL for Procedure CREAR_DIRECCION_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_DIRECCION_USUARIO" (
    p_id_usuario IN INTEGER,
    p_direccion_linea1 IN VARCHAR2,
    p_direccion_linea2 IN VARCHAR2,
    p_ciudad IN VARCHAR2,
    p_estado IN VARCHAR2,
    p_codigo_postal IN VARCHAR2,
    p_pais IN VARCHAR2
) AS
BEGIN
    INSERT INTO direcciones_usuarios (id_usuario, direccion_linea1, direccion_linea2, ciudad, estado, codigo_postal, pais, fecha_creacion)
    VALUES (p_id_usuario, p_direccion_linea1, p_direccion_linea2, p_ciudad, p_estado, p_codigo_postal, p_pais, SYSDATE);
END crear_direccion_usuario;


/
--------------------------------------------------------
--  DDL for Procedure CREAR_ESTADO_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_ESTADO_PEDIDO" (
    p_nombre_estado IN VARCHAR2,
    p_descripcion IN CLOB
) AS
BEGIN
    INSERT INTO estados_pedidos (nombre_estado, descripcion, fecha_creacion)
    VALUES (p_nombre_estado, p_descripcion, SYSDATE);
END crear_estado_pedido;


/
--------------------------------------------------------
--  DDL for Procedure CREAR_INVENTARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_INVENTARIO" (
    p_id_producto IN INTEGER,
    p_cantidad IN INTEGER
) AS
BEGIN
    INSERT INTO inventario (id_producto, cantidad, ultima_actualizacion)
    VALUES (p_id_producto, p_cantidad, SYSDATE);
END crear_inventario;


/
--------------------------------------------------------
--  DDL for Procedure CREAR_MENSAJE_CONTACTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_MENSAJE_CONTACTO" (
    p_id_usuario IN INTEGER,
    p_mensaje IN CLOB
) AS
BEGIN
    INSERT INTO mensajes_contacto (id_usuario, mensaje, fecha_creacion)
    VALUES (p_id_usuario, p_mensaje, SYSDATE);
END crear_mensaje_contacto;


/
--------------------------------------------------------
--  DDL for Procedure CREAR_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_PEDIDO" (
    p_id_usuario IN INTEGER,
    p_id_direccion IN INTEGER,
    p_total IN DECIMAL,
    p_id_estado IN INTEGER
) AS
BEGIN
    INSERT INTO pedidos (id_usuario, id_direccion, total, id_estado, fecha_creacion)
    VALUES (p_id_usuario, p_id_direccion, p_total, p_id_estado, SYSDATE);
END crear_pedido;


/
--------------------------------------------------------
--  DDL for Procedure CREAR_PRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_PRODUCTO" (
    p_id_categoria IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN CLOB,
    p_precio IN NUMBER
) AS
BEGIN
    INSERT INTO productos (id_producto, id_categoria, nombre, descripcion, precio, fecha_creacion)
    VALUES (productos_seq.NEXTVAL, p_id_categoria, p_nombre, p_descripcion, p_precio, SYSDATE);
END crear_producto;

/
--------------------------------------------------------
--  DDL for Procedure CREAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."CREAR_USUARIO" (
    p_nombre_usuario IN VARCHAR2,
    p_contrasena IN VARCHAR2,
    p_correo_electronico IN VARCHAR2
) AS
BEGIN
    INSERT INTO usuarios (id_usuario, nombre_usuario, contrasena, correo_electronico, rol, fecha_creacion)
    VALUES (USUARIOS_SEQ.NEXTVAL, p_nombre_usuario, p_contrasena, p_correo_electronico, 'cliente', SYSDATE);
END CREAR_USUARIO;

/
--------------------------------------------------------
--  DDL for Procedure DISMINUIR_CANTIDAD_INVENTARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."DISMINUIR_CANTIDAD_INVENTARIO" (
    p_id_producto IN INTEGER,
    p_cantidad_disminuir IN INTEGER
) AS
BEGIN
    UPDATE inventario
    SET cantidad = cantidad - p_cantidad_disminuir,
        ultima_actualizacion = SYSDATE
    WHERE id_producto = p_id_producto;
END disminuir_cantidad_inventario;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_CATEGORIA_PRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_CATEGORIA_PRODUCTO" (
    p_id_categoria IN INTEGER
) AS
BEGIN
    DELETE FROM categorias_productos WHERE id_categoria = p_id_categoria;
END eliminar_categoria_producto;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_DETALLE_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_DETALLE_PEDIDO" (
    p_id_detalle IN INTEGER
) AS
BEGIN
    DELETE FROM detalles_pedidos WHERE id_detalle = p_id_detalle;
END eliminar_detalle_pedido;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_DIRECCION_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_DIRECCION_USUARIO" (
    p_id_direccion IN INTEGER
) AS
BEGIN
    DELETE FROM direcciones_usuarios WHERE id_direccion = p_id_direccion;
END eliminar_direccion_usuario;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_ESTADO_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_ESTADO_PEDIDO" (
    p_id_estado IN INTEGER
) AS
BEGIN
    DELETE FROM estados_pedidos WHERE id_estado = p_id_estado;
END eliminar_estado_pedido;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_INVENTARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_INVENTARIO" (
    p_id_inventario IN INTEGER
) AS
BEGIN
    DELETE FROM inventario WHERE id_inventario = p_id_inventario;
END eliminar_inventario;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_MENSAJE_CONTACTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_MENSAJE_CONTACTO" (
    p_id_mensaje IN INTEGER
) AS
BEGIN
    DELETE FROM mensajes_contacto WHERE id_mensaje = p_id_mensaje;
END eliminar_mensaje_contacto;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_PEDIDO" (
    p_id_pedido IN INTEGER
) AS
BEGIN
    DELETE FROM pedidos WHERE id_pedido = p_id_pedido;
END eliminar_pedido;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_PRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_PRODUCTO" (
    p_id_producto IN INTEGER
) AS
BEGIN
    DELETE FROM productos WHERE id_producto = p_id_producto;
END eliminar_producto;


/
--------------------------------------------------------
--  DDL for Procedure ELIMINAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."ELIMINAR_USUARIO" (
    p_id_usuario IN INTEGER
) AS
BEGIN
    DELETE FROM usuarios WHERE id_usuario = p_id_usuario;
END eliminar_usuario;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_DETALLES_POR_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_DETALLES_POR_PEDIDO" (
    p_id_pedido IN INTEGER
) IS
    CURSOR cur_detalles IS SELECT * FROM detalles_pedidos WHERE id_pedido = p_id_pedido;
    v_detalle detalles_pedidos%ROWTYPE;
BEGIN
    OPEN cur_detalles;
    LOOP
        FETCH cur_detalles INTO v_detalle;
        EXIT WHEN cur_detalles%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_detalle.id_detalle || ' Cantidad: ' || v_detalle.cantidad);
    END LOOP;
    CLOSE cur_detalles;
END listar_detalles_por_pedido;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_DIRECCIONES_POR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_DIRECCIONES_POR_USUARIO" (
    p_id_usuario IN INTEGER
) IS
    CURSOR cur_direcciones IS SELECT * FROM direcciones_usuarios WHERE id_usuario = p_id_usuario;
    v_direccion direcciones_usuarios%ROWTYPE;
BEGIN
    OPEN cur_direcciones;
    LOOP
        FETCH cur_direcciones INTO v_direccion;
        EXIT WHEN cur_direcciones%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_direccion.id_direccion || ' Dirección: ' || v_direccion.direccion_linea1);
    END LOOP;
    CLOSE cur_direcciones;
END listar_direcciones_por_usuario;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_MENSAJES_POR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_MENSAJES_POR_USUARIO" (
    p_id_usuario IN INTEGER
) IS
    CURSOR cur_mensajes IS SELECT * FROM mensajes_contacto WHERE id_usuario = p_id_usuario;
    v_mensaje mensajes_contacto%ROWTYPE;
BEGIN
    OPEN cur_mensajes;
    LOOP
        FETCH cur_mensajes INTO v_mensaje;
        EXIT WHEN cur_mensajes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_mensaje.id_mensaje || ' Mensaje: ' || v_mensaje.mensaje);
    END LOOP;
    CLOSE cur_mensajes;
END listar_mensajes_por_usuario;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_PEDIDOS_POR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_PEDIDOS_POR_USUARIO" (
    p_id_usuario IN INTEGER
) IS
    CURSOR cur_pedidos IS SELECT * FROM pedidos WHERE id_usuario = p_id_usuario;
    v_pedido pedidos%ROWTYPE;
BEGIN
    OPEN cur_pedidos;
    LOOP
        FETCH cur_pedidos INTO v_pedido;
        EXIT WHEN cur_pedidos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_pedido.id_pedido || ' Total: ' || v_pedido.total);
    END LOOP;
    CLOSE cur_pedidos;
END listar_pedidos_por_usuario;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_PRODUCTOS_EN_INVENTARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_PRODUCTOS_EN_INVENTARIO" IS
    CURSOR cur_inventarios IS SELECT * FROM inventario;
    v_inventario inventario%ROWTYPE;
BEGIN
    OPEN cur_inventarios;
    LOOP
        FETCH cur_inventarios INTO v_inventario;
        EXIT WHEN cur_inventarios%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_inventario.id_inventario || ' Cantidad: ' || v_inventario.cantidad);
    END LOOP;
    CLOSE cur_inventarios;
END listar_productos_en_inventario;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_PRODUCTOS_POR_CATEGORIA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_PRODUCTOS_POR_CATEGORIA" (
    p_id_categoria IN INTEGER
) IS
    CURSOR cur_productos IS SELECT * FROM productos WHERE id_categoria = p_id_categoria;
    v_producto productos%ROWTYPE;
BEGIN
    OPEN cur_productos;
    LOOP
        FETCH cur_productos INTO v_producto;
        EXIT WHEN cur_productos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_producto.id_producto || ' Nombre: ' || v_producto.nombre);
    END LOOP;
    CLOSE cur_productos;
END listar_productos_por_categoria;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODAS_LAS_CATEGORIAS_PRODUCTOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODAS_LAS_CATEGORIAS_PRODUCTOS" (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT id_categoria, nombre, descripcion, fecha_creacion
        FROM categorias_productos;
END LISTAR_TODAS_LAS_CATEGORIAS_PRODUCTOS;

/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODAS_LAS_DIRECCIONES_USUARIOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODAS_LAS_DIRECCIONES_USUARIOS" IS
    CURSOR cur_direcciones IS SELECT * FROM direcciones_usuarios;
    v_direccion direcciones_usuarios%ROWTYPE;
BEGIN
    OPEN cur_direcciones;
    LOOP
        FETCH cur_direcciones INTO v_direccion;
        EXIT WHEN cur_direcciones%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_direccion.id_direccion || ' Dirección: ' || v_direccion.direccion_linea1);
    END LOOP;
    CLOSE cur_direcciones;
END listar_todas_las_direcciones_usuarios;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODOS_LOS_DETALLES_PEDIDOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODOS_LOS_DETALLES_PEDIDOS" IS
    CURSOR cur_detalles IS SELECT * FROM detalles_pedidos;
    v_detalle detalles_pedidos%ROWTYPE;
BEGIN
    OPEN cur_detalles;
    LOOP
        FETCH cur_detalles INTO v_detalle;
        EXIT WHEN cur_detalles%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_detalle.id_detalle || ' Cantidad: ' || v_detalle.cantidad);
    END LOOP;
    CLOSE cur_detalles;
END listar_todos_los_detalles_pedidos;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODOS_LOS_ESTADOS_PEDIDOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODOS_LOS_ESTADOS_PEDIDOS" IS
    CURSOR cur_estados IS SELECT * FROM estados_pedidos;
    v_estado estados_pedidos%ROWTYPE;
BEGIN
    OPEN cur_estados;
    LOOP
        FETCH cur_estados INTO v_estado;
        EXIT WHEN cur_estados%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_estado.id_estado || ' Nombre: ' || v_estado.nombre_estado);
    END LOOP;
    CLOSE cur_estados;
END listar_todos_los_estados_pedidos;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODOS_LOS_INVENTARIOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODOS_LOS_INVENTARIOS" IS
    CURSOR cur_inventarios IS SELECT * FROM inventario;
    v_inventario inventario%ROWTYPE;
BEGIN
    OPEN cur_inventarios;
    LOOP
        FETCH cur_inventarios INTO v_inventario;
        EXIT WHEN cur_inventarios%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_inventario.id_inventario || ' Cantidad: ' || v_inventario.cantidad);
    END LOOP;
    CLOSE cur_inventarios;
END listar_todos_los_inventarios;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODOS_LOS_MENSAJES_CONTACTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODOS_LOS_MENSAJES_CONTACTO" IS
    CURSOR cur_mensajes IS SELECT * FROM mensajes_contacto;
    v_mensaje mensajes_contacto%ROWTYPE;
BEGIN
    OPEN cur_mensajes;
    LOOP
        FETCH cur_mensajes INTO v_mensaje;
        EXIT WHEN cur_mensajes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_mensaje.id_mensaje || ' Mensaje: ' || v_mensaje.mensaje);
    END LOOP;
    CLOSE cur_mensajes;
END listar_todos_los_mensajes_contacto;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODOS_LOS_PEDIDOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODOS_LOS_PEDIDOS" IS
    CURSOR cur_pedidos IS SELECT * FROM pedidos;
    v_pedido pedidos%ROWTYPE;
BEGIN
    OPEN cur_pedidos;
    LOOP
        FETCH cur_pedidos INTO v_pedido;
        EXIT WHEN cur_pedidos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_pedido.id_pedido || ' Total: ' || v_pedido.total);
    END LOOP;
    CLOSE cur_pedidos;
END listar_todos_los_pedidos;


/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODOS_LOS_PRODUCTOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODOS_LOS_PRODUCTOS" (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR SELECT * FROM productos;
END LISTAR_TODOS_LOS_PRODUCTOS;

/
--------------------------------------------------------
--  DDL for Procedure LISTAR_TODOS_LOS_USUARIOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."LISTAR_TODOS_LOS_USUARIOS" IS
    CURSOR cur_usuarios IS SELECT * FROM usuarios;
    v_usuario usuarios%ROWTYPE;
BEGIN
    OPEN cur_usuarios;
    LOOP
        FETCH cur_usuarios INTO v_usuario;
        EXIT WHEN cur_usuarios%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_usuario.id_usuario || ' Nombre: ' || v_usuario.nombre_usuario);
    END LOOP;
    CLOSE cur_usuarios;
END listar_todos_los_usuarios;

/
--------------------------------------------------------
--  DDL for Procedure OBTENER_CANTIDAD_INVENTARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_CANTIDAD_INVENTARIO" (
    p_id_producto IN INTEGER,
    p_cantidad OUT INTEGER
) AS
BEGIN
    SELECT cantidad INTO p_cantidad
    FROM inventario
    WHERE id_producto = p_id_producto;
END obtener_cantidad_inventario;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_CATEGORIA_PRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_CATEGORIA_PRODUCTO" (
    p_id_categoria IN INTEGER,
    p_nombre OUT VARCHAR2,
    p_descripcion OUT CLOB,
    p_fecha_creacion OUT TIMESTAMP
) AS
BEGIN
    SELECT nombre, descripcion, fecha_creacion
    INTO p_nombre, p_descripcion, p_fecha_creacion
    FROM categorias_productos
    WHERE id_categoria = p_id_categoria;
END obtener_categoria_producto;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_DETALLE_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_DETALLE_PEDIDO" (
    p_id_detalle IN INTEGER,
    p_id_pedido OUT INTEGER,
    p_id_producto OUT INTEGER,
    p_cantidad OUT INTEGER,
    p_precio OUT DECIMAL,
    p_fecha_creacion OUT TIMESTAMP
) AS
BEGIN
    SELECT id_pedido, id_producto, cantidad, precio, fecha_creacion
    INTO p_id_pedido, p_id_producto, p_cantidad, p_precio, p_fecha_creacion
    FROM detalles_pedidos
    WHERE id_detalle = p_id_detalle;
END obtener_detalle_pedido;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_DIRECCIONES_POR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_DIRECCIONES_POR_USUARIO" (
    p_id_usuario IN INTEGER
) IS
BEGIN
    FOR direccion IN (SELECT * FROM direcciones_usuarios WHERE id_usuario = p_id_usuario)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || direccion.id_direccion || ' Dirección: ' || direccion.direccion_linea1);
        END LOOP;
END obtener_direcciones_por_usuario;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_DIRECCION_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_DIRECCION_USUARIO" (
    p_id_direccion IN INTEGER,
    p_id_usuario OUT INTEGER,
    p_direccion_linea1 OUT VARCHAR2,
    p_direccion_linea2 OUT VARCHAR2,
    p_ciudad OUT VARCHAR2,
    p_estado OUT VARCHAR2,
    p_codigo_postal OUT VARCHAR2,
    p_pais OUT VARCHAR2,
    p_fecha_creacion OUT TIMESTAMP
) AS
BEGIN
    SELECT id_usuario, direccion_linea1, direccion_linea2, ciudad, estado, codigo_postal, pais, fecha_creacion
    INTO p_id_usuario, p_direccion_linea1, p_direccion_linea2, p_ciudad, p_estado, p_codigo_postal, p_pais, p_fecha_creacion
    FROM direcciones_usuarios
    WHERE id_direccion = p_id_direccion;
END obtener_direccion_usuario;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_ESTADO_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_ESTADO_PEDIDO" (
    p_id_estado IN INTEGER,
    p_nombre_estado OUT VARCHAR2,
    p_descripcion OUT CLOB,
    p_fecha_creacion OUT TIMESTAMP
) AS
BEGIN
    SELECT nombre_estado, descripcion, fecha_creacion
    INTO p_nombre_estado, p_descripcion, p_fecha_creacion
    FROM estados_pedidos
    WHERE id_estado = p_id_estado;
END obtener_estado_pedido;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_HISTORIAL_ESTADOS_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_HISTORIAL_ESTADOS_PEDIDO" (
    p_id_pedido IN INTEGER
) IS
BEGIN
    FOR estado IN (SELECT * FROM estados_pedidos WHERE id_estado IN (SELECT id_estado FROM pedidos WHERE id_pedido = p_id_pedido))
        LOOP
            DBMS_OUTPUT.PUT_LINE('Estado: ' || estado.nombre_estado || ' Fecha: ' || estado.fecha_creacion);
        END LOOP;
END obtener_historial_estados_pedido;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_INVENTARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_INVENTARIO" (
    p_id_inventario IN INTEGER,
    p_id_producto OUT INTEGER,
    p_cantidad OUT INTEGER,
    p_ultima_actualizacion OUT TIMESTAMP
) AS
BEGIN
    SELECT id_producto, cantidad, ultima_actualizacion
    INTO p_id_producto, p_cantidad, p_ultima_actualizacion
    FROM inventario
    WHERE id_inventario = p_id_inventario;
END obtener_inventario;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_MENSAJES_POR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_MENSAJES_POR_USUARIO" (
    p_id_usuario IN INTEGER
) IS
BEGIN
    FOR mensaje IN (SELECT * FROM mensajes_contacto WHERE id_usuario = p_id_usuario)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || mensaje.id_mensaje || ' Mensaje: ' || mensaje.mensaje);
        END LOOP;
END obtener_mensajes_por_usuario;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_MENSAJE_CONTACTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_MENSAJE_CONTACTO" (
    p_id_mensaje IN INTEGER,
    p_id_usuario OUT INTEGER,
    p_mensaje OUT CLOB,
    p_fecha_creacion OUT TIMESTAMP
) AS
BEGIN
    SELECT id_usuario, mensaje, fecha_creacion
    INTO p_id_usuario, p_mensaje, p_fecha_creacion
    FROM mensajes_contacto
    WHERE id_mensaje = p_id_mensaje;
END obtener_mensaje_contacto;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_PEDIDO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_PEDIDO" (
    p_id_pedido IN INTEGER,
    p_id_usuario OUT INTEGER,
    p_id_direccion OUT INTEGER,
    p_total OUT DECIMAL,
    p_id_estado OUT INTEGER,
    p_fecha_creacion OUT TIMESTAMP
) AS
BEGIN
    SELECT id_usuario, id_direccion, total, id_estado, fecha_creacion
    INTO p_id_usuario, p_id_direccion, p_total, p_id_estado, p_fecha_creacion
    FROM pedidos
    WHERE id_pedido = p_id_pedido;
END obtener_pedido;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_PEDIDOS_POR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_PEDIDOS_POR_USUARIO" (
    p_id_usuario IN INTEGER,
    p_pedidos OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_pedidos FOR
        SELECT id_pedido, id_usuario, id_direccion, total, id_estado, fecha_creacion
        FROM pedidos
        WHERE id_usuario = p_id_usuario;
END OBTENER_PEDIDOS_POR_USUARIO;

/
--------------------------------------------------------
--  DDL for Procedure OBTENER_PRODUCTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_PRODUCTO" (
    p_id_producto IN INTEGER,
    p_id_categoria OUT INTEGER,
    p_nombre OUT VARCHAR2,
    p_descripcion OUT CLOB,
    p_precio OUT DECIMAL,
    p_fecha_creacion OUT TIMESTAMP
) AS
BEGIN
    SELECT id_categoria, nombre, descripcion, precio, fecha_creacion
    INTO p_id_categoria, p_nombre, p_descripcion, p_precio, p_fecha_creacion
    FROM productos
    WHERE id_producto = p_id_producto;
END obtener_producto;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_PRODUCTOS_POR_CATEGORIA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_PRODUCTOS_POR_CATEGORIA" (
    p_id_categoria IN INTEGER
) IS
BEGIN
    FOR producto IN (SELECT * FROM productos WHERE id_categoria = p_id_categoria)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || producto.id_producto || ' Nombre: ' || producto.nombre);
        END LOOP;
END obtener_productos_por_categoria;


/
--------------------------------------------------------
--  DDL for Procedure OBTENER_TODOS_LOS_USUARIOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_TODOS_LOS_USUARIOS" IS
BEGIN
    FOR usuario IN (SELECT * FROM usuarios)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || usuario.id_usuario || ' Nombre: ' || usuario.nombre_usuario);
        END LOOP;
END obtener_todos_los_usuarios;

/
--------------------------------------------------------
--  DDL for Procedure OBTENER_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "MALPZ"."OBTENER_USUARIO" (
    p_nombre_usuario IN VARCHAR2,
    p_id_usuario OUT INTEGER,
    p_contrasena OUT VARCHAR2,
    p_correo_electronico OUT VARCHAR2,
    p_rol OUT VARCHAR2,
    p_fecha_creacion OUT TIMESTAMP
) AS
BEGIN
    SELECT id_usuario, contrasena, correo_electronico, rol, fecha_creacion
    INTO p_id_usuario, p_contrasena, p_correo_electronico, p_rol, p_fecha_creacion
    FROM usuarios
    WHERE nombre_usuario = p_nombre_usuario;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No user found');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one user found');
END obtener_usuario;

/
--------------------------------------------------------
--  DDL for Package CATEGORIA_PRODUCTO_COMBINED_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."CATEGORIA_PRODUCTO_COMBINED_PKG" IS
    PROCEDURE crear_categoria_producto(
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB
    );

    PROCEDURE crear_producto(
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB,
        p_precio IN DECIMAL
    );

    PROCEDURE obtener_categoria_producto(
        p_id_categoria IN INTEGER,
        p_nombre OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE obtener_producto(
        p_id_producto IN INTEGER,
        p_id_categoria OUT INTEGER,
        p_nombre OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_precio OUT DECIMAL,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_categoria_producto(
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB
    );

    PROCEDURE actualizar_producto(
        p_id_producto IN INTEGER,
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB,
        p_precio IN DECIMAL
    );

    PROCEDURE eliminar_categoria_producto(
        p_id_categoria IN INTEGER
    );

    PROCEDURE eliminar_producto(
        p_id_producto IN INTEGER
    );
END categoria_producto_combined_pkg;


/
--------------------------------------------------------
--  DDL for Package CATEGORIA_PRODUCTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."CATEGORIA_PRODUCTO_PKG" IS
    PROCEDURE crear_categoria_producto(
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB
    );

    PROCEDURE obtener_categoria_producto(
        p_id_categoria IN INTEGER,
        p_nombre OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_categoria_producto(
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB
    );

    PROCEDURE eliminar_categoria_producto(
        p_id_categoria IN INTEGER
    );
END categoria_producto_pkg;


/
--------------------------------------------------------
--  DDL for Package DETALLE_PEDIDO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."DETALLE_PEDIDO_PKG" IS
    PROCEDURE crear_detalle_pedido(
        p_id_pedido IN INTEGER,
        p_id_producto IN INTEGER,
        p_cantidad IN INTEGER,
        p_precio IN DECIMAL
    );

    PROCEDURE obtener_detalle_pedido(
        p_id_detalle IN INTEGER,
        p_id_pedido OUT INTEGER,
        p_id_producto OUT INTEGER,
        p_cantidad OUT INTEGER,
        p_precio OUT DECIMAL,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_detalle_pedido(
        p_id_detalle IN INTEGER,
        p_id_pedido IN INTEGER,
        p_id_producto IN INTEGER,
        p_cantidad IN INTEGER,
        p_precio IN DECIMAL
    );

    PROCEDURE eliminar_detalle_pedido(
        p_id_detalle IN INTEGER
    );
END detalle_pedido_pkg;


/
--------------------------------------------------------
--  DDL for Package DIRECCION_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."DIRECCION_PKG" IS
    PROCEDURE crear_direccion_usuario(
        p_id_usuario IN INTEGER,
        p_direccion_linea1 IN VARCHAR2,
        p_direccion_linea2 IN VARCHAR2,
        p_ciudad IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_codigo_postal IN VARCHAR2,
        p_pais IN VARCHAR2
    );

    PROCEDURE obtener_direccion_usuario(
        p_id_direccion IN INTEGER,
        p_id_usuario OUT INTEGER,
        p_direccion_linea1 OUT VARCHAR2,
        p_direccion_linea2 OUT VARCHAR2,
        p_ciudad OUT VARCHAR2,
        p_estado OUT VARCHAR2,
        p_codigo_postal OUT VARCHAR2,
        p_pais OUT VARCHAR2,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_direccion_usuario(
        p_id_direccion IN INTEGER,
        p_id_usuario IN INTEGER,
        p_direccion_linea1 IN VARCHAR2,
        p_direccion_linea2 IN VARCHAR2,
        p_ciudad IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_codigo_postal IN VARCHAR2,
        p_pais IN VARCHAR2
    );

    PROCEDURE eliminar_direccion_usuario(
        p_id_direccion IN INTEGER
    );
END direccion_pkg;

/
--------------------------------------------------------
--  DDL for Package ESTADO_PEDIDO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."ESTADO_PEDIDO_PKG" IS
    PROCEDURE crear_estado_pedido(
        p_nombre_estado IN VARCHAR2,
        p_descripcion IN CLOB
    );

    PROCEDURE obtener_estado_pedido(
        p_id_estado IN INTEGER,
        p_nombre_estado OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_estado_pedido(
        p_id_estado IN INTEGER,
        p_nombre_estado IN VARCHAR2,
        p_descripcion IN CLOB
    );

    PROCEDURE eliminar_estado_pedido(
        p_id_estado IN INTEGER
    );
END estado_pedido_pkg;


/
--------------------------------------------------------
--  DDL for Package INVENTARIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."INVENTARIO_PKG" IS
    PROCEDURE crear_inventario(
        p_id_producto IN INTEGER,
        p_cantidad IN INTEGER
    );

    PROCEDURE obtener_inventario(
        p_id_inventario IN INTEGER,
        p_id_producto OUT INTEGER,
        p_cantidad OUT INTEGER,
        p_ultima_actualizacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_inventario(
        p_id_inventario IN INTEGER,
        p_id_producto IN INTEGER,
        p_cantidad IN INTEGER
    );

    PROCEDURE eliminar_inventario(
        p_id_inventario IN INTEGER
    );
END inventario_pkg;


/
--------------------------------------------------------
--  DDL for Package MENSAJE_CONTACTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."MENSAJE_CONTACTO_PKG" IS
    PROCEDURE crear_mensaje_contacto(
        p_id_usuario IN INTEGER,
        p_mensaje IN CLOB
    );

    PROCEDURE obtener_mensaje_contacto(
        p_id_mensaje IN INTEGER,
        p_id_usuario OUT INTEGER,
        p_mensaje OUT CLOB,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_mensaje_contacto(
        p_id_mensaje IN INTEGER,
        p_id_usuario IN INTEGER,
        p_mensaje IN CLOB
    );

    PROCEDURE eliminar_mensaje_contacto(
        p_id_mensaje IN INTEGER
    );
END mensaje_contacto_pkg;


/
--------------------------------------------------------
--  DDL for Package PEDIDO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."PEDIDO_PKG" IS
    PROCEDURE crear_pedido(
        p_id_usuario IN INTEGER,
        p_id_direccion IN INTEGER,
        p_total IN DECIMAL,
        p_id_estado IN INTEGER,
        p_id_pedido OUT INTEGER
    );

    PROCEDURE obtener_pedido(
        p_id_pedido IN INTEGER,
        p_id_usuario OUT INTEGER,
        p_id_direccion OUT INTEGER,
        p_total OUT DECIMAL,
        p_id_estado OUT INTEGER,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_pedido(
        p_id_pedido IN INTEGER,
        p_id_usuario IN INTEGER,
        p_id_direccion IN INTEGER,
        p_total IN DECIMAL,
        p_id_estado IN INTEGER
    );

    PROCEDURE eliminar_pedido(
        p_id_pedido IN INTEGER
    );
END pedido_pkg;

/
--------------------------------------------------------
--  DDL for Package PRODUCTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."PRODUCTO_PKG" IS
    PROCEDURE crear_producto(
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB,
        p_precio IN DECIMAL
    );

    PROCEDURE obtener_producto(
        p_id_producto IN INTEGER,
        p_id_categoria OUT INTEGER,
        p_nombre OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_precio OUT DECIMAL,
        p_fecha_creacion OUT TIMESTAMP
    );

    PROCEDURE actualizar_producto(
        p_id_producto IN INTEGER,
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB,
        p_precio IN DECIMAL
    );

    PROCEDURE eliminar_producto(
        p_id_producto IN INTEGER
    );
END PRODUCTO_PKG;

/
--------------------------------------------------------
--  DDL for Package USUARIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "MALPZ"."USUARIO_PKG" AS
    PROCEDURE crear_usuario(
        p_nombre_usuario IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_correo_electronico IN VARCHAR2,
        p_rol IN VARCHAR2
    );
END usuario_pkg;

/
--------------------------------------------------------
--  DDL for Package Body CATEGORIA_PRODUCTO_COMBINED_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."CATEGORIA_PRODUCTO_COMBINED_PKG" IS
    PROCEDURE crear_categoria_producto(
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB
    ) AS
    BEGIN
        INSERT INTO categorias_productos (nombre, descripcion, fecha_creacion)
        VALUES (p_nombre, p_descripcion, SYSDATE);
    END crear_categoria_producto;

    PROCEDURE crear_producto(
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB,
        p_precio IN DECIMAL
    ) AS
    BEGIN
        INSERT INTO productos (id_categoria, nombre, descripcion, precio, fecha_creacion)
        VALUES (p_id_categoria, p_nombre, p_descripcion, p_precio, SYSDATE);
    END crear_producto;

    PROCEDURE obtener_categoria_producto(
        p_id_categoria IN INTEGER,
        p_nombre OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT nombre, descripcion, fecha_creacion
        INTO p_nombre, p_descripcion, p_fecha_creacion
        FROM categorias_productos
        WHERE id_categoria = p_id_categoria;
    END obtener_categoria_producto;

    PROCEDURE obtener_producto(
        p_id_producto IN INTEGER,
        p_id_categoria OUT INTEGER,
        p_nombre OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_precio OUT DECIMAL,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT id_categoria, nombre, descripcion, precio, fecha_creacion
        INTO p_id_categoria, p_nombre, p_descripcion, p_precio, p_fecha_creacion
        FROM productos
        WHERE id_producto = p_id_producto;
    END obtener_producto;

    PROCEDURE actualizar_categoria_producto(
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB
    ) AS
    BEGIN
        UPDATE categorias_productos
        SET nombre = p_nombre,
            descripcion = p_descripcion
        WHERE id_categoria = p_id_categoria;
    END actualizar_categoria_producto;

    PROCEDURE actualizar_producto(
        p_id_producto IN INTEGER,
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB,
        p_precio IN DECIMAL
    ) AS
    BEGIN
        UPDATE productos
        SET id_categoria = p_id_categoria,
            nombre = p_nombre,
            descripcion = p_descripcion,
            precio = p_precio
        WHERE id_producto = p_id_producto;
    END actualizar_producto;

    PROCEDURE eliminar_categoria_producto(
        p_id_categoria IN INTEGER
    ) AS
    BEGIN
        DELETE FROM categorias_productos WHERE id_categoria = p_id_categoria;
    END eliminar_categoria_producto;

    PROCEDURE eliminar_producto(
        p_id_producto IN INTEGER
    ) AS
    BEGIN
        DELETE FROM productos WHERE id_producto = p_id_producto;
    END eliminar_producto;
END categoria_producto_combined_pkg;


/
--------------------------------------------------------
--  DDL for Package Body CATEGORIA_PRODUCTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."CATEGORIA_PRODUCTO_PKG" IS
    PROCEDURE crear_categoria_producto(
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB
    ) AS
    BEGIN
        INSERT INTO categorias_productos (nombre, descripcion, fecha_creacion)
        VALUES (p_nombre, p_descripcion, SYSDATE);
    END crear_categoria_producto;

    PROCEDURE obtener_categoria_producto(
        p_id_categoria IN INTEGER,
        p_nombre OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT nombre, descripcion, fecha_creacion
        INTO p_nombre, p_descripcion, p_fecha_creacion
        FROM categorias_productos
        WHERE id_categoria = p_id_categoria;
    END obtener_categoria_producto;

    PROCEDURE actualizar_categoria_producto(
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB
    ) AS
    BEGIN
        UPDATE categorias_productos
        SET nombre = p_nombre,
            descripcion = p_descripcion
        WHERE id_categoria = p_id_categoria;
    END actualizar_categoria_producto;

    PROCEDURE eliminar_categoria_producto(
        p_id_categoria IN INTEGER
    ) AS
    BEGIN
        DELETE FROM categorias_productos WHERE id_categoria = p_id_categoria;
    END eliminar_categoria_producto;
END categoria_producto_pkg;


/
--------------------------------------------------------
--  DDL for Package Body DETALLE_PEDIDO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."DETALLE_PEDIDO_PKG" IS
    PROCEDURE crear_detalle_pedido(
        p_id_pedido IN INTEGER,
        p_id_producto IN INTEGER,
        p_cantidad IN INTEGER,
        p_precio IN DECIMAL
    ) AS
    BEGIN
        INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio, fecha_creacion)
        VALUES (p_id_pedido, p_id_producto, p_cantidad, p_precio, SYSDATE);
    END crear_detalle_pedido;

    PROCEDURE obtener_detalle_pedido(
        p_id_detalle IN INTEGER,
        p_id_pedido OUT INTEGER,
        p_id_producto OUT INTEGER,
        p_cantidad OUT INTEGER,
        p_precio OUT DECIMAL,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT id_pedido, id_producto, cantidad, precio, fecha_creacion
        INTO p_id_pedido, p_id_producto, p_cantidad, p_precio, p_fecha_creacion
        FROM detalles_pedidos
        WHERE id_detalle = p_id_detalle;
    END obtener_detalle_pedido;

    PROCEDURE actualizar_detalle_pedido(
        p_id_detalle IN INTEGER,
        p_id_pedido IN INTEGER,
        p_id_producto IN INTEGER,
        p_cantidad IN INTEGER,
        p_precio IN DECIMAL
    ) AS
    BEGIN
        UPDATE detalles_pedidos
        SET id_pedido = p_id_pedido,
            id_producto = p_id_producto,
            cantidad = p_cantidad,
            precio = p_precio
        WHERE id_detalle = p_id_detalle;
    END actualizar_detalle_pedido;

    PROCEDURE eliminar_detalle_pedido(
        p_id_detalle IN INTEGER
    ) AS
    BEGIN
        DELETE FROM detalles_pedidos WHERE id_detalle = p_id_detalle;
    END eliminar_detalle_pedido;
END detalle_pedido_pkg;


/
--------------------------------------------------------
--  DDL for Package Body DIRECCION_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."DIRECCION_PKG" IS

    PROCEDURE crear_direccion_usuario(
        p_id_usuario IN INTEGER,
        p_direccion_linea1 IN VARCHAR2,
        p_direccion_linea2 IN VARCHAR2,
        p_ciudad IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_codigo_postal IN VARCHAR2,
        p_pais IN VARCHAR2
    ) AS
        v_count INTEGER;
    BEGIN
        -- Verificar si el usuario existe
        SELECT COUNT(*) INTO v_count
        FROM usuarios
        WHERE id_usuario = p_id_usuario;

        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Usuario no encontrado');
        ELSE
            -- Insertar la dirección si el usuario existe
            INSERT INTO direcciones_usuarios (
                id_direccion,
                id_usuario,
                direccion_linea1,
                direccion_linea2,
                ciudad,
                estado,
                codigo_postal,
                pais,
                fecha_creacion
            ) VALUES (
                         seq_direccion_id.NEXTVAL,
                         p_id_usuario,
                         p_direccion_linea1,
                         p_direccion_linea2,
                         p_ciudad,
                         p_estado,
                         p_codigo_postal,
                         p_pais,
                         SYSDATE
                     );
        END IF;
    END crear_direccion_usuario;

    PROCEDURE obtener_direccion_usuario(
        p_id_direccion IN INTEGER,
        p_id_usuario OUT INTEGER,
        p_direccion_linea1 OUT VARCHAR2,
        p_direccion_linea2 OUT VARCHAR2,
        p_ciudad OUT VARCHAR2,
        p_estado OUT VARCHAR2,
        p_codigo_postal OUT VARCHAR2,
        p_pais OUT VARCHAR2,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT id_usuario, direccion_linea1, direccion_linea2, ciudad, estado, codigo_postal, pais, fecha_creacion
        INTO p_id_usuario, p_direccion_linea1, p_direccion_linea2, p_ciudad, p_estado, p_codigo_postal, p_pais, p_fecha_creacion
        FROM direcciones_usuarios
        WHERE id_direccion = p_id_direccion;
    END obtener_direccion_usuario;

    PROCEDURE actualizar_direccion_usuario(
        p_id_direccion IN INTEGER,
        p_id_usuario IN INTEGER,
        p_direccion_linea1 IN VARCHAR2,
        p_direccion_linea2 IN VARCHAR2,
        p_ciudad IN VARCHAR2,
        p_estado IN VARCHAR2,
        p_codigo_postal IN VARCHAR2,
        p_pais IN VARCHAR2
    ) AS
    BEGIN
        UPDATE direcciones_usuarios
        SET id_usuario = p_id_usuario,
            direccion_linea1 = p_direccion_linea1,
            direccion_linea2 = p_direccion_linea2,
            ciudad = p_ciudad,
            estado = p_estado,
            codigo_postal = p_codigo_postal,
            pais = p_pais
        WHERE id_direccion = p_id_direccion;
    END actualizar_direccion_usuario;

    PROCEDURE eliminar_direccion_usuario(
        p_id_direccion IN INTEGER
    ) AS
    BEGIN
        DELETE FROM direcciones_usuarios
        WHERE id_direccion = p_id_direccion;
    END eliminar_direccion_usuario;

END direccion_pkg;

/
--------------------------------------------------------
--  DDL for Package Body ESTADO_PEDIDO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."ESTADO_PEDIDO_PKG" IS
    PROCEDURE crear_estado_pedido(
        p_nombre_estado IN VARCHAR2,
        p_descripcion IN CLOB
    ) AS
    BEGIN
        INSERT INTO estados_pedidos (nombre_estado, descripcion, fecha_creacion)
        VALUES (p_nombre_estado, p_descripcion, SYSDATE);
    END crear_estado_pedido;

    PROCEDURE obtener_estado_pedido(
        p_id_estado IN INTEGER,
        p_nombre_estado OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT nombre_estado, descripcion, fecha_creacion
        INTO p_nombre_estado, p_descripcion, p_fecha_creacion
        FROM estados_pedidos
        WHERE id_estado = p_id_estado;
    END obtener_estado_pedido;

    PROCEDURE actualizar_estado_pedido(
        p_id_estado IN INTEGER,
        p_nombre_estado IN VARCHAR2,
        p_descripcion IN CLOB
    ) AS
    BEGIN
        UPDATE estados_pedidos
        SET nombre_estado = p_nombre_estado,
            descripcion = p_descripcion
        WHERE id_estado = p_id_estado;
    END actualizar_estado_pedido;

    PROCEDURE eliminar_estado_pedido(
        p_id_estado IN INTEGER
    ) AS
    BEGIN
        DELETE FROM estados_pedidos WHERE id_estado = p_id_estado;
    END eliminar_estado_pedido;
END estado_pedido_pkg;


/
--------------------------------------------------------
--  DDL for Package Body INVENTARIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."INVENTARIO_PKG" IS
    PROCEDURE crear_inventario(
        p_id_producto IN INTEGER,
        p_cantidad IN INTEGER
    ) AS
    BEGIN
        INSERT INTO inventario (id_producto, cantidad, ultima_actualizacion)
        VALUES (p_id_producto, p_cantidad, SYSDATE);
    END crear_inventario;

    PROCEDURE obtener_inventario(
        p_id_inventario IN INTEGER,
        p_id_producto OUT INTEGER,
        p_cantidad OUT INTEGER,
        p_ultima_actualizacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT id_producto, cantidad, ultima_actualizacion
        INTO p_id_producto, p_cantidad, p_ultima_actualizacion
        FROM inventario
        WHERE id_inventario = p_id_inventario;
    END obtener_inventario;

    PROCEDURE actualizar_inventario(
        p_id_inventario IN INTEGER,
        p_id_producto IN INTEGER,
        p_cantidad IN INTEGER
    ) AS
    BEGIN
        UPDATE inventario
        SET id_producto = p_id_producto,
            cantidad = p_cantidad,
            ultima_actualizacion = SYSDATE
        WHERE id_inventario = p_id_inventario;
    END actualizar_inventario;

    PROCEDURE eliminar_inventario(
        p_id_inventario IN INTEGER
    ) AS
    BEGIN
        DELETE FROM inventario WHERE id_inventario = p_id_inventario;
    END eliminar_inventario;
END INVENTARIO_PKG;

/
--------------------------------------------------------
--  DDL for Package Body MENSAJE_CONTACTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."MENSAJE_CONTACTO_PKG" IS
    PROCEDURE crear_mensaje_contacto(
        p_id_usuario IN INTEGER,
        p_mensaje IN CLOB
    ) AS
    BEGIN
        INSERT INTO MENSAJES_CONTACTO (ID_USUARIO, MENSAJE, FECHA_CREACION)
        VALUES (p_id_usuario, p_mensaje, SYSDATE);
    END crear_mensaje_contacto;

    PROCEDURE obtener_mensaje_contacto(
        p_id_mensaje IN INTEGER,
        p_id_usuario OUT INTEGER,
        p_mensaje OUT CLOB,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT ID_USUARIO, MENSAJE, FECHA_CREACION
        INTO p_id_usuario, p_mensaje, p_fecha_creacion
        FROM MENSAJES_CONTACTO
        WHERE ID_MENSAJE = p_id_mensaje;
    END obtener_mensaje_contacto;

    PROCEDURE actualizar_mensaje_contacto(
        p_id_mensaje IN INTEGER,
        p_id_usuario IN INTEGER,
        p_mensaje IN CLOB
    ) AS
    BEGIN
        UPDATE MENSAJES_CONTACTO
        SET ID_USUARIO = p_id_usuario,
            MENSAJE = p_mensaje
        WHERE ID_MENSAJE = p_id_mensaje;
    END actualizar_mensaje_contacto;

    PROCEDURE eliminar_mensaje_contacto(
        p_id_mensaje IN INTEGER
    ) AS
    BEGIN
        DELETE FROM MENSAJES_CONTACTO WHERE ID_MENSAJE = p_id_mensaje;
    END eliminar_mensaje_contacto;
END MENSAJE_CONTACTO_PKG;

/
--------------------------------------------------------
--  DDL for Package Body PEDIDO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."PEDIDO_PKG" IS
    PROCEDURE crear_pedido(
        p_id_usuario IN INTEGER,
        p_id_direccion IN INTEGER,
        p_total IN DECIMAL,
        p_id_estado IN INTEGER,
        p_id_pedido OUT INTEGER 
    ) AS
        v_count INTEGER;
    BEGIN
        -- Verificar si el estado existe
        SELECT COUNT(*) INTO v_count
        FROM estados_pedidos
        WHERE id_estado = p_id_estado;

        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'El estado especificado no existe');
        END IF;

        INSERT INTO pedidos (id_usuario, id_direccion, total, id_estado, fecha_creacion)
        VALUES (p_id_usuario, p_id_direccion, p_total, p_id_estado, SYSDATE)
        RETURNING id_pedido INTO p_id_pedido;
    END crear_pedido;
        
    PROCEDURE obtener_pedido(
        p_id_pedido IN INTEGER,
        p_id_usuario OUT INTEGER,
        p_id_direccion OUT INTEGER,
        p_total OUT DECIMAL,
        p_id_estado OUT INTEGER,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT id_usuario, id_direccion, total, id_estado, fecha_creacion
        INTO p_id_usuario, p_id_direccion, p_total, p_id_estado, p_fecha_creacion
        FROM pedidos
        WHERE id_pedido = p_id_pedido;
    END obtener_pedido;

    PROCEDURE actualizar_pedido(
        p_id_pedido IN INTEGER,
        p_id_usuario IN INTEGER,
        p_id_direccion IN INTEGER,
        p_total IN DECIMAL,
        p_id_estado IN INTEGER
    ) AS
    BEGIN
        UPDATE pedidos
        SET id_usuario = p_id_usuario,
            id_direccion = p_id_direccion,
            total = p_total,
            id_estado = p_id_estado
        WHERE id_pedido = p_id_pedido;
    END actualizar_pedido;

    PROCEDURE eliminar_pedido(
        p_id_pedido IN INTEGER
    ) AS
    BEGIN
        DELETE FROM pedidos WHERE id_pedido = p_id_pedido;
    END eliminar_pedido;
END PEDIDO_PKG;

/
--------------------------------------------------------
--  DDL for Package Body PRODUCTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."PRODUCTO_PKG" IS
    PROCEDURE crear_producto(
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB,
        p_precio IN DECIMAL
    ) AS
    BEGIN
        INSERT INTO productos (id_producto, id_categoria, nombre, descripcion, precio, fecha_creacion)
        VALUES (productos_seq.NEXTVAL, p_id_categoria, p_nombre, p_descripcion, p_precio, SYSDATE);
    END crear_producto;

    PROCEDURE obtener_producto(
        p_id_producto IN INTEGER,
        p_id_categoria OUT INTEGER,
        p_nombre OUT VARCHAR2,
        p_descripcion OUT CLOB,
        p_precio OUT DECIMAL,
        p_fecha_creacion OUT TIMESTAMP
    ) AS
    BEGIN
        SELECT id_categoria, nombre, descripcion, precio, fecha_creacion
        INTO p_id_categoria, p_nombre, p_descripcion, p_precio, p_fecha_creacion
        FROM productos
        WHERE id_producto = p_id_producto;
    END obtener_producto;

    PROCEDURE actualizar_producto(
        p_id_producto IN INTEGER,
        p_id_categoria IN INTEGER,
        p_nombre IN VARCHAR2,
        p_descripcion IN CLOB,
        p_precio IN DECIMAL
    ) AS
    BEGIN
        UPDATE productos
        SET id_categoria = p_id_categoria,
            nombre = p_nombre,
            descripcion = p_descripcion,
            precio = p_precio
        WHERE id_producto = p_id_producto;
    END actualizar_producto;

    PROCEDURE eliminar_producto(
        p_id_producto IN INTEGER
    ) AS
    BEGIN
        DELETE FROM productos WHERE id_producto = p_id_producto;
    END eliminar_producto;
END PRODUCTO_PKG;

/
--------------------------------------------------------
--  DDL for Package Body USUARIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "MALPZ"."USUARIO_PKG" AS
    PROCEDURE crear_usuario(
        p_nombre_usuario IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_correo_electronico IN VARCHAR2,
        p_rol IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO usuarios (
            id_usuario,
            nombre_usuario,
            contrasena,
            correo_electronico,
            rol
        ) VALUES (
                     usuarios_seq.NEXTVAL,
                     p_nombre_usuario,
                     p_contrasena,
                     p_correo_electronico,
                     p_rol
                 );
    END crear_usuario;
END usuario_pkg;

/
--------------------------------------------------------
--  DDL for Function CONTAR_CATEGORIAS_PRODUCTOS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."CONTAR_CATEGORIAS_PRODUCTOS" RETURN INTEGER IS
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM categorias_productos;
    RETURN v_count;
END contar_categorias_productos;


/
--------------------------------------------------------
--  DDL for Function CONTAR_PEDIDOS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."CONTAR_PEDIDOS" RETURN INTEGER IS
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM pedidos;
    RETURN v_count;
END contar_pedidos;


/
--------------------------------------------------------
--  DDL for Function CONTAR_PRODUCTOS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."CONTAR_PRODUCTOS" RETURN INTEGER IS
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM productos;
    RETURN v_count;
END contar_productos;


/
--------------------------------------------------------
--  DDL for Function CONTAR_USUARIOS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."CONTAR_USUARIOS" RETURN INTEGER IS
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM usuarios;
    RETURN v_count;
END contar_usuarios;


/
--------------------------------------------------------
--  DDL for Function OBTENER_CANTIDAD_INVENTARIO_FUNC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_CANTIDAD_INVENTARIO_FUNC" (
    p_id_producto IN INTEGER
) RETURN INTEGER IS
    v_cantidad INTEGER;
BEGIN
    SELECT cantidad INTO v_cantidad
    FROM inventario
    WHERE id_producto = p_id_producto;
    RETURN v_cantidad;
END obtener_cantidad_inventario_func;


/
--------------------------------------------------------
--  DDL for Function OBTENER_CORREO_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_CORREO_USUARIO" (
    p_id_usuario IN INTEGER
) RETURN VARCHAR2 IS
    v_correo VARCHAR2(100);
BEGIN
    BEGIN
        SELECT correo_electronico INTO v_correo
        FROM usuarios
        WHERE id_usuario = p_id_usuario;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_correo := NULL;
    END;
    RETURN v_correo;
END obtener_correo_usuario;

/
--------------------------------------------------------
--  DDL for Function OBTENER_DESCRIPCION_PRODUCTO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_DESCRIPCION_PRODUCTO" (
    p_id_producto IN INTEGER
) RETURN CLOB IS
    v_descripcion CLOB;
BEGIN
    SELECT descripcion INTO v_descripcion
    FROM productos
    WHERE id_producto = p_id_producto;
    RETURN v_descripcion;
END obtener_descripcion_producto;


/
--------------------------------------------------------
--  DDL for Function OBTENER_DIRECCION_USUARIO_FUNC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_DIRECCION_USUARIO_FUNC" (
    p_id_direccion IN INTEGER
) RETURN VARCHAR2 IS
    v_direccion VARCHAR2(255);
BEGIN
    SELECT direccion_linea1 INTO v_direccion
    FROM direcciones_usuarios
    WHERE id_direccion = p_id_direccion;
    RETURN v_direccion;
END obtener_direccion_usuario_func;


/
--------------------------------------------------------
--  DDL for Function OBTENER_MENSAJE_CONTACTO_FUNC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_MENSAJE_CONTACTO_FUNC" (
    p_id_mensaje IN INTEGER
) RETURN CLOB IS
    v_mensaje CLOB;
BEGIN
    SELECT mensaje INTO v_mensaje
    FROM mensajes_contacto
    WHERE id_mensaje = p_id_mensaje;
    RETURN v_mensaje;
END obtener_mensaje_contacto_func;


/
--------------------------------------------------------
--  DDL for Function OBTENER_NOMBRE_CATEGORIA
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_NOMBRE_CATEGORIA" (
    p_id_categoria IN INTEGER
) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre INTO v_nombre
    FROM categorias_productos
    WHERE id_categoria = p_id_categoria;
    RETURN v_nombre;
END obtener_nombre_categoria;


/
--------------------------------------------------------
--  DDL for Function OBTENER_NOMBRE_ESTADO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_NOMBRE_ESTADO" (
    p_id_estado IN INTEGER
) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre_estado INTO v_nombre
    FROM estados_pedidos
    WHERE id_estado = p_id_estado;
    RETURN v_nombre;
END obtener_nombre_estado;


/
--------------------------------------------------------
--  DDL for Function OBTENER_NOMBRE_PRODUCTO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_NOMBRE_PRODUCTO" (
    p_id_producto IN INTEGER
) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre INTO v_nombre
    FROM productos
    WHERE id_producto = p_id_producto;
    RETURN v_nombre;
END obtener_nombre_producto;


/
--------------------------------------------------------
--  DDL for Function OBTENER_NOMBRE_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_NOMBRE_USUARIO" (
    p_id_usuario IN INTEGER
) RETURN VARCHAR2 IS
    v_nombre VARCHAR2(100);
BEGIN
    BEGIN
        SELECT nombre_usuario INTO v_nombre
        FROM usuarios
        WHERE id_usuario = p_id_usuario;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_nombre := NULL;
    END;
    RETURN v_nombre;
END obtener_nombre_usuario;

/
--------------------------------------------------------
--  DDL for Function OBTENER_ROL_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_ROL_USUARIO" (
    p_id_usuario IN INTEGER
) RETURN VARCHAR2 IS
    v_rol VARCHAR2(50);
BEGIN
    SELECT rol INTO v_rol
    FROM usuarios
    WHERE id_usuario = p_id_usuario;
    RETURN v_rol;
END obtener_rol_usuario;

/
--------------------------------------------------------
--  DDL for Function OBTENER_TOTAL_PEDIDO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "MALPZ"."OBTENER_TOTAL_PEDIDO" (
    p_id_pedido IN INTEGER
) RETURN DECIMAL IS
    v_total DECIMAL(10, 2);
BEGIN
    SELECT total INTO v_total
    FROM pedidos
    WHERE id_pedido = p_id_pedido;
    RETURN v_total;
END obtener_total_pedido;


/
--------------------------------------------------------
--  Constraints for Table DIRECCIONES_USUARIOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."DIRECCIONES_USUARIOS" ADD PRIMARY KEY ("ID_DIRECCION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MENSAJES_CONTACTO
--------------------------------------------------------

  ALTER TABLE "MALPZ"."MENSAJES_CONTACTO" ADD PRIMARY KEY ("ID_MENSAJE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."PRODUCTOS" ADD PRIMARY KEY ("ID_PRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ESTADOS_PEDIDOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."ESTADOS_PEDIDOS" ADD PRIMARY KEY ("ID_ESTADO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."USUARIOS" ADD PRIMARY KEY ("ID_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MALPZ"."USUARIOS" ADD CONSTRAINT "UNIQUE_NOMBRE_USUARIO" UNIQUE ("NOMBRE_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TBS_PACIENTES"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORIAS_PRODUCTOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."CATEGORIAS_PRODUCTOS" ADD PRIMARY KEY ("ID_CATEGORIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INVENTARIO
--------------------------------------------------------

  ALTER TABLE "MALPZ"."INVENTARIO" ADD PRIMARY KEY ("ID_INVENTARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PEDIDOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."PEDIDOS" ADD PRIMARY KEY ("ID_PEDIDO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DETALLES_PEDIDOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."DETALLES_PEDIDOS" ADD PRIMARY KEY ("ID_DETALLE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DETALLES_PEDIDOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."DETALLES_PEDIDOS" ADD FOREIGN KEY ("ID_PEDIDO")
	  REFERENCES "MALPZ"."PEDIDOS" ("ID_PEDIDO") ENABLE;
  ALTER TABLE "MALPZ"."DETALLES_PEDIDOS" ADD FOREIGN KEY ("ID_PRODUCTO")
	  REFERENCES "MALPZ"."PRODUCTOS" ("ID_PRODUCTO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DIRECCIONES_USUARIOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."DIRECCIONES_USUARIOS" ADD FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "MALPZ"."USUARIOS" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INVENTARIO
--------------------------------------------------------

  ALTER TABLE "MALPZ"."INVENTARIO" ADD FOREIGN KEY ("ID_PRODUCTO")
	  REFERENCES "MALPZ"."PRODUCTOS" ("ID_PRODUCTO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MENSAJES_CONTACTO
--------------------------------------------------------

  ALTER TABLE "MALPZ"."MENSAJES_CONTACTO" ADD FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "MALPZ"."USUARIOS" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PEDIDOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."PEDIDOS" ADD FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "MALPZ"."USUARIOS" ("ID_USUARIO") ENABLE;
  ALTER TABLE "MALPZ"."PEDIDOS" ADD FOREIGN KEY ("ID_DIRECCION")
	  REFERENCES "MALPZ"."DIRECCIONES_USUARIOS" ("ID_DIRECCION") ENABLE;
  ALTER TABLE "MALPZ"."PEDIDOS" ADD FOREIGN KEY ("ID_ESTADO")
	  REFERENCES "MALPZ"."ESTADOS_PEDIDOS" ("ID_ESTADO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTOS
--------------------------------------------------------

  ALTER TABLE "MALPZ"."PRODUCTOS" ADD FOREIGN KEY ("ID_CATEGORIA")
	  REFERENCES "MALPZ"."CATEGORIAS_PRODUCTOS" ("ID_CATEGORIA") ENABLE;
