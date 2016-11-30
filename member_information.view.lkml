view: member_information {
  sql_table_name: digitalnest.member_information ;;

  dimension: asian {
    type: string
    sql: ${TABLE}.Asian ;;
  }

  dimension: black {
    type: string
    sql: ${TABLE}.Black ;;
  }

  dimension_group: dob {
    type: time
    sql: str_to_date(${TABLE}.DOB,'%m/%d/%Y') ;;
    timeframes: [date, year, month]
  }

  dimension: age {
    type: number
    sql: FLOOR(DATEDIFF(now(),${dob_date})/365);;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: grade {
    type: string
    sql: ${TABLE}.Grade ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: latino {
    type: string
    sql: ${TABLE}.Latino ;;
  }

  dimension_group: membership_end_date {
    type: time
    sql: str_to_date(${TABLE}.`Membership End Date`,'%m/%d/%Y') ;;
    timeframes: [date, month, week, day_of_week, year]
  }

  dimension_group: membership_renew_date {
    type: time
    sql: str_to_date(${TABLE}.`Membership Renew Date`,'%m/%d/%Y');;
    timeframes: [date, week, day_of_week, month, year]
  }

  dimension_group: membership_start_date {
    type: time
    sql: str_to_date(${TABLE}.`Membership Start Date`,'%m/%d/%Y') ;;
    timeframes: [date, month, week, day_of_week, year]
  }

  dimension: native {
    type: string
    sql: ${TABLE}.Native ;;
  }

  dimension: no_english {
    type: string
    sql: ${TABLE}.NoEnglish ;;
  }

  dimension: other {
    type: string
    sql: ${TABLE}.Other ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.PersonID ;;
    primary_key: yes
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: student_id {
    type: number
    sql: ${TABLE}.StudentID ;;
  }

  dimension: white {
    type: string
    sql: ${TABLE}.White ;;
  }

  filter: gender_filter {
    type: string
    suggest_dimension: test
  }

  dimension: test {
    sql: (select Gender from digitalnest.member_information where Gender = 'Female' group by 1) ;;
  }

  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }

}
