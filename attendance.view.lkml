view: attendance {
  derived_table: {
    sql: SELECT * FROM attendance;;
  }

  dimension: fullclassname {
    sql: ${TABLE}.`Class Name` ;;
  }

  dimension: full_name_primary {
    sql: ${TABLE}.`Full Name` ;;
  }

  dimension: last_name {
    sql: SUBSTRING_INDEX(${full_name_primary}, ',', 1) ;;
  }

  dimension: first_name {
    sql: SUBSTRING_INDEX(${full_name_primary}, ',', -1) ;;
  }

  dimension: full_namev2 {
    label: "Full Name"
    sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
    html: <a href="https://localhost:9999/dashboards/2?Full%20Name=%25{{value}}%25&filter_config=%7B%22Full%20Name%22:%5B%7B%22type%22:%22contains%22,%22values%22:%5B%7B%22constant%22:%22{{value}}%22%7D,%7B%7D%5D,%22id%22:6%7D%5D%7D" target='_blank'>{{value}}</a> ;;
  }

  dimension: program_name {
    sql: ${TABLE}.`Program Name` ;;
  }

  dimension_group: present_first {
    type: time
    timeframes: [date, month, week, year]
    sql: str_to_date(${TABLE}.`Present First Date`,'%m/%d/%Y') ;;
  }

  dimension_group: present_last {
    type: time
    timeframes: [date, month, week, year]
    sql: str_to_date(${TABLE}.`Present Last Date`,'%m/%d/%Y') ;;
  }

  dimension: present_count {
    type: number
    sql: ${TABLE}.`Present Count` ;;
  }

  dimension: session_count {
    type: number
    sql: ${TABLE}.`Session Count` ;;
  }

  measure: sum_count {
    type: sum
    sql: ${present_count} ;;
    drill_fields: [full_name_primary, present_first_date, present_last_date]
  }

  measure: count {
    type: count
    drill_fields: [full_name_primary, present_first_date, present_last_date]
  }

  dimension: person_id {
    primary_key: yes
    sql: ${TABLE}.`Person ID` ;;
  }

  dimension: classname {
    sql: ${TABLE}.`Class Name01` ;;
  }

  dimension: class_name {
    sql: CASE WHEN ${classname} LIKE 'Workshop Wed%' THEN 'Workshop Wednesday'
    ELSE ${classname} END;;
  }
}
