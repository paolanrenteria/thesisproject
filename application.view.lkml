view:  application {
  derived_table: {
    sql:
      SELECT CAST(timestamp AS CHAR(50)) as timestamp,
             `Are you a new or existing member` as member,
             CONCAT(`First Name`, `First Name1`) as f_name,
             CONCAT(`Last Name`, `Last Name1`) as l_name,
             CONCAT(`Date of Birth`, `Date of Birth1`) as dob,
             CONCAT(`Age`, `Age1`) as age01,
             CONCAT(`Home Address`, `Home Address1`) as address,
             CONCAT(`City, State, Zip Code`, `City, State, Zip Code1`) as city,
             CONCAT(`Gender`, `Gender1`) as gender01,
             CONCAT(`Ethnicity`, `Ethnicity1`) as ethnicity01,
             CONCAT(`Languages spoken`, `Languages spoken1`) as languages,
             CONCAT(`Type of Institute`,`Type of Institute NOW`) as institute,
             CONCAT(`Name of School`, `Name of School1`) as school_name
      FROM application;;
      sql_trigger_value: SELECT 1 ;;
      indexes: ["timestamp"]
  }

  dimension:  timestamp {
    sql: ${TABLE}.timestamp ;;
    primary_key: yes
  }

  dimension_group: created {
    type: time
    timeframes: [date, month, week, year, day_of_week, day_of_week_index]
    sql: CASE WHEN LENGTH(${TABLE}.timestamp) !=0 THEN str_to_date(${TABLE}.timestamp, '%m/%d/%Y')
    END;;
  }

  dimension: yesnotest {
    type: yesno
    sql: ${created_day_of_week_index} <= WEEKDAY(NOW()) AND ${created_day_of_week_index} >= 0 ;;
  }

  measure:  count {
    type:  count
    drill_fields: [full_name, age, school_name]
  }

  measure: map_count {
    type: sum
    sql:
      CASE WHEN ${school_name}='Digital Nest' THEN 38.4117647059
      ELSE 1 END;;
    value_format_name: decimal_0
  }

  dimension: new_existing_member {
    sql:  ${TABLE}.member ;;
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

  dimension_group: dob {
    type: time
    timeframes: [raw, date, month, year, day_of_month]
    sql: str_to_date(${TABLE}.dob, '%m/%d/%Y') ;;
  }

  dimension:  age {
    type: number
    sql: ${TABLE}.age01 ;;
  }

  dimension: is_18 {
    type: yesno
    sql: ${age} = 18 ;;
  }

  measure: sum_18 {
    type: count
    filters: {
      field: is_18
      value: "yes"
    }
  }

  dimension: gender01 {
    sql: ${TABLE}.gender01;;
    hidden: yes
  }

  dimension: gender {
    sql:
      CASE WHEN ${gender01}='Female' THEN 'Female'
           WHEN ${gender01}='Male' THEN 'Male'
           WHEN ${gender01} LIKE '%agender%' THEN 'Agender'
           WHEN ${gender01} LIKE '%non%binary%' THEN 'Non-Binary'
      ELSE 'Other'
      END;;
  }

  dimension: ethnicity {
    sql:
      CASE WHEN ${TABLE}.ethnicity01 LIKE '%Hispanic%Latino%' THEN 'Chicano / Latino / Hispanic'
      ELSE ${TABLE}.ethnicity01
      END;;
  }

  dimension: address {
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    sql: ${TABLE}.city ;;
  }

  dimension: full_address {
    sql: CONCAT(${address}, ' ', ${city}) ;;
  }

  dimension: languages {
    sql: ${TABLE}.languages ;;
    hidden: yes
  }

  dimension: languages_spoken {
    sql:
      CASE WHEN ${languages} LIKE '%ilingual%' OR ${languages} = 'Spanish, English' OR ${languages} = 'English, Spanish' OR ${languages}='both' OR ${languages} = 'Spanish, English, Sarcasm' THEN 'English, Spanish'
           WHEN ${languages} LIKE '%sign%language%' THEN 'English, Sign Language'
           WHEN ${languages} = 'chewbaca' OR ${languages}='Spanish, English, Wookie' THEN 'Other'
           WHEN ${languages} = 'spanish german english' THEN 'Spanish, English, German'
      ELSE ${languages} END
           ;;
  }

  dimension: institute {
    sql: ${TABLE}.institute ;;
  }

  dimension: school {
    sql: ${TABLE}.school_name ;;
    hidden: yes
  }

  dimension: school_name {
    sql:
      CASE WHEN ${school} LIKE '%atso%igh%' OR ${school}='Watsonville'
                          OR ${school} LIKE '%whs%' OR ${school}='Wastsonville high school'
                          OR ${school}='wtsonville hig schol' THEN 'Watsonville High School'
           WHEN ${school} LIKE '%paj%ro%' OR ${school} LIKE '%panaro%'
                          OR ${school} LIKE '%pv%' THEN 'Pajaro Valley High School'
           WHEN ${school} LIKE '%cabr%' THEN 'Cabrillo College'
           WHEN ${school} LIKE '%ceiba%' OR ${school}='Ceba College Prep' THEN 'Ceiba College Prep'
           WHEN ${school} LIKE '%atsonville%community%' THEN 'Watsonville Community'
           WHEN ${school} LIKE '%charter%arts%' THEN 'Watsonville Charter School of the Arts'
           WHEN ${school} LIKE '%university%santa%cruz%' OR ${school}='UCSC' OR ${school}='UC Santa Cruz' THEN 'University of California, Santa Cruz'
           WHEN ${school} LIKE '%st%francis%' OR ${school} LIKE 'st%frnacis%' THEN 'St. Francis High School'
           WHEN ${school} LIKE '%SOS%' OR ${school}='S.O.S' THEN 'SOS Program'
           WHEN ${school} LIKE '%Rolling%Hills%' OR ${school}='Rollling Hills' THEN 'Rolling Hills Middle School'
           WHEN ${school} LIKE '%enaissance%' OR ${school}='reinissance' THEN 'Renaissance High School'
           WHEN ${school} LIKE '%pacific%coast%charter%' THEN 'Pacific Coast Charter School'
           WHEN ${school} LIKE '%lake%view%' THEN 'Lakeview Middle School'
           WHEN ${school} LIKE '%hartnell%' THEN 'Hartnell College'
           WHEN ${school} LIKE '%harbor%' THEN 'Harbor High School'
           WHEN ${school} LIKE '%e%a%hall%' OR ${school}='E.A.hal' THEN 'E.A. Hall Middle School'
           WHEN ${school} LIKE '%Diamond%' OR ${school}='diamante escuela' OR ${school}='DTI' THEN 'Diamond Technology Institute'
           WHEN ${school} LIKE '%soquel%' THEN 'Soquel High School'
           WHEN ${school} LIKE '%cesar%chave%' OR ${school}='ccms' OR ${school}='Caesar Chaves Middle School' THEN 'Cesar Chavez Middle School'
           WHEN ${school} LIKE '%aptos%high%school%' OR ${school}='Aptos' OR ${school}='Aptos high' THEN 'Aptos High School'
           WHEN ${school}='Aptos Jr. High' THEN 'Aptos Jr. High'
           WHEN ${school} LIKE '%alianza%charter%' OR ${school}='Alianza' THEN 'Alianza Charter School'
           WHEN ${school} LIKE '%freedom%' THEN 'Freedom Community School'
           WHEN LENGTH(${school}) = 0 THEN 'Digital Nest'
    ELSE ${school} END;;
  }

  dimension: school_latitude {
    type: number
    sql:
      CASE WHEN ${school_name} = 'Watsonville High School' THEN 36.9124517
           WHEN ${school_name} = 'Ceiba College Prep' THEN 36.9046266
           WHEN ${school_name} = 'New School' THEN 36.9143818
           WHEN ${school_name} = 'Pajaro Valley High School' THEN 36.9143238
           WHEN ${school_name} = 'Aptos High School' THEN 36.977339
           WHEN ${school_name} = 'Pacific Coast Charter School' THEN 36.9391902
           WHEN ${school_name} = 'Diamond Technology Institute' THEN 36.9236134
           WHEN ${school_name} = 'Renaissance High School' THEN 36.9269269
           WHEN ${school_name} = 'Cabrillo College' THEN 36.9891253
           WHEN ${school_name} = 'Lakeview Middle SChool' THEN 36.9385745
           WHEN ${school_name} = 'Rolling Hills Middle School' THEN 36.9243266
           WHEN ${school_name} = 'Cesar Chavez Middle School' THEN 36.920901
           WHEN ${school_name} = 'Alianza Charter School' THEN 36.9606058
           WHEN ${school_name} = 'University of California, Santa Cruz' THEN 36.9913856
           WHEN ${school_name} = 'Soquel High School' THEN 36.9917392
           WHEN ${school_name} = 'E.A. Hall Middle School' THEN 36.9190856
           WHEN ${school_name} = 'Digital Nest' THEN 36.9107675
      END;;
  }

  dimension:  school_longtitude {
    type: number
    sql:
     CASE WHEN ${school_name} = 'Watsonville High School' THEN -121.7548374
          WHEN ${school_name} = 'Ceiba College Prep' THEN -121.7627942
          WHEN ${school_name} = 'New School' THEN -121.779632
          WHEN ${school_name} = 'Pajaro Valley High School' THEN -121.7944518
          WHEN ${school_name} = 'Aptos High School' THEN -121.8642107
          WHEN ${school_name} = 'Pacific Coast Charter School' THEN -121.7711397
          WHEN ${school_name} = 'Diamond Technology Institute' THEN -121.7754667
          WHEN ${school_name} = 'Renaissance High School' THEN -121.8497187
          WHEN ${school_name} = 'Cabrillo College' THEN -121.9283347
          WHEN ${school_name} = 'Lakeview Middle School' THEN -121.7436627
          WHEN ${school_name} = 'Rolling Hills Middle School' THEN -121.7879957
          WHEN ${school_name} = 'Cesar Chavez Middle School' THEN -121.7718177
          WHEN ${school_name} = 'Alianza Charter School' THEN -121.7337808
          WHEN ${school_name} = 'University of California, Santa Cruz' THEN -122.0630605
          WHEN ${school_name} = 'Soquel High School' THEN -121.9618388
          WHEN ${school_name} = 'E.A. Hall Middle School' THEN -121.7547091
          WHEN ${school_name} = 'Digital Nest' THEN -121.7571914
    END;;
  }

  dimension: location {
    type: location
    sql_latitude: ${school_latitude} ;;
    sql_longitude: ${school_longtitude} ;;
  }

#   dimension: icon {
#   sql: CASE WHEN ${school_name}='Digital Nest' THEN ${school_name} END ;;
#   html: <a href="http://digitalnest.org/" target="_blank"><img src="https://pbs.twimg.com/profile_images/479825350218620928/Zul2HpV__400x400.jpeg"  width="75" height="75" /></a> ;;
# }

  dimension: icon {
    sql: CASE WHEN ${school_name} = 'Digital Nest' THEN ${school_name} END;;
    html: <img src="http://digitalnest.org/wp-content/uploads/digital_nest-logo.png" width="309" height="125" /> ;;
  }
}


# dimension:  contact_0 {
#   sql: ${TABLE}.`First Name2` ;;
#   hidden: yes
# }
#
# dimension:  contact_1 {
#   sql: ${TABLE}.`First Name3` ;;
#   hidden: yes
# }
#
# dimension:  contact_2 {
#   sql: ${TABLE}.`First Name4` ;;
#   hidden: yes
# }
#
# dimension:  contact_3 {
#   sql: ${TABLE}.`First Name5` ;;
#   hidden: yes
# }
