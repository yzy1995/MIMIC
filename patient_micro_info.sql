SELECT ie.subject_id, ie.hadm_id, ie.icustay_id,micro.chartdate, micro.charttime, micro.spec_itemid, spec_item.label, micro.spec_type_desc,  micro.org_itemid, org_item.label, micro.org_name, micro.ab_itemid, ab_item.label, micro.ab_name, micro.interpretation FROM mimiciii.icustays ie INNER JOIN mimiciii.microbiologyevents micro ON ie.subject_id = micro.subject_id INNER JOIN mimiciii.d_items spec_item ON micro.spec_itemid = spec_item.itemid INNER JOIN mimiciii.d_items org_item ON micro.org_itemid = org_item.itemid INNER JOIN mimiciii.d_items ab_item ON micro.ab_itemid = ab_item.itemid WHERE ie.subject_id = "+num+" ORDER BY micro.chartdate;
