[findBeginBalance]
select 
	convert(decimal(20,4), sum(dr)) as dr, convert(decimal(20,4), sum(cr)) as cr, 
	convert(decimal(20,4), sum(dr)) - convert(decimal(20,4), sum(cr)) as balance
from ( 
	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_cashreceipt 
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state = 'POSTED' 
	union all 
	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_cashreceipt_share  
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state = 'POSTED' 
	union all 
	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_cashreceipt_share_payable  
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state = 'POSTED' 

	union all 

	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_remittance 
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state in ('DRAFT','OPEN','POSTED')
	union all 
	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_remittance_share 
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state in ('DRAFT','OPEN','POSTED')
	union all 
	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_remittance_share_payable 
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state in ('DRAFT','OPEN','POSTED')

	union all 

	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_cashreceiptvoid  
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state = 'POSTED' 
	union all 
	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_cashreceiptvoid_share  
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state = 'POSTED' 
	union all 
	select sum(dr) as dr, sum(cr) as cr 
	from vw_cashbook_cashreceiptvoid_share_payable  
	where refdate < $P{fromdate} 
		and collectorid = $P{accountid} 
		and fundid in (${fundfilter}) 
		and state = 'POSTED' 
)t1 


[findRevolvingFund]
select 
	year(controldate) as controlyear, 
	month(controldate) as controlmonth, 
	sum(amount) as amount, 
	((year(controldate)*12) + month(controldate)) as indexno 
from cashbook_revolving_fund 
where issueto_objid = $P{accountid} 
	and controldate <= $P{fromdate} 
	and fund_objid in (${fundfilter})
	and state = 'POSTED' 
group by year(controldate), month(controldate), ((year(controldate)*12) + month(controldate)) 
order by ((year(controldate)*12) + month(controldate)) desc 


[getDetails]
select 
	refdate, refno, reftype, sortdate, 
	convert(decimal(20,4), sum(dr)) as dr, convert(decimal(20,4), sum(cr)) as cr, 
	convert(decimal(20,4), sum(adr)) as adr, convert(decimal(20,4), sum(acr)) as acr 
from ( 
	select refdate, refno, reftype, sum(dr) as dr, sum(cr) as cr, sum(dr) as adr, sum(cr) as acr, sortdate 
	from ( 
		select refdate, refno, reftype, sum(dr) as dr, sum(cr) as cr, sortdate 
		from vw_cashbook_cashreceipt 
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter})
			and state = 'POSTED' 
		group by refdate, refno, reftype, sortdate 
		union all 
		select refdate, refno, reftype, sum(dr) as dr, sum(cr) as cr, sortdate 
		from vw_cashbook_cashreceipt_share  
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter})
			and state = 'POSTED' 
		group by refdate, refno, reftype, sortdate 
		union all 
		select refdate, refno, reftype, sum(dr) as dr, sum(cr) as cr, sortdate 
		from vw_cashbook_cashreceipt_share_payable  
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter})
			and state = 'POSTED' 
		group by refdate, refno, reftype, sortdate 
	)t0 
	group by refdate, refno, reftype, sortdate 

	union all 

	select refdate, refno, reftype, sum(dr) as dr, sum(cr) as cr, sum(dr) as adr, sum(cr) as acr, sortdate 
	from ( 
		select 
			refdate, (case when state='DRAFT' then '-- Draft Remittance --' else refno end) as refno, 
			reftype, sum(dr) as dr, sum(cr) as cr, sortdate 
		from vw_cashbook_remittance 
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter}) 
			and state in ('DRAFT','OPEN','POSTED')
		group by refdate, (case when state='DRAFT' then '-- Draft Remittance --' else refno end), reftype, sortdate 
		union all 
		select 
			refdate, (case when state='DRAFT' then '-- Draft Remittance --' else refno end) as refno, 
			reftype, sum(dr) as dr, sum(cr) as cr, sortdate 
		from vw_cashbook_remittance_share 
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter}) 
			and state in ('DRAFT','OPEN','POSTED')
		group by refdate, (case when state='DRAFT' then '-- Draft Remittance --' else refno end), reftype, sortdate 
		union all 
		select 
			refdate, (case when state='DRAFT' then '-- Draft Remittance --' else refno end) as refno, 
			reftype, sum(dr) as dr, sum(cr) as cr, sortdate 
		from vw_cashbook_remittance_share_payable 
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter}) 
			and state in ('DRAFT','OPEN','POSTED')
		group by refdate, (case when state='DRAFT' then '-- Draft Remittance --' else refno end), reftype, sortdate 
	)t0 
	group by refdate, refno, reftype, sortdate 

	union all 

	select refdate, refno, 
		(case when sum(dr) = sum(cr) then 'void-remitted-receipt' else reftype end) as reftype, 
		sum(dr) as dr, sum(cr) as cr, sum(adr) as adr, sum(acr) as acr, sortdate 
	from ( 
		select 
			refdate, refno, reftype, sortdate, sum(dr) as dr, sum(cr) as cr, 
			(case when receiptdate >= $P{fromdate} then sum(dr) else null end) as adr, 
			(case when remittancedate >= $P{fromdate} then sum(cr) else null end) as acr
		from vw_cashbook_cashreceiptvoid  
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter})
			and state = 'POSTED' 
		group by refdate, refno, reftype, sortdate, receiptdate, remittancedate 
		union all 
		select 
			refdate, refno, reftype, sortdate, sum(dr) as dr, sum(cr) as cr, 
			(case when receiptdate >= $P{fromdate} then sum(dr) else null end) as adr, 
			(case when remittancedate >= $P{fromdate} then sum(cr) else null end) as acr
		from vw_cashbook_cashreceiptvoid_share  
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter})
			and state = 'POSTED' 
		group by refdate, refno, reftype, sortdate, receiptdate, remittancedate 
		union all 
		select 
			refdate, refno, reftype, sortdate, sum(dr) as dr, sum(cr) as cr, 
			(case when receiptdate >= $P{fromdate} then sum(dr) else null end) as adr, 
			(case when remittancedate >= $P{fromdate} then sum(cr) else null end) as acr
		from vw_cashbook_cashreceiptvoid_share_payable  
		where refdate >= $P{fromdate} 
			and refdate <  $P{todate} 
			and collectorid = $P{accountid} 
			and fundid in (${fundfilter})
			and state = 'POSTED' 
		group by refdate, refno, reftype, sortdate, receiptdate, remittancedate 
	)t0 
	group by refdate, refno, reftype, sortdate 
)tt 
group by refdate, refno, reftype, sortdate 
order by sortdate, refdate 


