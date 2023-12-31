CREATE TABLE SALESREPS

(EMPL_NUM INTEGER NOT NULL,

CHECK (EMPL_NUM BETWEEN 101 AND 199),

NAME VARCHAR(15) NOT NULL,

AGE INTEGER,

REP_OFFICE INTEGER,

TITLE VARCHAR(10),

HIRE_DATE DATETIME NOT NULL,

MANAGER INTEGER,

QUOTA MONEY,

SALES MONEY NOT NULL,

PRIMARY KEY (EMPL_NUM),

FOREIGN KEY (MANAGER)

REFERENCES SALESREPS

ON DELETE NO ACTION,

CONSTRAINT WORKSIN FOREIGN KEY (REP_OFFICE)

REFERENCES OFFICES

ON DELETE SET NULL)