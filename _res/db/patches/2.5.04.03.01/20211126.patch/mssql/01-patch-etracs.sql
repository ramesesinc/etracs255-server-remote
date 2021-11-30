-- ## 2021-11-26

CREATE TABLE [sys_email_template] (
  [objid] varchar(50) NOT NULL,
  [subject] varchar(255) NOT NULL,
  [message] longtext NOT NULL,
  PRIMARY KEY (objid)
) 
go

INSERT INTO sys_email_template (objid, subject, message) 
VALUES ('business_permit', 'Business Permit ${permitno}', 'Dear valued customer, <br><br>Please see attached Business Permit document. This is an electronic transaction. Please do not reply.');
