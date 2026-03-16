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
    BRIEF_DESCRIPTION VARCHAR(2000),
    ATTACHMENTS VARCHAR(1000)
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
(   'FRLC', 
    '01CASECN_U01,01CASECN_U02', 
    'OCC', 
    10, 
    'OFFERED_CAPACITY = REGISTERED_CAPACITY', 
    'Usual', 
    'OTHER CAUSES', 
    'Erroneous Flag. The unit was complying with OCC rule and was offering its registered capacity of 82.5 MW', 
    'NONE'),
    
(   'FRLC', 
    '01CASECN_U01,01CASECN_U02', 
    'OCC', 
    20, 
    'TOTAL_OFFERED_CAPACITY <= SEASONAL_MAX_CAPABILITY AND HAS_OUTAGE = 0', 
    'Usual', 
    'RESOURCE CONSTRAINTS-HYDRO', 
    'Water Level and Inflow Constraint. The nomination of the Casecnan Hydroelectric Power Plant is based on the availability of water for electricity generation. 
    
    Seasonal Deration. Maximum allowable generation for Casecnan units is affected by net head elevation of Casecnan. This net head is derived from the difference between Casecnan Head pond elevation and its Tail race elevation (equivalent to Pantabangan reservoir elevation). Refer to attached CHEPP Plant Capability with Seasonal Deration for reference.', 
    'Actual Dispatch Report. 
CHEPP Plant Capability with Seasonal Deration.'),
(   'FGHPC','01PNTBNG_U01,01PNTBNG_U02','OCC',10,'OFFERED_CAPACITY = REGISTERED_CAPACITY','Usual','OTHER CAUSES','Erroneous Flag. The unit was complying with OCC rule and was offering its registered capacity of 60 MW','NONE'),

(   'FGHPC','01PNTBNG_U01,01PNTBNG_U02','OCC',20,'OFFERED_CAPACITY = 0 AND IDR = 0 AND HAS_OUTAGE = 0','Usual','RESOURCE CONSTRAINTS-HYDRO','Water Level and Irrigation Diversion Requirement Constraint. Please refer to items C.1, C.2, C.3 of the attached affidavit. No generation on PHEPP due to inability of MHEPP to generate brought by zero IDR and water discharge. Please refer to the attached DOR for IDR, and Pantabangan & Masiway dam elevation.','Notice of IDR
 FGHPC DOR'),

(   'FGHPC','01PNTBNG_U01,01PNTBNG_U02','OCC',30,'OFFERED_CAPACITY = 0 AND IDR < 10 AND HAS_OUTAGE = 0','Usual','RESOURCE CONSTRAINTS-HYDRO','Water Level and Irrigation Diversion Requirement Constraint. Please refer to items C.1, C.2, C.3 of the submitted affidavit.
 
 No generation on PHEPP due to inability of MHEPP to generate brought by very low IDR and water discharge. Please refer to the attached DOR for IDR, and Pantabangan & Masiway dam elevation.','Notice of IDR
 FGHPC DOR
 Daily Gen'),
(   'FGHPC','01PNTBNG_U01,01PNTBNG_U02','OCC',40,'OFFERED_CAPACITY >= 0 AND IDR >= 10 AND HAS_OUTAGE = 0','Usual','RESOURCE CONSTRAINTS-HYDRO','For intervals with AS AGC Operation: To prevent possible failure acquired when lower commands are issued from the high limit as basepoint, the unit to be scheduled as AGC shall have a maximum limit of 1MW lower than the expected capability due to the current water elevation. Please refer to the attached FGHPC AGC Test Result. Under page 6, Item 2 of Operations Recommendation from NGCP.

Water Level and Irrigation Diversion Requirement Constraint. Please refer to items C.1, C.2, C.3  of the submitted affidavit.

For intervals with zero offers, this was due to the projected Masiway elevation at the end of the trading day. PHEPP units must always operate within the prescribed safety limits of Masiway. In compliance with the Irrigation Diversion Requirement (IDR), and to prevent Masiway Dam from exceeding its maximum elevation, Pantabangan generation was deliberately limited and strategically allocated to intervals with higher electricity demand. Supporting details on Masiway Dam elevation are provided in the attached DOR and Daily Gen file.

Section 3.1.  PHEPP cannot operate at 120MW if the level of the water at the Pantabangan reservoir is below two hundred seven (207) meters above sea level.','Notice of IDR
 FGHPC DOR
 PHEPP AGC Test Report'),
(   'FGHPC','01PNTBNG_U01,01PNTBNG_U02','OCC',50,'OFFERED_CAPACITY = 0 AND IDR >= 10 AND HAS_OUTAGE = 1','Usual','OUTAGE','NA','NA'),
(   'FGHPC','01MASIWA_G01','OCC',10,'OFFERED_CAPACITY = REGISTERED_CAPACITY','Usual','OTHER CAUSES','Erroneous Flag. The unit was complying with OCC rule and was offering its registered capacity of 12 MW','NONE'),
(   'FGHPC','01MASIWA_G01','OCC',20,'OFFERED_CAPACITY = 0 AND IDR = 0 AND HAS_OUTAGE = 0','Usual','RESOURCE CONSTRAINTS-HYDRO','Water Level and Irrigation Diversion Requirement Constraint. Please refer to items C.1, C.2, C.3 of the submitted affidavit.
 
 Zero Irrigation Diversion Requirement (IDR) and water discharge. The dispatch of MHEPP is highly dependent on the IDR and water discharge, water flow through the turbines and the water level at the Masiway reservoir. Please refer to the attached DOR for the IDR and Masiway dam elevation.','Notice of IDR
 FGHPC DOR'),
(   'FGHPC','01MASIWA_G01','OCC',30,'OFFERED_CAPACITY > 0 AND IDR > 0 AND HAS_OUTAGE = 0','Usual','RESOURCE CONSTRAINTS-HYDRO','Water Level and Irrigation Diversion Requirement Constraint. Please refer to items C.1, C.2, C.3 of the submitted affidavit. The dispatch of MHEPP is highly dependent on the IDR and water discharge, water flow through the turbines and the water level at the Masiway reservoir. Please refer to the attached DOR for the IDR and Masiway dam elevation.','Notice of IDR
 FGHPC DOR'),
(   'FGHPC','01MASIWA_G01','OCC',40,'OFFERED_CAPACITY = 0 AND IDR >= 0 AND HAS_OUTAGE = 1','Usual','OUTAGE','NA','NA');

















SELECT * FROM OCC_CTRL_REF;

SELECT * FROM OCC_CTRL_REF
LIMIT 2;

TRUNCATE TABLE OCC_CTRL_REF;

INSERT INTO OCC_CTRL_REF
VALUES('FRLC', 
    '01CASECN_U01,01CASECN_U02', 
    'OCC', 
    30, 
    '1=1', 
    'Usual', 
    'TESTING', 
    'Currently testing control table', 
    'NONE');
