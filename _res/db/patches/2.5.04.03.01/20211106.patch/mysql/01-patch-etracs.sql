-- ## 2021-11-06

INSERT INTO sys_usergroup (objid, title, domain, userclass, orgclass, role) 
VALUES ('TREASURY.MANAGER', 'TREASURY MANAGER', 'TREASURY', 'usergroup', NULL, 'MANAGER');

INSERT INTO sys_var (name, value, description, datatype, category) 
VALUES ('treasury_remote_orgs', '', NULL, 'text', 'TC');


update remittance_af raf, af_control_detail d set 
  raf.controlid = d.controlid, 
  raf.receivedstartseries = d.receivedstartseries, 
  raf.receivedendseries = d.receivedendseries, 
  raf.qtyreceived = d.qtyreceived, 
  raf.beginstartseries = d.beginstartseries, 
  raf.beginendseries = d.beginendseries, 
  raf.qtybegin = d.qtybegin, 
  raf.issuedstartseries = d.issuedstartseries, 
  raf.issuedendseries = d.issuedendseries, 
  raf.qtyissued = d.qtyissued, 
  raf.endingstartseries = d.endingstartseries, 
  raf.endingendseries = d.endingendseries, 
  raf.qtyending = d.qtyending, 
  raf.qtycancelled = d.qtycancelled, 
  raf.remarks = d.remarks 
where raf.objid = d.objid 
  and raf.controlid is null 
; 

delete from af_control_detail where reftype='remittance' and txntype = 'forward' 
; 


insert into sys_usergroup_member (
  objid, usergroup_objid, user_objid, user_username, user_firstname, user_lastname 
) 
select * 
from ( 
  select 
    concat('UGM-',MD5(concat(u.objid, ug.objid))) as objid, 
    ug.objid as usergroup_objid, u.objid as user_objid, 
    u.username as user_username, u.firstname as user_firstname, u.lastname as user_lastname
  from sys_user u, sys_usergroup ug 
  where u.username='admin'
    and ug.domain='TREASURY' 
    and ug.objid in ('TREASURY.AFO_ADMIN','TREASURY.COLLECTOR_ADMIN','TREASURY.LIQ_OFFICER_ADMIN','TREASURY.MANAGER')
)t0 
where (
  select count(*) from sys_usergroup_member 
  where usergroup_objid = t0.usergroup_objid 
    and user_objid = t0.user_objid 
) = 0 
;
