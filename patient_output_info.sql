SELECT ie.subject_id, ie.hadm_id, ie.icustay_id, output.itemid, output_item.label, output.charttime output.value, output.valueuom FROM mimiciii.icustays ie INNER JOIN mimiciii.outputevents output ON ie.subject_id = output.subject_id INNER JOIN mimiciii.d_items output_item ON output.itemid = output_item.itemid WHERE ie.subject_id = "+num+" ORDER BY output.charttime;