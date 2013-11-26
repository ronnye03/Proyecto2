-- =============================================
-- Script Template
-- =============================================
-- =============================================
-- Script Template
-- =============================================
create database dbDapIIFebrero2013
go
 
exec sp_addtype codigo ,'bigint','not null'

create table rubro (
	idrubro codigo primary key,
	nombre_rubro varchar(90)not null
)
go
create table cliente (
	idcliente codigo primary key ,
	direccion varchar (90) not null,
	telefono bigint,
	nit bigint,
	idrubro codigo references rubro (idrubro) 
)
alter table cliente drop column nombre_cliente
go 
create table juridico (
	idcliente codigo primary key references cliente (idcliente),
	Razon_social varchar(90)not null,
	Rte_legal varchar(90) not null,
	Nro_padron bigint
	)
go
create table natural (
	idcliente codigo primary key references cliente (idcliente),  
	nombre_cliente varchar(90)not null,
	app varchar (90)not null,
	apm varchar(90)not null,
	fecha_nacimiento datetime
)
go
create table cargo(
	idcargo codigo primary key,
	nombre_cargo varchar (90)not null,
	descripcion varchar (90) not null 
)
go
create table empleado(
	idempleado codigo primary key,
	nombre_empleado varchar (90)not null,
	app varchar(90)not null,
	apm varchar(90)not null,
	idcargo codigo references cargo (idcargo)
)
go
create table caja (
	idcaja codigo primary key,
	nombre_caja varchar (90)not null,
	fecha_apertura datetime not null,
	fecha_cierre datetime not null,
	idempleado codigo references empleado(idempleado)
)
go
create table transaccion (
	idtransacccion codigo primary key,
	monto bigint not null,
	fecha_hora datetime,
	idcaja codigo references caja (idcaja)
)
go
create table pedido_cliente(
	idpedido_cliente codigo primary key,
	fecha_pedido datetime not null,
	estado_pedido bigint not null check (estado_pedido=1 or estado_pedido=2),
	total_pedido float,
	idcliente codigo references cliente(idcliente),
	idproducto codigo references producto(idproducto)
)
go
create table categoria(
	idcategoria codigo primary key,
	nombre_categoria varchar(90),
	descripcion varchar (90),
)
go 
create table subcategoria(
	idsubcategoria codigo primary key,
	nombre_subcategoria varchar (90) not null,
	descripcion varchar (90) not null,
	idcategoria codigo references categoria(idcategoria)
)
go
create table producto(
	idproducto codigo primary key,
	nombre_producto varchar(90),
	precio_venta float not null,
	stock float not null,
	Nombre_imagen varchar(90),
	img1 varbinary(max),
	extension varchar(90),
	idsubcategoria codigo references subcategoria (idsubcategoria)
)
alter table producto add Nombre_imagen varchar(90)
alter table producto add img1 varbinary(max)
alter table producto add extension varchar(90)

go 
create table credito(
	idcredito codigo primary key,
	monto float not null,
	fecha_desembolso datetime not null,
	interes_mensual float not null,
	plazo_meses tinyint not null,
	idpedido_cliente codigo references pedido_cliente (idpedido_cliente)
)
go
create table cuota(
	idcuota codigo primary key,
	monto_capital float not null,
	monto_interes float not null,
	total_cuota as (monto_capital + monto_interes),
	fecha_pagoprogramada datetime not null,
	fecha_pago_total datetime,
	idcredito codigo references credito(idcredito)
)
go
create table detalle_pedido(
	idpedido_cliente codigo references pedido_cliente(idpedido_cliente),
	idproducto codigo references producto (idproducto),
	constraint pkdetallepedido primary key(idpedido_cliente,idproducto),
	cantidad float not null,
	precio float not null,
	subtotal as (cantidad * precio)  
)














