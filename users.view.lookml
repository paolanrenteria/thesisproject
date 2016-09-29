- view: users
  derived_table:
    sql: |
      SELECT 
        DISTINCT lead_id,
        MAX(CASE WHEN field_number = 1 THEN value END) as username,
        MAX(CASE WHEN field_number LIKE '6.3' THEN value END) as name,
        MAX(CASE WHEN field_number LIKE '6.6' THEN value END) as last_name,
        MAX(CASE WHEN field_number = 176 THEN value END) as gender,
        MAX(CASE WHEN field_number = 3 THEN value END) as date_of_birth,
        MAX(CASE WHEN field_number = 5 THEN value END) as email,
        MAX(CASE WHEN field_number = 178 THEN value END) as phone,
        MAX(CASE WHEN field_number = 4 THEN value END) as current_education
      FROM wp_ivlu_rg_lead_detail
      WHERE lead_id NOT IN (411, 421, 412, 413, 415, 416, 422, 423, 424, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 458, 459, 460)
      GROUP BY lead_id

  fields:
  - dimension: username
    type: string
    sql: ${TABLE}.username
  
  - dimension: name
    sql: ${TABLE}.name
    
  - dimension: last_name
    sql: ${TABLE}.last_name
  
  - dimension: gender
    sql: ${TABLE}.gender
  
  - dimension_group: birth
    type: time
    timeframes: [date]
    sql: ${TABLE}.date_of_birth
  
  - dimension: email
    sql: ${TABLE}.email
    
  - dimension: phone_number
    sql: ${TABLE}.phone
  
  - dimension: current_education_level
    sql: ${TABLE}.current_education
    
  
