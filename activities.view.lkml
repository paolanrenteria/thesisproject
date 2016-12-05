view:  activities {
  derived_table: {
    sql:
      SELECT
        MAX(CASE WHEN field_number = 1 THEN value END) as username,
        MAX(CASE WHEN field_number LIKE '28.1' THEN value END) as after_school_programs,
        MAX(CASE WHEN field_number LIKE '28.11' THEN value END) as folklorico,
        MAX(CASE WHEN field_number LIKE '28.12' THEN value END) as drama,
        MAX(CASE WHEN field_number LIKE '28.13' THEN value END) as arts_and_crafts,
        MAX(CASE WHEN field_number LIKE '28.2' THEN value END) as baseball,
        MAX(CASE WHEN field_number LIKE '28.3' THEN value END) as basketball,
        MAX(CASE WHEN field_number LIKE '28.4' THEN value END) as flag_football,
        MAX(CASE WHEN field_number LIKE '28.5' THEN value END) as karate,
        MAX(CASE WHEN field_number LIKE '28.6' THEN value END) as soccer,
        MAX(CASE WHEN field_number LIKE '28.7' THEN value END) as swimming,
        MAX(CASE WHEN field_number LIKE '28.8' THEN value END) as softball,
        MAX(CASE WHEN field_number LIKE '28.9' THEN value END) as youth_now,
        MAX(CASE WHEN field_number = 29 THEN value END) as other_activities,
        MAX(CASE WHEN field_number = 31 THEN value END) as enjoy_school,
        MAX(CASE WHEN field_number = 51 THEN value END) as extra_activities,
        MAX(CASE WHEN field_number LIKE '62.1' THEN value END) as teamwork_collab,
        MAX(CASE WHEN field_number LIKE '62.11' THEN value END) as self_confidence,
        MAX(CASE WHEN field_number LIKE '62.2' THEN value END) as communication,
        MAX(CASE WHEN field_number LIKE '62.3' THEN value END) as adaptability,
        MAX(CASE WHEN field_number LIKE '62.5' THEN value END) as critical_observ,
        MAX(CASE WHEN field_number LIKE '62.6' THEN value END) as conflict_resolution,
        MAX(CASE WHEN field_number LIKE '62.7' THEN value END) as active_listening,
        MAX(CASE WHEN field_number LIKE '62.8' THEN value END) as time_management,
        MAX(CASE WHEN field_number LIKE '62.9' THEN value END) as positive_attitude,
        MAX(CASE WHEN field_number LIKE '6.3' THEN value END) as name,
        MAX(CASE WHEN field_number LIKE '6.6' THEN value END) as last_name
      FROM wp_ivlu_rg_lead_detail
      WHERE lead_id NOT IN (411, 421, 412, 413, 415, 416, 422, 423, 424, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 458, 459, 460)
      GROUP BY lead_id
    ;;
    sql_trigger_value: SELECT 1 ;;
    indexes: ["primary_key"]
  }

  dimension: username {
    sql:  ${TABLE}.username ;;
  }

  dimension: primary_key {
    sql: CONCAT(${username}, "-", ${student_name}) ;;
    primary_key: yes
  }

  dimension: first_name {
    sql: ${TABLE}.name ;;
  }

  dimension: last_name {
    sql: ${TABLE}.last_name ;;
  }

  dimension: student_name {
    sql: CONCAT(${first_name}, " ", ${last_name}) ;;
  }

  dimension:  after_school_programs {
    sql:  ${TABLE}.after_school_programs ;;
  }

  dimension: participates_in_after_school_programs {
    type: yesno
    sql: ${after_school_programs} IS NOT NULL  ;;
  }

  dimension: involved_in_sports {
    type: yesno
    sql: ${baseball} IS NOT NULL OR ${basketball} IS NOT NULL
        OR ${flag_football} IS NOT NULL OR ${karate} IS NOT NULL
        OR ${soccer} IS NOT NULL OR ${swimming} IS NOT NULL
        OR ${softball} IS NOT NULL;;
  }

  dimension: folklorico {
    sql: ${TABLE}.folklorico ;;
  }

  dimension: drama {
    sql: ${TABLE}.drama ;;
  }

  dimension: arts_and_crafts {
    sql: ${TABLE}.arts_and_crafts ;;
  }

  dimension: baseball {
    sql: ${TABLE}.baseball ;;
  }

  dimension: basketball {
    sql: ${TABLE}.basketball ;;
  }

  dimension: flag_football {
    sql: ${TABLE}.flag_football ;;
  }

  dimension: karate {
    sql: ${TABLE}.karate ;;
  }

  dimension: soccer {
    sql: ${TABLE}.soccer ;;
  }

  dimension: swimming {
    sql: ${TABLE}.swimming ;;
  }

  dimension: softball {
    sql: ${TABLE}.softball ;;
  }

  dimension: youth_now {
    sql: ${TABLE}.youth_now ;;
  }

  dimension: other_activities {
    sql: ${TABLE}.other_activities ;;
  }

  dimension: enjoy_school {
    sql: ${TABLE}.enjoy_school ;;
  }

  dimension: extra_activities {
    sql: ${TABLE}.extra_activities ;;
  }

  dimension: teamwork_collab {
    sql: ${TABLE}.teamwork_collab ;;
  }

  dimension: self_confidence {
    sql: ${TABLE}.self_confidence ;;
  }

  dimension: communication {
    sql: ${TABLE}.communication ;;
  }

  dimension: adaptability {
    sql: ${TABLE}.adaptability ;;
  }

  dimension: critical_observ {
    sql: ${TABLE}.critical_observ ;;
  }

  dimension: conflict_resolution {
    sql: ${TABLE}.conflict_resolution ;;
  }

  dimension: active_listening {
    sql: ${TABLE}.active_listening ;;
  }

  dimension: time_management {
    sql: ${TABLE}.time_management ;;
  }

  dimension: positive_attitude {
    sql: ${TABLE}.positive_attitude ;;
  }
}
