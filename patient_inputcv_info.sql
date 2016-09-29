SELECT ie.subject_id, ie.hadm_id, ie.icustay_id,    
    input_cv.itemid , inputcv_item.label, input_cv.charttime , input_cv.amount ,
    input_cv.amountuom , input_cv.rate , input_cv.rateuom 
FROM mimiciii.icustays ie
INNER JOIN mimiciii.inputevents_cv input_cv
ON ie.subject_id = input_cv.subject_id

INNER JOIN mimiciii.d_items inputcv_item
ON input_cv.itemid = inputcv_item.itemid

--INNER JOIN mimiciii.inputevents_mv input_mv
--ON ie.subject_id = input_mv.subject_id

--INNER JOIN mimiciii.d_items inputmv_item
--ON input_mv.itemid = inputmv_item.itemid

WHERE ie.subject_id = 49
ORDER BY input_cv.itemid;

