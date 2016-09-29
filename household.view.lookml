- view: household
  derived_table:
    sql: |
      SELECT
        MAX(CASE WHEN field_number = 1 THEN value END) as username,
        MAX(CASE WHEN field_number = 32 THEN value END) as father_guardian_college,
        MAX(CASE WHEN field_number = 33 THEN value END) as mother_guardian_college,
        MAX(CASE WHEN field_number = 34 THEN value END) as sibling_college,
        MAX(CASE WHEN field_number = 18 THEN value END) as sibling_college_rep,
        MAX(CASE WHEN field_number = 71 THEN value END) as people_in_household,
        MAX(CASE WHEN field_number = 72 THEN value END) as income,
        MAX(CASE WHEN field_number = 75 THEN value END) as technology_access,
        MAX(CASE WHEN field_number = 76 THEN value END) as own_laptop,
        MAX(CASE WHEN field_number = 77 THEN value END) as share_technology,
        MAX(CASE WHEN field_number = 78 THEN value END) as internet_access,
        MAX(CASE WHEN field_number = 79 THEN value END) as transportation,
        MAX(CASE WHEN field_number = 80 THEN value END) as explain_transportation,
        MAX(CASE WHEN field_number = 83 THEN value END) as household_contribution,
        MAX(CASE WHEN field_number = 39 THEN value END) as first_generation,
        MAX(CASE WHEN field_number LIKE '73.%' THEN value END) as member_in_farming
      FROM wp_ivlu_rg_lead_detail
      WHERE lead_id NOT IN (411, 421, 412, 413, 415, 416, 422, 423, 424, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 458, 459, 460)
      GROUP BY lead_id

  fields:
  - dimension: username
    sql: ${TABLE}.username
  
  - dimension: male_guardian_college
    sql: ${TABLE}.father_guardian_college
  
  - dimension: female_guardian_college
    sql: ${TABLE}.mother_guardian_college
  
  - dimension: sibling_college
    sql: ${TABLE}.sibling_college
    
  - dimension: sibling_college_rep
    sql: ${TABLE}.sibling_college_rep
    
  - dimension: income
    sql: ${TABLE}.income

  