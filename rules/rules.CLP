; case template
(deftemplate case
  (slot id)
  (slot gender)                 ; Male | Female
  (slot gestational_age_weeks)  ; Low | Med | High
  (slot birth_weight_kg)        ; Low | Med | High
  (slot age_days)               ; Low | High
  (slot weight_kg)              ; Low | Normal | High
  (slot length_cm)              ; Low | Med | High
  (slot head_circumference_cm)  ; Low | Med | High
  (slot heart_rate_bpm)         ; Low | Med | High
  (slot respiratory_rate_bpm)   ; Low | Med | High
  (slot oxygen_saturation)      ; 95 | 97 | 99
  (slot feeding_type)           ; Formula | Breast | Mixed
  (slot feeding_frequency_per_day) ; 7 | 8 | 9 | 10 | 11 | 12
  (slot urine_output_count)     ; 4 | 5 | 6 | 7 | 8 | 9
  (slot stool_count)            ; 0 | 1 | 2 | 3 | 4 | 5
  (slot jaundice_level_mg_dl)   ; Low | Med | High
  (slot immunizations_done)     ; Yes | No
  (slot reflexes_normal)        ; Yes | No
)

; ..........................
; at_risk rules
; ..........................
(defrule at_risk_oxygen_saturation_95
  ?c <- (case (id ?id)
              (oxygen_saturation 95))
  =>
  (assert (conclusion (id ?c:id)
                      (target At Risk)
                      (rule at_risk_oxygen_saturation_95) ))
)

(defrule at_risk_age_days_low_jaundice_level_mg_dl_high_oxygen_saturation_99_feeding_type_formula_weight_kg_low
  ?c <- (case (id ?id)
              (age_days Low)
              (jaundice_level_mg_dl High)
              (oxygen_saturation 99)
              (feeding_type Formula)
              (weight_kg Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target At Risk)
                      (rule at_risk_age_days_low_jaundice_level_mg_dl_high_oxygen_saturation_99_feeding_type_formula_weight_kg_low) ))
)

; ..........................
; healthy rules
; ..........................
(defrule healthy_age_days_high_oxygen_saturation_99_reflexes_normal_yes
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 99)
              (reflexes_normal Yes))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_99_reflexes_normal_yes) ))
)

(defrule healthy_immunizations_done_yes_oxygen_saturation_97
  ?c <- (case (id ?id)
              (immunizations_done Yes)
              (oxygen_saturation 97))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_immunizations_done_yes_oxygen_saturation_97) ))
)

(defrule healthy_age_days_high_urine_output_count_6_oxygen_saturation_98
  ?c <- (case (id ?id)
              (age_days High)
              (urine_output_count 6)
              (oxygen_saturation 98))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_urine_output_count_6_oxygen_saturation_98) ))
)

(defrule healthy_age_days_med_oxygen_saturation_99_gender_male
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 99)
              (gender Male))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_99_gender_male) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_99
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 99))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_99) ))
)

(defrule healthy_age_days_high_oxygen_saturation_96_gender_female
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 96)
              (gender Female))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_96_gender_female) ))
)

(defrule healthy_age_days_med_stool_count_0_oxygen_saturation_97
  ?c <- (case (id ?id)
              (age_days Med)
              (stool_count 0)
              (oxygen_saturation 97))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_stool_count_0_oxygen_saturation_97) ))
)

(defrule healthy_age_days_high_oxygen_saturation_98_length_cm_high
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 98)
              (length_cm High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_98_length_cm_high) ))
)

(defrule healthy_age_days_med_oxygen_saturation_96_respiratory_rate_bpm_med
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 96)
              (respiratory_rate_bpm Med))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_96_respiratory_rate_bpm_med) ))
)

(defrule healthy_oxygen_saturation_100_gestational_age_weeks_high
  ?c <- (case (id ?id)
              (oxygen_saturation 100)
              (gestational_age_weeks High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_100_gestational_age_weeks_high) ))
)

(defrule healthy_age_days_med_weight_kg_high_jaundice_level_mg_dl_high
  ?c <- (case (id ?id)
              (age_days Med)
              (weight_kg High)
              (jaundice_level_mg_dl High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_weight_kg_high_jaundice_level_mg_dl_high) ))
)

