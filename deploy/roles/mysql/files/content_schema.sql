
    create table CONTENT_STREAM (
        id bigint not null auto_increment,
        CONTENT longblob not null,
        primary key (id)
    );

    create table OBJECT_DATA (
        id bigint not null auto_increment,
        objectDataPath varchar(765) not null,
        versionLabel varchar(255),
        versionSeriesId varchar(255),
        objectId varchar(255) not null unique,
        isLatestVersion varchar(255),
        OBJECT_TYPE_ID bigint not null,
        PARENT_ID bigint,
        CS_ID bigint,
        uniquePathCheck varchar(64) not null unique,
        primary key (id)
    );

    create table OBJECT_TYPE_DEFINITION (
        id bigint not null auto_increment,
        baseType varchar(255) not null,
        contentStreamAllowed varchar(255),
        creatable bit,
        description varchar(255),
        displayName varchar(255),
        fileable bit,
        fullTextIndexed bit,
        localName varchar(255),
        localNamespace varchar(255),
        objectId varchar(255) not null unique,
        PARENT_ID bigint,
        queryName varchar(255),
        queryable bit,
        versionable bit,
        primary key (id)
    );

    create table PROPERTY_DATA (
        id bigint not null auto_increment,
        displayName varchar(255),
        localName varchar(255),
        OBJECT_DATA_ID bigint not null,
        objectId varchar(255) not null,
        PROPERTY_DEFINITION_ID bigint not null,
        queryName varchar(255),
        value varchar(765),
        primary key (id)
    );

    create table PROPERTY_DEFINITION (
        id bigint not null auto_increment,
        cardinality varchar(255),
        description varchar(255),
        displayName varchar(255),
        inherited bit,
        localName varchar(255),
        localNamespace varchar(255),
        objectId varchar(255) not null,
        OBJECT_TYPE_ID bigint not null,
        orderable bit,
        queryName varchar(255),
        queryable bit,
        required bit,
        type varchar(255) not null,
        updatability varchar(255),
        primary key (id)
    );

    create table RENDITION (
        id bigint not null auto_increment,
        filePath varchar(765),
        height decimal(19,2),
        kind varchar(255),
        length decimal(19,2),
        mimeType varchar(255),
        OBJECT_DATA_ID bigint not null,
        renditionDocumentId varchar(255),
        title varchar(255),
        width decimal(19,2),
        objectId varchar(255) not null,
        streamId varchar(255) not null,
        CS_ID bigint,
        primary key (id)
    );

    create index ODPATH_IDX on OBJECT_DATA (objectDataPath(255));

    create index ODILV_IDX on OBJECT_DATA (isLatestVersion);

    create index ODVL_IDX on OBJECT_DATA (versionLabel);

    create index FK_OD_IDX_CS_ID on OBJECT_DATA (CS_ID);

    create index ODVSID_IDX on OBJECT_DATA (versionSeriesId);

    create index FK_OD_IDX_OBJECT_TYPE_ID on OBJECT_DATA (OBJECT_TYPE_ID);

    create index FK_OD_IDX_PARENT on OBJECT_DATA (PARENT_ID);

    alter table OBJECT_DATA 
        add constraint FK35EEB8AAF8AD2AC8 
        foreign key (OBJECT_TYPE_ID) 
        references OBJECT_TYPE_DEFINITION (id);

    alter table OBJECT_DATA 
        add constraint FK35EEB8AA1FD3CA09 
        foreign key (CS_ID) 
        references CONTENT_STREAM (id);

    alter table OBJECT_DATA 
        add constraint FK35EEB8AA23EE9F15 
        foreign key (PARENT_ID) 
        references OBJECT_DATA (id);

    create index FK_OTD_IDX_PARENT on OBJECT_TYPE_DEFINITION (PARENT_ID);

    alter table OBJECT_TYPE_DEFINITION 
        add constraint FK84B3967847D86058 
        foreign key (PARENT_ID) 
        references OBJECT_TYPE_DEFINITION (id);

    create index FK_PD_IDX_OBJECTID on PROPERTY_DATA (objectId);

    create index FK_PD_IDX_OBJECT_DATA_ID on PROPERTY_DATA (OBJECT_DATA_ID);

    create index FK_PD_IDX_PROP_DEF_ID on PROPERTY_DATA (PROPERTY_DEFINITION_ID);

    alter table PROPERTY_DATA 
        add constraint FK7EB72FD477E6A2E1 
        foreign key (PROPERTY_DEFINITION_ID) 
        references PROPERTY_DEFINITION (id);

    alter table PROPERTY_DATA 
        add constraint FK7EB72FD45DA1F315 
        foreign key (OBJECT_DATA_ID) 
        references OBJECT_DATA (id);

    create index FK_PDEF_IDX_OBJECT_TYPE_ID on PROPERTY_DEFINITION (OBJECT_TYPE_ID);

    create index FK_PDEF_IDX_OBJ_ID on PROPERTY_DEFINITION (objectId);

    alter table PROPERTY_DEFINITION 
        add constraint FK403A21FDF8AD2AC8 
        foreign key (OBJECT_TYPE_ID) 
        references OBJECT_TYPE_DEFINITION (id);

    create index FK_RND_IDX_CONTENT_STREAM_ID on RENDITION (CS_ID);

    create index FK_RND_IDX_OBJECT_DATA_ID on RENDITION (OBJECT_DATA_ID);

    alter table RENDITION 
        add constraint FK13F83D541FD3CA09 
        foreign key (CS_ID) 
        references CONTENT_STREAM (id);

    alter table RENDITION 
        add constraint FK13F83D545DA1F315 
        foreign key (OBJECT_DATA_ID) 
        references OBJECT_DATA (id);
