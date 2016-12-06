view: users {
  derived_table:  {
    sql: SELECT
        DISTINCT lead_id as lead_id,
        MAX(CASE WHEN field_number = 1 THEN CAST(value as CHAR(50)) END) as username,
        MAX(CASE WHEN field_number LIKE '6.3' THEN value END) as name,
        MAX(CASE WHEN field_number LIKE '6.6' THEN value END) as last_name,
        MAX(CASE WHEN field_number = 176 THEN value END) as user_gender,
        MAX(CASE WHEN field_number = 3 THEN value END) as date_of_birth,
        MAX(CASE WHEN field_number = 5 THEN value END) as email,
        MAX(CASE WHEN field_number = 178 THEN value END) as phone,
        MAX(CASE WHEN field_number = 4 THEN value END) as current_education
      FROM wp_ivlu_rg_lead_detail
      WHERE lead_id NOT IN (411, 421, 412, 413, 415, 416, 422, 423, 424, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 458, 459, 460)
      GROUP BY lead_id
       ;;
      sql_trigger_value: SELECT 1 ;;
      indexes: ["username"]
  }

  dimension: lead_id {
    type: number
    sql: ${TABLE}.lead_id ;;
  }

  dimension: username {
    primary_key: yes
    type: string
    sql: ${TABLE}.username ;;
  }

  measure:  count {
    type:  count
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: last_name {
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${name}, ' ', ${last_name}) ;;
  }

  dimension: orig_gender {
    sql: ${TABLE}.user_gender ;;
  }

  dimension: gender {
    sql: CASE WHEN ${orig_gender} = 'Female' THEN 'Female'
           WHEN ${orig_gender} = 'Male' THEN 'Male'
           WHEN ${orig_gender} = 'NonBinary' THEN 'Non Binary'
           WHEN ${orig_gender} = 'Agender' THEN 'Agender'
           ELSE 'Other' END;;
  }

  dimension: gender_case {
      case: {
        when: {
          sql: ${gender} = 'Female' ;;
          label: "pending"
        }
        when: {
          sql: ${gender} = 'Male' ;;
          label: "complete"
        }
        when: {
          sql: ELSE
          label: ${gender};;
        }
    }
  }

  dimension_group: birth {
    type: time
    timeframes: [date]
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: age {
    type: number
    sql: FLOOR(DATEDIFF(now(),${birth_date})/365) ;;
  }

  dimension: email {
    sql: ${TABLE}.email ;;
  }

  dimension: phone_number {
    sql: ${TABLE}.phone ;;
  }

  dimension: current_education_level {
    sql: ${TABLE}.current_education ;;
  }

}
