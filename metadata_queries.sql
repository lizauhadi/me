-- ======================================
-- DATABASE OBJECTS OVERVIEW
-- ======================================
SELECT 'TABLE' AS object_type, table_name AS object_name
FROM user_tables
UNION ALL
SELECT 'VIEW', view_name FROM user_views
UNION ALL
SELECT 'SEQUENCE', sequence_name FROM user_sequences;

-- ======================================
-- TABLE STRUCTURE: PRACOWNICY
-- ======================================
SELECT column_name, data_type, data_length, nullable, data_default
FROM user_tab_columns
WHERE table_name = 'PRACOWNICY';

-- ======================================
-- CONSTRAINTS: PRIMARY & FOREIGN KEYS
-- ======================================
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'PRACOWNICY';

-- ======================================
-- FOREIGN KEY DETAILS
-- ======================================
SELECT c.constraint_name AS fk_name,
       cc.column_name AS fk_column,
       r.table_name AS referenced_table,
       rc.column_name AS referenced_column
FROM user_constraints c
JOIN user_cons_columns cc ON c.constraint_name = cc.constraint_name
JOIN user_constraints r ON c.r_constraint_name = r.constraint_name
JOIN user_cons_columns rc ON r.constraint_name = rc.constraint_name
WHERE c.constraint_type = 'R'
AND c.table_name = 'PRACOWNICY';

-- ======================================
-- INDEXES
-- ======================================
SELECT index_name, table_name, uniqueness
FROM user_indexes;

-- ======================================
-- SEQUENCES
-- ======================================
SELECT sequence_name
FROM user_sequences;

-- ======================================
-- VIEWS
-- ======================================
SELECT view_name, text
FROM user_views;