(defrule healthy_jaundice_level_mg_dl_med_oxygen_saturation_100
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (oxygen_saturation 100))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_oxygen_saturation_100) ))
)

(defrule healthy_jaundice_level_mg_dl_med_oxygen_saturation_97_heart_rate_bpm_med
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (oxygen_saturation 97)
              (heart_rate_bpm Med))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_oxygen_saturation_97_heart_rate_bpm_med) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_96_birth_weight_kg_high
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 96)
              (birth_weight_kg High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_96_birth_weight_kg_high) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_98_heart_rate_bpm_low
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 98)
              (heart_rate_bpm Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_98_heart_rate_bpm_low) ))
)

(defrule healthy_jaundice_level_mg_dl_med_heart_rate_bpm_low_oxygen_saturation_98
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (heart_rate_bpm Low)
              (oxygen_saturation 98))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_heart_rate_bpm_low_oxygen_saturation_98) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_96_birth_weight_kg_low
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 96)
              (birth_weight_kg Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_96_birth_weight_kg_low) ))
)

(defrule healthy_age_days_high_oxygen_saturation_97_heart_rate_bpm_low
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 97)
              (heart_rate_bpm Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_97_heart_rate_bpm_low) ))
)

(defrule healthy_age_days_med_heart_rate_bpm_med_oxygen_saturation_98
  ?c <- (case (id ?id)
              (age_days Med)
              (heart_rate_bpm Med)
              (oxygen_saturation 98))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_heart_rate_bpm_med_oxygen_saturation_98) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_97_heart_rate_bpm_med
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 97)
              (heart_rate_bpm Med))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_97_heart_rate_bpm_med) ))
)

(defrule healthy_jaundice_level_mg_dl_med_oxygen_saturation_97_heart_rate_bpm_low
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (oxygen_saturation 97)
              (heart_rate_bpm Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_oxygen_saturation_97_heart_rate_bpm_low) ))
)

(defrule healthy_age_days_med_oxygen_saturation_97_head_circumference_cm_low
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 97)
              (head_circumference_cm Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_97_head_circumference_cm_low) ))
)

(defrule healthy_age_days_high_oxygen_saturation_96_respiratory_rate_bpm_low
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 96)
              (respiratory_rate_bpm Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_96_respiratory_rate_bpm_low) ))
)

(defrule healthy_age_days_high_oxygen_saturation_98_heart_rate_bpm_med
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 98)
              (heart_rate_bpm Med))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_98_heart_rate_bpm_med) ))
)

(defrule healthy_age_days_med_oxygen_saturation_96_heart_rate_bpm_med
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 96)
              (heart_rate_bpm Med))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_96_heart_rate_bpm_med) ))
)

(defrule healthy_jaundice_level_mg_dl_med_oxygen_saturation_99_reflexes_normal_yes
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (oxygen_saturation 99)
              (reflexes_normal Yes))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_oxygen_saturation_99_reflexes_normal_yes) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_98_feeding_frequency_per_day_8
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 98)
              (feeding_frequency_per_day 8))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_98_feeding_frequency_per_day_8) ))
)

(defrule healthy_age_days_high_oxygen_saturation_97_reflexes_normal_no
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 97)
              (reflexes_normal No))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_97_reflexes_normal_no) ))
)

(defrule healthy_age_days_med_oxygen_saturation_97_length_cm_high
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 97)
              (length_cm High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_97_length_cm_high) ))
)

(defrule healthy_oxygen_saturation_100_jaundice_level_mg_dl_low
  ?c <- (case (id ?id)
              (oxygen_saturation 100)
              (jaundice_level_mg_dl Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_100_jaundice_level_mg_dl_low) ))
)

(defrule healthy_immunizations_done_yes_heart_rate_bpm_med
  ?c <- (case (id ?id)
              (immunizations_done Yes)
              (heart_rate_bpm Med))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_immunizations_done_yes_heart_rate_bpm_med) ))
)

(defrule healthy_age_days_med_oxygen_saturation_98_heart_rate_bpm_low
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 98)
              (heart_rate_bpm Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_98_heart_rate_bpm_low) ))
)

