CREATE SCHEMA `motel` ;
use motel;
/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   IDCLIENTE            INT                not null,
   NOMBRECLIENTE        VARCHAR(40)          null,
   APELLIDOCLIENTE      VARCHAR(40)          null,
   GENERO               VARCHAR(30)          null,
   CEDULACLIENTE        Int                 null,
   CORREOELECTRONICO    VARCHAR(40)          null,
   NUMEROTELEFONICO     INT                 null,
   constraint PK_CLIENTE primary key (IDCLIENTE)
);

insert into CLIENTE Values (1, 'Victor', 'Lopez', 'Masculino', 1314750603, 'emelecestodo@gmail.com', 0968099926);
insert into CLIENTE Values (2, 'Kelvin', 'Lopez', 'Masculino', 1314750604, 'barceestodo@gmail.com',  0968088827);
insert into CLIENTE Values (3, 'Ancode', 'Velez', 'Femenino',  1325896324,     'ancodeo@gmail.com',  0948089926);
insert into CLIENTE Values (4, 'Jeffer', 'Parrales', 'Masculino', 1314589654, 'fusilero@gmail.com',  0968033926);
/*==============================================================*/
/* Table: EMPLEADO                                               */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          INT                  not null,
   NOMBREEMPLEADO       VARCHAR(40)          null,
   APELLIDO_EMPLEADO    VARCHAR(40)          null,
   CEDULA_EMPLEADO      INT                  null,
   CORREO_EMPLEADO      VARCHAR(40)          null,
   EDAD_EMPLEADO        INT                  null,
   GENERO_EMPLEADO      VARCHAR(15)          null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);
insert into EMPLEADO Values (1, 'Freddy', 'Crude',    1314456785, 'freddy@gmail.com', 30, 'Masculino');
insert into EMPLEADO Values (2, 'Maria', 'Pancracia', 1315556754, 'pancracia@gmail.com', 25, 'Femenino');

/*==============================================================*/
/* Table: RESERVACIONES                                         */
/*==============================================================*/
create table RESERVACIONES (
   IDRESERVACIONES      INT                 not null,
   ID_EMPLEADO          INT                 null,
   FECHADERESERVACION   DATE                 null,
   DETALLE_RESERVACION  VARCHAR(50)          null,
   FECHA_INCIO          DATE                 null,
   FECHA_FINAL          DATE                 null,
   N_PERSONAS           INT     	 null,
   constraint PK_RESERVACIONES primary key (IDRESERVACIONES)
);
alter table RESERVACIONES
   add constraint FK_RESERVAC_RELATIONS_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;
insert into RESERVACIONES Values (1, 1, '2020-05-07', 'Habitacion ocupada', '2020-05-07', '2020-05-07', 2);
insert into RESERVACIONES Values (2, 1, '2020-05-08', 'Habitacion ocuapda', '2020-05-08', '2020-05-08', 2);
insert into RESERVACIONES Values (3, 2, '2020-05-09', 'Habitacion ocuapda', '2020-05-09', '2020-05-09', 2);
insert into RESERVACIONES Values (4, 2, '2020-05-10', 'Habitacion ocuapda', '2020-05-10', '2020-05-10', 2);
insert into RESERVACIONES Values (5, 1, '2020-05-20', 'Habitacion ocuapda', '2020-05-20', '2020-05-20', 2);
insert into RESERVACIONES Values (6, 2, '2020-05-29', 'Habitacion ocuapda', '2020-05-29', '2020-05-29', 2);


/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   IDHABITACION         INT                 not null,
   IDRESERVACIONES      INT                 null,
   NUMERO_HABITACION    INT                 null,
   ESTADO_HABITACION    VARCHAR(40)         null,
   DESCRIPCION_HABITACION VARCHAR(40)       null,
   NUMERO_CAMA          INT                 null,
   constraint PK_HABITACION primary key (IDHABITACION)
);

alter table HABITACION
   add constraint FK_HABITACI_RELATIONS_RESERVAC foreign key (IDRESERVACIONES)
      references RESERVACIONES (IDRESERVACIONES)
      on delete restrict on update restrict;
      
insert into HABITACION Values(1, 1, 11, 'Disponible', 'HABITACION VIP',1);
insert into HABITACION Values(2, 2, 22, 'Disponible', 'HABITACION SIMPLE', 2);
insert into HABITACION Values(3, 3,	33, 'Disponible', 'HABITACION MEDIA', 3);
insert into HABITACION Values(4, 4, 69, 'Disponible', 'HABITACION VIP', 4);

/*==============================================================*/
/* Table: METODO_PAGO                                           */
/*==============================================================*/
create table METODO_PAGO (
   ID                   INT                 not null,
   IDRESERVACIONES      INT                 null,
   EFECTIVO             FLOAT               null,
   TARJETA_CREDITO      FLOAT               null,
   constraint PK_METODO_PAGO primary key (ID)
);
alter table METODO_PAGO
   add constraint FK_METODO_P_RELATIONS_RESERVAC foreign key (IDRESERVACIONES)
      references RESERVACIONES (IDRESERVACIONES)
      on delete restrict on update restrict;
