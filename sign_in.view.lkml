view: sign_in{
  derived_table: {
    sql:
    SELECT max(CAST(timestamp as CHAR(50))) AS timestamp,
      CONCAT(`First name`, `First name_1`, `First Name_2`) AS f_name,
      CONCAT(`Last name`,`Last name_1`,`Last Name_2`) AS l_name,
      `Are you a NEW or EXISTING member?` AS existing_member,
      age AS age,
      `Educational institution` AS educational_institution,
      CONCAT(`Email address`, `Emailaddress`) AS email,
      max(`Email address_1`) AS email1,
      CONCAT(`Phone number`, `Phone`) AS phone_number,
      max(`Phone_1`),
      `Please select an organization affiliation from the list below:` AS affiliation,
      `Please select your contributing member type below:` AS member_type
      FROM sign_in
    GROUP BY timestamp;;
    sql_trigger_value: SELECT 1 ;;
    indexes: ["timestamp"]
  }

  dimension: timestamp {
    sql:  ${TABLE}.timestamp ;;
    primary_key: yes
  }

  measure:  count {
    type: count
  }

  dimension_group: sign_in {
    type:  time
    timeframes: [raw, time, date, month, week, quarter, year, day_of_week]
    sql: str_to_date(${timestamp}, '%m/%d/%Y %H:%i:%s') ;;
  }

  dimension: first_name {
    sql: ${TABLE}.f_name ;;
  }

  dimension: last_name {
    sql: ${TABLE}.l_name ;;
  }

  dimension: full_name {
    sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
  }

  dimension: email_address {
    sql: ${TABLE}.email ;;
    html: <a href="mailto:{{value}}">{{value}}</a> ;;
  }

  dimension: existing_member {
    sql: ${TABLE}.existing_member ;;
  }

  dimension: age {
    sql: ${TABLE}.age ;;
  }

  dimension: educational_institution {
    sql:  ${TABLE}.educational_institution ;;
  }

  dimension:  affiliation {
    sql: ${TABLE}.affiliation ;;
  }

  dimension: member_type {
    sql: ${TABLE}.member_type ;;
  }
}
