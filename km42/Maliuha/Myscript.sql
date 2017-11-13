/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     12.11.2017 22:58:02                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ORDERITE_ORDERITEM_��������') then
    alter table Orderitem
       delete foreign key FK_ORDERITE_ORDERITEM_��������
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ORDERITE_ORDERITEM_�����') then
    alter table Orderitem
       delete foreign key FK_ORDERITE_ORDERITEM_�����
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_��������_USER_ORDE_��������') then
    alter table ����������
       delete foreign key FK_��������_USER_ORDE_��������
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_�����_VENDORS_P_��������') then
    alter table �����
       delete foreign key FK_�����_VENDORS_P_��������
end if;

drop index if exists Orderitem.Orderitem_FK;

drop index if exists Orderitem.Orderitem2_FK;

drop index if exists Orderitem.Orderitem_PK;

drop table if exists Orderitem;

drop index if exists ����������.user_order_FK;

drop index if exists ����������.����������_PK;

drop table if exists ����������;

drop index if exists ����������.����������_PK;

drop table if exists ����������;

drop index if exists ������������.������������_PK;

drop table if exists ������������;

drop index if exists �����.vendors_prod_FK;

drop index if exists �����.�����_PK;

drop table if exists �����;

/*==============================================================*/
/* Table: Orderitem                                             */
/*==============================================================*/
create table Orderitem 
(
   user_login           varchar(1024)                  not null,
   order_date           date                           not null,
   vendor_login         varchar(1024)                  not null,
   prod_name            varchar(1024)                  not null,
   constraint PK_ORDERITEM primary key (user_login, order_date, vendor_login, prod_name)
);

/*==============================================================*/
/* Index: Orderitem_PK                                          */
/*==============================================================*/
create unique index Orderitem_PK on Orderitem (
user_login ASC,
order_date ASC,
vendor_login ASC,
prod_name ASC
);

/*==============================================================*/
/* Index: Orderitem2_FK                                         */
/*==============================================================*/
create index Orderitem2_FK on Orderitem (
vendor_login ASC,
prod_name ASC
);

/*==============================================================*/
/* Index: Orderitem_FK                                          */
/*==============================================================*/
create index Orderitem_FK on Orderitem (
user_login ASC,
order_date ASC
);

/*==============================================================*/
/* Table: ����������                                            */
/*==============================================================*/
create table ���������� 
(
   user_login           varchar(1024)                  not null,
   order_date           date                           not null,
   order_status         long varchar                   null,
   constraint PK_���������� primary key (user_login, order_date)
);

/*==============================================================*/
/* Index: ����������_PK                                         */
/*==============================================================*/
create unique index ����������_PK on ���������� (
user_login ASC,
order_date ASC
);

/*==============================================================*/
/* Index: user_order_FK                                         */
/*==============================================================*/
create index user_order_FK on ���������� (
user_login ASC
);

/*==============================================================*/
/* Table: ����������                                            */
/*==============================================================*/
create table ���������� 
(
   user_login           varchar(1024)                  not null,
   user_name            varchar(1024)                  null,
   user_password        varchar(1024)                  null,
   user_email           varchar(1024)                  null,
   user_phonenum        numeric(15)                    null,
   constraint PK_���������� primary key (user_login)
);

/*==============================================================*/
/* Index: ����������_PK                                         */
/*==============================================================*/
create unique index ����������_PK on ���������� (
user_login ASC
);

/*==============================================================*/
/* Table: ������������                                          */
/*==============================================================*/
create table ������������ 
(
   vendor_login         varchar(1024)                  not null,
   vendor_name          varchar(1024)                  null,
   vendor_phonenum      numeric(15)                    null,
   vendor_password      varchar(1024)                  null,
   vendor_email         varchar(1024)                  null,
   constraint PK_������������ primary key (vendor_login)
);

/*==============================================================*/
/* Index: ������������_PK                                       */
/*==============================================================*/
create unique index ������������_PK on ������������ (
vendor_login ASC
);

/*==============================================================*/
/* Table: �����                                                 */
/*==============================================================*/
create table ����� 
(
   vendor_login         varchar(1024)                  not null,
   prod_name            varchar(1024)                  not null,
   prod_price           numeric(8)                     null,
   prod_info            varchar(1024)                  null,
   constraint PK_����� primary key (vendor_login, prod_name)
);

/*==============================================================*/
/* Index: �����_PK                                              */
/*==============================================================*/
create unique index �����_PK on ����� (
vendor_login ASC,
prod_name ASC
);

/*==============================================================*/
/* Index: vendors_prod_FK                                       */
/*==============================================================*/
create index vendors_prod_FK on ����� (
vendor_login ASC
);

alter table Orderitem
   add constraint FK_ORDERITE_ORDERITEM_�������� foreign key (user_login, order_date)
      references ���������� (user_login, order_date)
      on update restrict
      on delete restrict;

alter table Orderitem
   add constraint FK_ORDERITE_ORDERITEM_����� foreign key (vendor_login, prod_name)
      references ����� (vendor_login, prod_name)
      on update restrict
      on delete restrict;

alter table ����������
   add constraint FK_��������_USER_ORDE_�������� foreign key (user_login)
      references ���������� (user_login)
      on update restrict
      on delete restrict;

alter table �����
   add constraint FK_�����_VENDORS_P_�������� foreign key (vendor_login)
      references ������������ (vendor_login)
      on update restrict
      on delete restrict;

