view: education {
  derived_table: {
    sql:
    SELECT
      MAX(CASE WHEN field_number = 1 THEN CAST(value AS CHAR(50)) END) as username,
      MAX(CASE WHEN field_number = 4 THEN value END) as education_level,
      MAX(CASE WHEN field_number = 27 THEN value END) as mid_school_grade,
      MAX(CASE WHEN field_number = 8 THEN value END) as high_school,
      MAX(CASE WHEN field_number = 9 THEN value END) as slc,
      MAX(CASE WHEN field_number = 10 THEN value END) as slc_first_choice,
      MAX(CASE WHEN field_number = 13 THEN value END) as grade,
      MAX(CASE WHEN field_number = 16 THEN value END) as local_after_hs,
      MAX(CASE WHEN field_number LIKE '19.1' THEN value END) as technical_inst,
      MAX(CASE WHEN field_number LIKE '19.11' THEN value END) as other_inst,
      MAX(CASE WHEN field_number LIKE '19.2' THEN value END) as community_college,
      MAX(CASE WHEN field_number LIKE '19.3' THEN value END) as csu,
      MAX(CASE WHEN field_number LIKE '19.4' THEN value END) as uc,
      MAX(CASE WHEN field_number LIKE '19.5' THEN value END) as private,
      MAX(CASE WHEN field_number LIKE '19.6' THEN value END) as out_of_state,
      MAX(CASE WHEN field_number LIKE '19.7' THEN value END) as international,
      MAX(CASE WHEN field_number LIKE '19.8' THEN value END) as business_acc,
      MAX(CASE WHEN field_number LIKE '19.9' THEN value END) as none_inst,
      MAX(CASE WHEN field_number = 20 THEN value END) as study_in_college,
      MAX(CASE WHEN field_number = 21 THEN value END) as college_to_attend,
      MAX(CASE WHEN field_number = 25 THEN value END) as awards_honors,
      MAX(CASE WHEN field_number = 40 THEN value END) as college_currently_attending,
      MAX(CASE WHEN field_number = 57 THEN value END) as ever_employed,
      MAX(CASE WHEN field_number = 58 THEN value END) as currently_employed
    FROM wp_ivlu_rg_lead_detail
    WHERE lead_id NOT IN (411, 421, 412, 413, 415, 416, 422, 423, 424, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 458, 459, 460)
    GROUP BY lead_id
    ;;
    sql_trigger_value: SELECT 1 ;;
    indexes: ["username"]
  }

  dimension: username {
    sql:  ${TABLE}.username ;;
    primary_key: yes
  }

  dimension:  education_level {
    sql:  ${TABLE}.education_level ;;
  }

  dimension: mid_school_grade {
    sql: ${TABLE}.mid_school_grade ;;
  }

  dimension: high_school {
    sql: ${TABLE}.high_school ;;
  }

  dimension: slc {
    sql: ${TABLE}.slc ;;
  }

  dimension: slc_first_choice {
    sql: ${TABLE}.slc_first_choice ;;
  }

  dimension: grade {
    sql: ${TABLE}.grade ;;
  }

  dimension: local_after_hs {
    sql: ${TABLE}.local_after_hs ;;
  }

  dimension: technical_inst {
    sql: ${TABLE}.technical_inst ;;
  }

  dimension: other_inst {
    sql: ${TABLE}.other_inst ;;
  }

  dimension: community_college {
    sql: ${TABLE}.community_college ;;
  }

  dimension: csu {
    sql: ${TABLE}.csu ;;
  }

  dimension: uc {
    sql: ${TABLE}.uc ;;
  }

  dimension: private {
    sql: ${TABLE}.private ;;
  }

  dimension: out_of_state {
    sql: ${TABLE}.out_of_state ;;
  }

  dimension: international {
    sql: ${TABLE}.international ;;
  }

  dimension: business_acc {
    sql: ${TABLE}.business_acc ;;
  }

  dimension: none_inst {
    sql: ${TABLE}.none_inst ;;
  }

  dimension: study_in_college {
    sql: ${TABLE}.study_in_college ;;
  }

  dimension:college_to_attend {
    sql: ${TABLE}.college_to_attend ;;
  }

  dimension: awards_honors {
    sql: ${TABLE}.awards_honors ;;
  }

  dimension: college_currently_attending {
    sql: ${TABLE}.college_currently_attending;;
    hidden: yes
  }

  dimension: current_college {
    sql:
      CASE WHEN ${college_currently_attending} LIKE '%cabrillo%' THEN 'Cabrillo College'
           ELSE ${college_currently_attending} END;;
  }

  dimension: ever_employed {
    sql: ${TABLE}.ever_employed ;;
  }

  dimension: currently_employed {
    sql: ${TABLE}.currently_employed ;;
  }

  dimension: map_schools {
    type:  string
    sql:
      CASE WHEN ${high_school} = 'Watsonville High School' THEN 'Watsonville High School'
          WHEN ${high_school} = 'Ceiba College Prep' THEN 'Ceiba College Prep'
          WHEN ${high_school} = 'New School' THEN 'New School'
          WHEN ${high_school} = 'Pajaro Valley High School' THEN 'Pajaro Valley High School'
          WHEN ${high_school} = 'Aptos High School' THEN 'Aptos High School'
          WHEN ${high_school} = 'Pacific Coast Charter' THEN 'Pacific Coast Charter'
          WHEN ${high_school} = 'Diamond Technology Institute' THEN 'Diamond Technology Institute'
          WHEN ${high_school} = 'Renaissance High School' THEN 'Renaissance High School'
          WHEN ${current_college} = 'Cabrillo College' THEN 'Cabrillo College'
      END;;
  }

  dimension: school_latitude {
    type: number
    sql:
      CASE WHEN ${high_school} = 'Watsonville High School' THEN 36.9124517
           WHEN ${high_school} = 'Ceiba College Prep' THEN 36.9046266
           WHEN ${high_school} = 'New School' THEN 36.9143818
           WHEN ${high_school} = 'Pajaro Valley High School' THEN 36.9143238
           WHEN ${high_school} = 'Aptos High School' THEN 36.977339
           WHEN ${high_school} = 'Pacific Coast Charter School' THEN 36.9391902
           WHEN ${high_school} = 'Diamond Technology Institute' THEN 36.9236134
           WHEN ${high_school} = 'Renaissance High School' THEN 36.9269269
           WHEN ${current_college} = 'Cabrillo College' THEN 36.9891253
      END;;
  }

  dimension:  school_longtitude {
    type: number
    sql:
     CASE WHEN ${high_school} = 'Watsonville High School' THEN -121.7548374
          WHEN ${high_school} = 'Ceiba College Prep' THEN -121.7627942
          WHEN ${high_school} = 'New School' THEN -121.779632
          WHEN ${high_school} = 'Pajaro Valley High School' THEN -121.7944518
          WHEN ${high_school} = 'Aptos High School' THEN -121.8642107
          WHEN ${high_school} = 'Pacific Coast Charter School' THEN -121.7711397
          WHEN ${high_school} = 'Diamond Technology Institute' THEN -121.7754667
          WHEN ${high_school} = 'Renaissance High School' THEN -121.8497187
          WHEN ${current_college} = 'Cabrillo College' THEN -121.9283347
     END;;
  }

  dimension: location {
    type: location
    sql_latitude: ${school_latitude} ;;
    sql_longitude: ${school_longtitude} ;;
  }
}