(defrule healthy_jaundice_level_mg_dl_low_urine_output_count_6_feeding_type_breastfeeding
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (urine_output_count 6)
              (feeding_type Breastfeeding))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_urine_output_count_6_feeding_type_breastfeeding) ))
)

(defrule healthy_jaundice_level_mg_dl_med_oxygen_saturation_96_heart_rate_bpm_low
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (oxygen_saturation 96)
              (heart_rate_bpm Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_oxygen_saturation_96_heart_rate_bpm_low) ))
)

(defrule healthy_age_days_high_urine_output_count_6_weight_kg_high
  ?c <- (case (id ?id)
              (age_days High)
              (urine_output_count 6)
              (weight_kg High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_urine_output_count_6_weight_kg_high) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_98_urine_output_count_9
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 98)
              (urine_output_count 9))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_98_urine_output_count_9) ))
)

(defrule healthy_jaundice_level_mg_dl_med_oxygen_saturation_98_feeding_frequency_per_day_8
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (oxygen_saturation 98)
              (feeding_frequency_per_day 8))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_oxygen_saturation_98_feeding_frequency_per_day_8) ))
)

(defrule healthy_age_days_high_oxygen_saturation_96_respiratory_rate_bpm_high
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 96)
              (respiratory_rate_bpm High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_96_respiratory_rate_bpm_high) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_97_feeding_frequency_per_day_11
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 97)
              (feeding_frequency_per_day 11))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_97_feeding_frequency_per_day_11) ))
)

(defrule healthy_age_days_high_oxygen_saturation_97_birth_weight_kg_high
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 97)
              (birth_weight_kg High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_97_birth_weight_kg_high) ))
)

(defrule healthy_jaundice_level_mg_dl_med_feeding_frequency_per_day_10_head_circumference_cm_med
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (feeding_frequency_per_day 10)
              (head_circumference_cm Med))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_feeding_frequency_per_day_10_head_circumference_cm_med) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_96_immunizations_done_no
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 96)
              (immunizations_done No))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_96_immunizations_done_no) ))
)

(defrule healthy_jaundice_level_mg_dl_low_oxygen_saturation_98_feeding_frequency_per_day_9
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Low)
              (oxygen_saturation 98)
              (feeding_frequency_per_day 9))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_low_oxygen_saturation_98_feeding_frequency_per_day_9) ))
)

(defrule healthy_age_days_med_oxygen_saturation_97_urine_output_count_7
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 97)
              (urine_output_count 7))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_97_urine_output_count_7) ))
)

(defrule healthy_jaundice_level_mg_dl_med_oxygen_saturation_98_age_days_high
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (oxygen_saturation 98)
              (age_days High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_oxygen_saturation_98_age_days_high) ))
)

(defrule healthy_age_days_med_oxygen_saturation_98_respiratory_rate_bpm_high
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 98)
              (respiratory_rate_bpm High))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_98_respiratory_rate_bpm_high) ))
)

(defrule healthy_oxygen_saturation_97_jaundice_level_mg_dl_low_heart_rate_bpm_low_gender_male
  ?c <- (case (id ?id)
              (oxygen_saturation 97)
              (jaundice_level_mg_dl Low)
              (heart_rate_bpm Low)
              (gender Male))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_97_jaundice_level_mg_dl_low_heart_rate_bpm_low_gender_male) ))
)

(defrule healthy_jaundice_level_mg_dl_med_age_days_low_head_circumference_cm_low_reflexes_normal_yes
  ?c <- (case (id ?id)
              (jaundice_level_mg_dl Med)
              (age_days Low)
              (head_circumference_cm Low)
              (reflexes_normal Yes))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_jaundice_level_mg_dl_med_age_days_low_head_circumference_cm_low_reflexes_normal_yes) ))
)

(defrule healthy_age_days_high_oxygen_saturation_97_jaundice_level_mg_dl_high_birth_weight_kg_low
  ?c <- (case (id ?id)
              (age_days High)
              (oxygen_saturation 97)
              (jaundice_level_mg_dl High)
              (birth_weight_kg Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_high_oxygen_saturation_97_jaundice_level_mg_dl_high_birth_weight_kg_low) ))
)

