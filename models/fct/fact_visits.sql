{{ config(materialized='table') }}

select
    v.visited_date,
    v.patient_id,
    v.provider_id,
    v.department_id,
    v.diagnosis_id,
    v.procedure_id,
    v.insurance_id,
    v.treatment_cost,
    v.medication_cost,
    v.insurance_coverage,
    v.room_charges_daily_rate,
    v.service_type,
    v.follow_up_visit_date,
    v.patient_satisfaction_score,
    v.referral_source,
    v.emergency_visit,
    v.payment_status,
    v.discharge_date,
    v.admitted_date,
    v.room_type
from {{ ref('stg_visits') }} v



