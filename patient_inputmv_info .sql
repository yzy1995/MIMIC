SELECT ie.subject_id, ie.hadm_id, ie.icustay_id, input_mv.starttime, input_mv.endtime, input_mv.itemid, inputmv_item.label, input_mv.amount, input_mv.amountuom, input_mv.rate, input_mv.rateuom, input_mv.patientweight, input_mv.totalamount, input_mv.totalamountuom FROM mimiciii.icustays ie INNER JOIN mimiciii.inputevents_mv input_mv ON ie.subject_id = input_mv.subject_id INNER JOIN mimiciii.d_items inputmv_item ON input_mv.itemid = inputmv_item.itemid WHERE ie.subject_id = "+num+" ORDER BY input_mv.starttime;
