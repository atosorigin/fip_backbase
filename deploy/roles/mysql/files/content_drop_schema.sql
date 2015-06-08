
    alter table OBJECT_DATA 
        drop 
        foreign key FK35EEB8AAF8AD2AC8;

    alter table OBJECT_DATA 
        drop 
        foreign key FK35EEB8AA1FD3CA09;

    alter table OBJECT_DATA 
        drop 
        foreign key FK35EEB8AA23EE9F15;

    alter table OBJECT_TYPE_DEFINITION 
        drop 
        foreign key FK84B3967847D86058;

    alter table PROPERTY_DATA 
        drop 
        foreign key FK7EB72FD477E6A2E1;

    alter table PROPERTY_DATA 
        drop 
        foreign key FK7EB72FD45DA1F315;

    alter table PROPERTY_DEFINITION 
        drop 
        foreign key FK403A21FDF8AD2AC8;

    alter table RENDITION 
        drop 
        foreign key FK13F83D541FD3CA09;

    alter table RENDITION 
        drop 
        foreign key FK13F83D545DA1F315;

    drop table if exists CONTENT_STREAM;

    drop table if exists OBJECT_DATA;

    drop table if exists OBJECT_TYPE_DEFINITION;

    drop table if exists PROPERTY_DATA;

    drop table if exists PROPERTY_DEFINITION;

    drop table if exists RENDITION;