insert into METODO_PAGO Values(1, 1, 20.50, 25.00);
insert into METODO_PAGO Values(2, 2, 25.50, 30.00);
insert into METODO_PAGO Values(3, 3, 30.50, 36.00);
insert into METODO_PAGO Values(4, 4, 35.50, 38.00);

/*==============================================================*/
/* Table: RELATIONSHIP_1                                        */
/*==============================================================*/
create table Cliente_Reservaciones (
   IDCLIENTE            INT                 not null,
   IDRESERVACIONES      INT                 not null,
   constraint PK_RELATIONSHIP_1 primary key (IDCLIENTE, IDRESERVACIONES)
);
alter table Cliente_Reservaciones
   add constraint FK_RELATION_RELATIONS_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE)
      on delete restrict on update restrict;

alter table Cliente_Reservaciones
   add constraint FK_RELATION_RELATIONS_RESERVAC foreign key (IDRESERVACIONES)
      references RESERVACIONES (IDRESERVACIONES)
      on delete restrict on update restrict;
insert into Cliente_Reservaciones Values (1, 1);
insert into Cliente_Reservaciones Values (2, 2);
insert into Cliente_Reservaciones Values (3, 3);
insert into Cliente_Reservaciones Values (4, 4);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS (
   ID_SERVICIO          INT                 not null,
   NOMBRE_SERVICIO      varchar(60)         null,
   constraint PK_SERVICIOS primary key (ID_SERVICIO)
);
insert into SERVICIOS Values(1, 'SERVICIO DE TV SATELITAL' );
insert into SERVICIOS Values(2, 'SERVICIO DE LENCERIA' );
insert into SERVICIOS Values(3, 'SERVICIO DE INTERNET' );
insert into SERVICIOS Values(4, 'SERVICIO DE JACUZZI' );
insert into SERVICIOS Values(5, 'SERVICIO DE JUGUETES SEXUALES' );
insert into SERVICIOS Values(6, 'SERVICIO DE PRSERVATIVOS' );

/*==============================================================*/
/* Table: HABITACION_SERVICIO                                   */
/*==============================================================*/
create table HABITACION_SERVICIO (
	HABITACION_ID        INT            not	null,
	SERVICIO_ID          INT       		not null,
    constraint PK_RELATIONS_HABITACION_SERV primary key (HABITACION_ID, SERVICIO_ID)
);
alter table HABITACION_SERVICIO
   add constraint FK_SERVICIO_RELATIONS_SERVICIO foreign key (SERVICIO_ID)
      references SERVICIOS (ID_SERVICIO)
      on delete restrict on update restrict;

alter table HABITACION_SERVICIO
   add constraint FK_SERVICIO_RELATIONS_HABITACION foreign key (HABITACION_ID)
      references HABITACION (IDHABITACION)
      on delete restrict on update restrict;

insert into HABITACION_SERVICIO Values(1, 2);
insert into HABITACION_SERVICIO Values(2, 3);
insert into HABITACION_SERVICIO Values(3, 4);
insert into HABITACION_SERVICIO Values(4, 5);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION (
   calificacion      	INT         	not null,
   desc_calificacion    varchar(20)     not null,
   constraint pk_calificacion primary key (calificacion)
);
insert into CALIFICACION Values (1, 'muy malo');
insert into CALIFICACION Values (2, 'malo');
insert into CALIFICACION Values (3, 'regular');
insert into CALIFICACION Values (4, 'bueno');
insert into CALIFICACION Values (5, 'exelente');

/*==============================================================*/
/* Table: CALIFICACION_SERVICIO                                 */
/*==============================================================*/
create table CALIFICACION_SERVICIO (
   id_cliente    		int     		not null,
   id_reserva			int				not null,
   id_servicio			int				not null,
   id_calificacion		int				not null
);

alter table CALIFICACION_SERVICIO
   add constraint FK_HABITACI_RELATIONS_CLIENTE foreign key (id_cliente)
      references CLIENTE (IDCLIENTE)
      on delete restrict on update restrict;

alter table CALIFICACION_SERVICIO
   add constraint FK_CALIFICACION_RELATIONS_SERVICIO foreign key (id_servicio)
      references SERVICIOS (ID_SERVICIO)
      on delete restrict on update restrict;
      
alter table CALIFICACION_SERVICIO
   add constraint FK_CALIFICACION_RELATIONS_CALIFICACION foreign key (id_calificacion)
      references CALIFICACION (calificacion)
      on delete restrict on update restrict;

insert into CALIFICACION_SERVICIO Values (1, 1, 1, 2);
insert into CALIFICACION_SERVICIO Values (2, 2, 2, 3);
insert into CALIFICACION_SERVICIO Values (3, 3, 3, 3);
insert into CALIFICACION_SERVICIO Values (3, 4, 4, 4);
insert into CALIFICACION_SERVICIO Values (4, 5, 5, 4);
insert into CALIFICACION_SERVICIO Values (4, 6, 6, 5);