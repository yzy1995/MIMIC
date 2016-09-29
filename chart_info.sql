SELECT chart.SUBJECT_ID,chart.CGID,cg.LABEL,chart.itemid
FROM mimiciii.chartevents chart
INNER JOIN mimiciii.caregivers cg
ON chart.cgid=cg.cgid
ORDER BY chart.subject_id;
