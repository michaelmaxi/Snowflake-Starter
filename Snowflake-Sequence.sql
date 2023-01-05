
---What are sequences in Snowflake? Sequences are used to generate unique numbers across sessions and statements, including concurrent statements.

CREATE OR REPLACE SEQUENCE seq_01 
    START = 1 
    INCREMENT = 1;

SELECT seq_01.NEXTVAL;

SELECT seq_01.NEXTVAL;

CREATE OR REPLACE TABLE sequence_test_table (i INTEGER);

INSERT INTO sequence_test_table (i) VALUES (seq_01.NEXTVAL);

SELECT *
FROM SEQUENCE_TEST_TABLE;

