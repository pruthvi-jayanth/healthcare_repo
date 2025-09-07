{{ config(
    materialized='view',
    tags=['staging']
) }}

with source as (
    select * from {{ source('healthcare', 'raw_visits') }}
)

select
    "Date of Visit" as visited_date,
    "Patient ID" as patient_id,
    "Provider ID" as provider_id,
    "Department ID" as department_id,
    "Diagnosis ID" as diagnosis_id,
    "Procedure ID" as procedure_id,
    "Insurance ID" as insurance_id,
    "Service Type" as service_type,
    "Treatment Cost" as treatment_cost,
    "Medication Cost" as medication_cost,
    "Follow-Up Visit Date" as follow_up_visit_date,
    "Patient Satisfaction Score" as patient_satisfaction_score,
    "Referral Source" as referral_source,
    "Emergency Visit" as emergency_visit,
    "Payment Status" as payment_status,
    "Discharge Date" as discharge_date,
    "Admitted Date" as admitted_date,
    "Room Type" as room_type,
    "Insurance Coverage" as insurance_coverage,
    "Room Charges(daily rate)" as room_charges_daily_rate
from source
