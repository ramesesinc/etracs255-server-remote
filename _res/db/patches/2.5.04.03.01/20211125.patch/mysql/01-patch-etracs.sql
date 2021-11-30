-- ## 2021-11-25

-- create table online_business_application_doc (
--   objid varchar(50) not null, 
--   parentid varchar(50) not null, 
--   doc_type varchar(50) not null, 
--   doc_title varchar(255) not null, 
--   attachment_objid varchar(50) not null,
--   attachment_name varchar(255) not null, 
--   attachment_path varchar(255) not null,
--   fs_filetype varchar(10) not null, 
--   fs_filelocid varchar(50) null, 
--   fs_fileid varchar(50) null, 
--   lockid varchar(50) null, 
--   constraint pk_online_business_application_doc PRIMARY KEY (`objid`) 
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- ;
-- create index ix_parentid on online_business_application_doc (parentid)
-- ;
-- create index ix_attachment_objid on online_business_application_doc (attachment_objid)
-- ;
-- create index ix_fs_filelocid on online_business_application_doc (fs_filelocid)
-- ;
-- create index ix_fs_fileid on online_business_application_doc (fs_fileid)
-- ;
-- create index ix_lockid on online_business_application_doc (lockid)
-- ;
-- alter table online_business_application_doc 
--   add CONSTRAINT fk_online_business_application_doc_parentid 
--   FOREIGN KEY (`parentid`) REFERENCES `online_business_application` (`objid`)
-- ; 


-- CREATE TABLE `online_business_application_doc_fordownload` (
--   `objid` varchar(50) NOT NULL,
--   `scheduledate` datetime NOT NULL,
--   `msg` text NULL,
--   `filesize` int NOT NULL DEFAULT '0',
--   `bytesprocessed` int NOT NULL DEFAULT '0',
--   `lockid` varchar(50) NULL,
--   constraint pk_online_business_application_doc_fordownload PRIMARY KEY (`objid`) 
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- ;
-- create index ix_scheduledate on online_business_application_doc_fordownload (scheduledate)
-- ;
-- create index ix_lockid on online_business_application_doc_fordownload (lockid)
-- ;
-- alter table online_business_application_doc_fordownload 
--   add CONSTRAINT `fk_online_business_application_doc_fordownload_objid` 
-- 	FOREIGN KEY (`objid`) REFERENCES `online_business_application_doc` (`objid`)
-- ; 



CREATE TABLE `sys_fileloc` (
  `objid` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `rootdir` varchar(255) NULL,
  `defaultloc` int NOT NULL,
  `loctype` varchar(20) NULL,
  `user_name` varchar(50) NULL,
  `user_pwd` varchar(50) NULL,
  `info` text,
  constraint pk_sys_fileloc PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create index `ix_loctype` on sys_fileloc (`loctype`)
;

CREATE TABLE `sys_file` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) NULL,
  `filetype` varchar(50) NULL,
  `dtcreated` datetime NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(255) NULL,
  `keywords` varchar(255) NULL,
  `description` text,
  constraint pk_sys_file PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create index `ix_dtcreated` on sys_file (`dtcreated`)
;
create index `ix_createdby_objid` on sys_file (`createdby_objid`)
;
create index `ix_keywords` on sys_file (`keywords`)
;
create index `ix_title` on sys_file (`title`)
;

CREATE TABLE `sys_fileitem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NULL,
  `parentid` varchar(50) NULL,
  `dtcreated` datetime NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(255) NULL,
  `caption` varchar(155) NULL,
  `remarks` varchar(255) NULL,
  `filelocid` varchar(50) NULL,
  `filesize` int NULL,
  `thumbnail` text,
  constraint pk_sys_fileitem PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create index `ix_parentid` on sys_fileitem (`parentid`)
;
create index `ix_filelocid` on sys_fileitem (`filelocid`)
;
alter table sys_fileitem 
  add CONSTRAINT `fk_sys_fileitem_parentid` 
  FOREIGN KEY (`parentid`) REFERENCES `sys_file` (`objid`)
;
