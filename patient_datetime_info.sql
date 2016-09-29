SELECT ie.subject_id, ie.hadm_id, ie.icustay_id,
    datetime.itemid AS datetime_itemid, datetime_item.label AS datetime_itemlabel, datetime.charttime AS datetime_charttime
INTO patient_datetime_info
FROM mimiciii.icustays ie
INNER JOIN mimiciii.datetimeevents datetime
ON ie.subject_id = datetime.subject_id

INNER JOIN mimiciii.d_items datetime_item
ON datetime.itemid = datetime_item.itemid
WHERE ie.row_id  = 50
ORDER BY ie.subject_id;
