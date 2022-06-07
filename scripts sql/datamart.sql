CREATE SCHEMA `calidad_servicio` ;
use calidad_servicio;
create table hec_calidad_servicio (
	hecho			int 		not null,
	id_tiempo       int        	not null,
	id_servicio     int        	not null,
    id_calificacion int			not null,
	constraint pk_hecho primary key (hecho)
);
create table dim_tiempo (
   id_tiempo            INT          not null,
   fecha_visita        	date         not null,
   constraint pk_tiempo primary key (id_tiempo)
);
create table dim_servicio (
   id_servicio          int         	not null,
   nombre_servicio     	varchar(30)     not null,
   constraint pk_servicio primary key (id_servicio)
);
create table dim_calificacion (
   calificacion      	int         	not null,
   desc_calificacion    varchar(20)     not null,
   pon_calificacion		int				not null,
   constraint pk_calificacion primary key (calificacion)
);

alter table hec_calidad_servicio
   add constraint FK_SERVICIO_RELATIONS_CALIF foreign key (id_calificacion)
      references dim_calificacion (calificacion)
      on delete restrict on update restrict;
      
alter table hec_calidad_servicio
   add constraint FK_SERVICIO_RELATIONS_SERV foreign key (id_servicio)
      references dim_servicio (id_servicio)
      on delete restrict on update restrict;
      
alter table hec_calidad_servicio
   add constraint FK_SERVICIO_RELATIONS_TIEMPO foreign key (id_tiempo)
      references dim_tiempo (id_tiempo)
      on delete restrict on update restrict;