
-- regions
CREATE TABLE regions
  (
    region_id NUMBER(10) NOT NULL,
    region_name VARCHAR2( 50 ) NOT NULL
  );

ALTER TABLE regions ADD (CONSTRAINT regions_pk PRIMARY KEY (region_id));
/