[getSummaries]
select 
	refdate, groupdate, grouprefno, groupid, particulars, refno, min(sortdate) as sortdate, 
	convert(decimal(20,4), sum(dr)) as dr, convert(decimal(20,4), sum(cr)) as cr, 
	convert(decimal(20,4), sum(adr)) as adr, convert(decimal(20,4), sum(acr)) as acr 
from ( 
	select 
		groupid, groupdate, grouprefno, controlid, formno, formtype, min(sortdate) as sortdate, 
		min(refdate) as refdate, min(series) as minseries, max(series) as maxseries, 
		(case when formno = '51' then 'VARIOUS TAXES AND FEES' else af_title end) as particulars, 
		('AF '+ formno +  
			(case 
				when formtype = 'cashticket' then (' - '+ af_title) 
				else ('#'+ convert(varchar, min(refno)) +'-'+ convert(varchar, max(refno))) 
			end)
		) as refno, 
		sum(dr) as dr, sum(cr) as cr, sum(dr) as adr, sum(cr) as acr 
	from ( 
		select 
			c.refdate, c.controlid, c.formno, c.series, af.formtype, 
			af.title as af_title, c.refno, c.dr, c.cr, c.sortdate, c.remittanceid as groupid, 
			isnull(c.remittancedtposted, c.receiptdate) as groupdate, c.formno as grouprefno  
		from vw_cashbook_cashreceipt c  
			inner join af on af.objid = c.formno 
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state = 'POSTED' 
		union all 
		select 
			c.refdate, c.controlid, c.formno, c.series, af.formtype, 
			af.title as af_title, c.refno, c.dr, c.cr, c.sortdate, c.remittanceid as groupid, 
			isnull(c.remittancedtposted, c.receiptdate) as groupdate, c.formno as grouprefno  
		from vw_cashbook_cashreceipt_share c  
			inner join af on af.objid = c.formno 
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state = 'POSTED' 
		union all 
		select 
			c.refdate, c.controlid, c.formno, c.series, af.formtype, 
			af.title as af_title, c.refno, c.dr, c.cr, c.sortdate, c.remittanceid as groupid, 
			isnull(c.remittancedtposted, c.receiptdate) as groupdate, c.formno as grouprefno  
		from vw_cashbook_cashreceipt_share_payable c  
			inner join af on af.objid = c.formno 
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state = 'POSTED' 
	)t0 
	group by groupid, groupdate, grouprefno, controlid, formno, formtype, af_title 

	union all 

	select 
		groupid, groupdate, grouprefno, null as controlid, null as formno, null as formtype, 
		min(sortdate) as sortdate, refdate, null as minseries, null as maxseries, 
		particulars, refno, sum(dr) as dr, sum(cr) as cr, sum(dr) as adr, sum(cr) as acr 
	from ( 
		select 
			c.refdate, c.refno, c.dr, c.cr, c.sortdate, c.refid as groupid, 
			isnull(c.txndate, c.refdate) as groupdate, c.refno as grouprefno, 
			(case 
				when state='DRAFT' then '-- Draft Remittance --' 
				else ('REMITTANCE - '+ c.liquidatingofficer_name) 
			end) as particulars 
		from vw_cashbook_remittance c  
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state in ('DRAFT','OPEN','POSTED') 
		union all 
		select 
			c.refdate, c.refno, c.dr, c.cr, c.sortdate, c.refid as groupid, 
			isnull(c.txndate, c.refdate) as groupdate, c.refno as grouprefno, 
			(case 
				when state='DRAFT' then '-- Draft Remittance --' 
				else ('REMITTANCE - '+ c.liquidatingofficer_name) 
			end) as particulars 
		from vw_cashbook_remittance_share c  
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state in ('DRAFT','OPEN','POSTED') 
		union all 
		select 
			c.refdate, c.refno, c.dr, c.cr, c.sortdate, c.refid as groupid, 
			isnull(c.txndate, c.refdate) as groupdate, c.refno as grouprefno, 
			(case 
				when state='DRAFT' then '-- Draft Remittance --' 
				else ('REMITTANCE - '+ c.liquidatingofficer_name) 
			end) as particulars 
		from vw_cashbook_remittance_share_payable c  
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state in ('DRAFT','OPEN','POSTED') 
	)t0 
	group by groupid, groupdate, grouprefno, refdate, particulars, refno  

	union all 

	select 
		groupid, groupdate, grouprefno, controlid, formno, formtype, min(sortdate) as sortdate, 
		min(refdate) as refdate, min(series) as minseries, max(series) as maxseries, 
		(case when formno = '51' then 'VARIOUS TAXES AND FEES' else af_title end) as particulars, 
		('*** VOIDED - AF '+ formno +'#'+ refno +' ***') as refno, 
		sum(dr) as dr, sum(cr) as cr, sum(adr) as adr, sum(acr) as acr 
	from ( 
		select 
			c.refdate, c.refid as controlid, c.formno, af.formtype, c.series, 
			af.title as af_title, c.refno, c.dr, c.cr, c.sortdate, 
			c.refid as groupid, c.txndate as groupdate, c.formno as grouprefno,  
			(case when c.receiptdate >= $P{fromdate} then dr else null end) as adr, 
			(case when c.remittancedate >= $P{fromdate} then cr else null end) as acr
		from vw_cashbook_cashreceiptvoid c  
			inner join af on af.objid = c.formno 
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state = 'POSTED' 
		union all 
		select 
			c.refdate, c.refid as controlid, c.formno, af.formtype, c.series, 
			af.title as af_title, c.refno, c.dr, c.cr, c.sortdate, 
			c.refid as groupid, c.txndate as groupdate, c.formno as grouprefno,  
			(case when receiptdate >= $P{fromdate} then dr else null end) as adr, 
			(case when remittancedate >= $P{fromdate} then cr else null end) as acr
		from vw_cashbook_cashreceiptvoid_share c  
			inner join af on af.objid = c.formno 
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state = 'POSTED' 
		union all 
		select 
			c.refdate, c.refid as controlid, c.formno, af.formtype, c.series, 
			af.title as af_title, c.refno, c.dr, c.cr, c.sortdate, 
			c.refid as groupid, c.txndate as groupdate, c.formno as grouprefno,  
			(case when receiptdate >= $P{fromdate} then dr else null end) as adr, 
			(case when remittancedate >= $P{fromdate} then cr else null end) as acr
		from vw_cashbook_cashreceiptvoid_share_payable c  
			inner join af on af.objid = c.formno 
		where c.refdate >= $P{fromdate} 
			and c.refdate <  $P{todate} 
			and c.collectorid = $P{accountid} 
			and c.fundid in (${fundfilter}) 
			and c.state = 'POSTED' 
	)t0
  group by 
		groupid, groupdate, grouprefno, controlid, formno, formtype, refno, 
		(case when formno = '51' then 'VARIOUS TAXES AND FEES' else af_title end) 

)t1 
group by groupid, groupdate, grouprefno, refdate, particulars, refno 
order by refdate, groupdate, grouprefno, min(sortdate) 
