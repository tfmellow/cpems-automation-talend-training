USE DATABASE DEV;
USE SCHEMA MAPPING;

CREATE OR REPLACE TABLE OCC_CTRL_REF (
    PLANT_ENTITY VARCHAR(100),
    RESOURCE_ID VARCHAR(255),
    COMPLIANCE_TYPE VARCHAR(100),
    LOGIC_PRIORITY INTEGER,
    COMPLIANCE_LOGIC VARCHAR(1000),
    ENTRY_TAG VARCHAR(100),
    REASONS VARCHAR(255),
    BRIEF_DESCRIPTION VARCHAR(1000),
    ATTACHMENTS VARCHAR(500)
);

INSERT INTO OCC_CTRL_REF (  
    PLANT_ENTITY, 
    RESOURCE_ID, 
    COMPLIANCE_TYPE, 
    LOGIC_PRIORITY,
    COMPLIANCE_LOGIC, 
    ENTRY_TAG,
    REASONS,
    BRIEF_DESCRIPTION,
    ATTACHMENTS
)

VALUES 
('FRLC', '01CASECN_U01,01CASECN_U02', 'OCC', 10, 'OFFERED_CAPACITY = REGISTERED_CAPACITY', 'Usual', 'OTHER CAUSES', 'Erroneous Flag. The unit was complying with OCC rule and was offering its registered capacity of 82.5 MW', 'NONE'),
('FRLC', '01CASECN_U01,01CASECN_U02', 'OCC', 20, 'TOTAL_OFFERED_CAPACITY <= SEASONAL_MAX_CAPABILITY AND HAS_OUTAGE = 0', 'Usual', 'RESOURCE CONSTRAINTS HYDRO', 'Water Level and Inflow Constraint. TQhe nomination of the Casecnan Hydroelectric Power Plant is based on the availability of water for electricity generation.

Seasonal Deration. Maximum allowable generation for Casecnan units is affected by net head elevation of Casecnan. This net head is derived from the difference between Casecnan Head pond elevation and its Tail race elevation (equivalent to Pantabangan reservoir elevation). Refer to attached CHEPP Plant Capability with Seasonal Deration for reference.', 'Actual Dispatch Report. 
CHEPP Plant Capability with Seasonal Deration.');


CREATE OR REPLACE TABLE OCC_DATA (
    ID INTEGER,
    RESOURCE_ID VARCHAR(255),
    CLASSIFY VARCHAR(255), -- CLASSIFICATION COLUMN
    TRADING_HOUR TIMESTAMP_NTZ,
    PROBABLE_BREACH_FLAG INTEGER,
    VIOLATION_TYPE INTEGER,
    REASON VARCHAR(255),
    DATE_FROM TIMESTAMP_NTZ,
    DATE_TO TIMESTAMP_NTZ,
    BRIEF_DESCRIPTION VARCHAR(1000),
    ATTACHMENTS VARCHAR(500), -- FILE COLUMN
    STATUS VARCHAR(255),
    REGISTERED_CAPACITY FLOAT,
    OFFERED_CAPACITY FLOAT,
    TOTAL_OFFERED_CAPACITY FLOAT,
    SEASONAL_MAX_CAPABILITY INTEGER,
    HAS_OUTAGE INTEGER
);


SELECT * FROM OCC_CTRL_REF
LIMIT 2;

SELECT * FROM OCC_DATA
LIMIT 2;

-- DROP TABLE OCC_CTRL_REF;
-- DROP TABLE OCC_DATA;