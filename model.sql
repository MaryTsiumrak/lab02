DROP TABLE objects;
DROP TABLE object_types;
DROP TABLE params; 
DROP TABLE attributes;
DROP TABLE role;

CREATE TABLE objects (
       object_id            NUMBER(20,0)NOT NULL,
       parent_id            NUMBER(20,0) NULL,
       type_id              NUMBER(20,0) NULL,
       obj_name             VARCHAR2(100) NULL
);


CREATE TABLE object_types (
       type_id              NUMBER (20,0)NOT NULL,
       parent_id            NUMBER(20,0) NULL,
       type_name            VARCHAR2(100) NULL,
       description          VARCHAR2(1000) NULL
);


CREATE TABLE params (
       params_id            NUMBER(20,0) NOT NULL,
       object_id            NUMBER(20,0) NOT NULL,
       params_value         NUMBER(20,0) NULL,
       data                 CLOB NULL
);


CREATE TABLE attributes (
       params_id            NUMBER(20,0) NOT NULL,
       type_id              NUMBER(20,0) NOT NULL,
       obj_name             VARCHAR2(100) NULL,
       description          VARCHAR2(1000) NULL
);

CREATE TABLE role (
       object_id            NUMBER(20,0)NOT NULL,
       obj_name             VARCHAR2(100) NULL,
       read                 NUMBER NOT NULL,
       write                NUMBER NOT NULL
);


ALTER TABLE objects  
            ADD CONSTRAINT object_pk 
            PRIMARY KEY(object_id);
ALTER TABLE object_types 
            ADD CONSTRAINT object_types_pk 
            PRIMARY KEY(type_id);
ALTER TABLE params  
            ADD CONSTRAINT params_pk 
            PRIMARY KEY(params_id);                       
ALTER TABLE attributes  
            ADD CONSTRAINT attributes_pk 
            PRIMARY KEY(params_id);  
   
              
ALTER TABLE object_types
       ADD  (FOREIGN KEY (parent_id)
            REFERENCES object_types);
ALTER TABLE objects
       ADD  (FOREIGN KEY (parent_id)
            REFERENCES objects);
ALTER TABLE objects
       ADD  (FOREIGN KEY (type_id)
            REFERENCES object_types); 
ALTER TABLE params
       ADD  (FOREIGN KEY (object_id)
            REFERENCES objects);

ALTER TABLE role
       ADD  (FOREIGN KEY (object_id)
            REFERENCES objects);

         