(defrule healthy_age_days_med_oxygen_saturation_98_feeding_frequency_per_day_12
  ?c <- (case (id ?id)
              (age_days Med)
              (oxygen_saturation 98)
              (feeding_frequency_per_day 12))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_age_days_med_oxygen_saturation_98_feeding_frequency_per_day_12) ))
)

(defrule healthy_stool_count_5_oxygen_saturation_96_immunizations_done_no
  ?c <- (case (id ?id)
              (stool_count 5)
              (oxygen_saturation 96)
              (immunizations_done No))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_stool_count_5_oxygen_saturation_96_immunizations_done_no) ))
)

(defrule healthy_oxygen_saturation_97_feeding_frequency_per_day_7_stool_count_5
  ?c <- (case (id ?id)
              (oxygen_saturation 97)
              (feeding_frequency_per_day 7)
              (stool_count 5))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_97_feeding_frequency_per_day_7_stool_count_5) ))
)

(defrule healthy_oxygen_saturation_97_jaundice_level_mg_dl_low_feeding_frequency_per_day_8
  ?c <- (case (id ?id)
              (oxygen_saturation 97)
              (jaundice_level_mg_dl Low)
              (feeding_frequency_per_day 8))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_97_jaundice_level_mg_dl_low_feeding_frequency_per_day_8) ))
)

(defrule healthy_feeding_frequency_per_day_10_stool_count_3
  ?c <- (case (id ?id)
              (feeding_frequency_per_day 10)
              (stool_count 3))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_feeding_frequency_per_day_10_stool_count_3) ))
)

(defrule healthy_immunizations_done_yes_oxygen_saturation_98
  ?c <- (case (id ?id)
              (immunizations_done Yes)
              (oxygen_saturation 98))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_immunizations_done_yes_oxygen_saturation_98) ))
)

(defrule healthy_oxygen_saturation_97_jaundice_level_mg_dl_med_birth_weight_kg_low_reflexes_normal_yes
  ?c <- (case (id ?id)
              (oxygen_saturation 97)
              (jaundice_level_mg_dl Med)
              (birth_weight_kg Low)
              (reflexes_normal Yes))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_97_jaundice_level_mg_dl_med_birth_weight_kg_low_reflexes_normal_yes) ))
)

(defrule healthy_oxygen_saturation_98_age_days_high_birth_weight_kg_med_reflexes_normal_yes
  ?c <- (case (id ?id)
              (oxygen_saturation 98)
              (age_days High)
              (birth_weight_kg Med)
              (reflexes_normal Yes))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_98_age_days_high_birth_weight_kg_med_reflexes_normal_yes) ))
)

(defrule healthy_oxygen_saturation_97_age_days_med_gender_female
  ?c <- (case (id ?id)
              (oxygen_saturation 97)
              (age_days Med)
              (gender Female))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_97_age_days_med_gender_female) ))
)

(defrule healthy_oxygen_saturation_96_feeding_frequency_per_day_12_reflexes_normal_yes
  ?c <- (case (id ?id)
              (oxygen_saturation 96)
              (feeding_frequency_per_day 12)
              (reflexes_normal Yes))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_96_feeding_frequency_per_day_12_reflexes_normal_yes) ))
)

(defrule healthy_oxygen_saturation_98_jaundice_level_mg_dl_low_weight_kg_low_reflexes_normal_yes
  ?c <- (case (id ?id)
              (oxygen_saturation 98)
              (jaundice_level_mg_dl Low)
              (weight_kg Low)
              (reflexes_normal Yes))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_98_jaundice_level_mg_dl_low_weight_kg_low_reflexes_normal_yes) ))
)

(defrule healthy_oxygen_saturation_97_feeding_frequency_per_day_7_weight_kg_low
  ?c <- (case (id ?id)
              (oxygen_saturation 97)
              (feeding_frequency_per_day 7)
              (weight_kg Low))
  =>
  (assert (conclusion (id ?c:id)
                      (target Healthy)
                      (rule healthy_oxygen_saturation_97_feeding_frequency_per_day_7_weight_kg_low) ))
)
