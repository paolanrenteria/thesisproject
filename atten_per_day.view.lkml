view: atten_per_day {
  sql_table_name: digitalnest.atten_per_day ;;

  dimension: unique_dimension {
    sql: CONCAT(${person_id}, " - ", ${TABLE}.Day);;
    primary_key: yes
  }

  dimension: class_description {
    type: string
    sql: ${TABLE}.`Class Description` ;;
  }

  dimension: class_name {
    type: string
    sql: SUBSTRING_INDEX(${class_description}, '-', -1) ;;
  }

  dimension_group: date_of_birth {
    type: time
    sql: str_to_date(${TABLE}.`Date Of Birth`,'%m/%d/%Y') ;;
    timeframes: [date, week, year, month]
  }

  dimension_group: sign_in {
    type: time
    sql: str_to_date(${TABLE}.Day,'%m/%d/%Y') ;;
    timeframes: [date, week, month, year, day_of_week]
  }

  dimension: duration_for_day {
    label: "Hours per Day"
    type: number
    sql: ${TABLE}.`Duration for Day` ;;
  }

  dimension: duration_for_month {
    label: "Hours per Month"
    type: number
    sql: ${TABLE}.`Duration for Month` ;;
  }

  measure: total_number_of_hours{
    type: number
    sql: SUM(${duration_for_month}) ;;
    drill_fields: [student_name_2, duration_for_day]
    value_format_name: decimal_2
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.`Person ID` ;;
  }

  dimension: present_count {
    type: number
    sql: ${TABLE}.`Present Count` ;;
  }

  dimension: student_name {
    type: string
    sql: ${TABLE}.`Student Name` ;;
    hidden: yes
  }

  dimension: student_name_2 {
    label: "Full Name"
    type: string
    sql: TRIM(CONCAT(SUBSTRING_INDEX(${TABLE}.`Student Name`, ',', -1), ' ', SUBSTRING_INDEX(${TABLE}.`Student Name`, ',', 1)));;
    html: <a href="https://localhost:9999/dashboards/2?Full%20Name=%25{{value}}%25&filter_config=%7B%22Full%20Name%22:%5B%7B%22type%22:%22contains%22,%22values%22:%5B%7B%22constant%22:%22{{value}}%22%7D,%7B%7D%5D,%22id%22:6%7D%5D%7D" target='_blank'>{{value}}</a> ;;
  }

  measure: count {
    type: count
    drill_fields: [student_name, duration_for_day]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${student_name_2}  ;;
    drill_fields: [student_name_2]
  }
}
