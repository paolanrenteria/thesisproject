view: wp_ivlu_rg_lead_detail {
  sql_table_name: digitalnest.wp_ivlu_rg_lead_detail ;;
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: field_number {
    type: number
    sql: ${TABLE}.field_number ;;
  }

  dimension: form_id {
    type: number
    sql: ${TABLE}.form_id ;;
  }

  dimension: lead_id {
    type: number
    sql: ${TABLE}.lead_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

#   dimension: agriculture {
#     sql: CASE WHEN ${field_number} >= 97 AND ${field_number} <= 104 THEN 'Agriculture'
#     END;;
#   }
#
#   dimension: interested_in_ag {
#     type: yesno
#     sql: ${agriculture} IS NOT NULL ;;
#   }
#
#   dimension: arts_media_entertainment {
#     sql: CASE WHEN ${field_number} >= 107 AND ${field_number} <= 109 THEN 'Arts / Media / Entertainment'
#       END;;
#   }
#
#   dimension: interested_in_arts {
#     type: yesno
#     sql: ${arts_media_entertainment} IS NOT NULL ;;
#   }
#
#   dimension: building_trades_construction {
#     sql: CASE WHEN ${field_number} >= 111 AND ${field_number} <= 114 THEN 'Building Trades / Construction'
#       END;;
#   }
#
#   dimension: education_family_development {
#     sql: CASE WHEN ${field_number} >= 116 AND ${field_number} <= 119 THEN 'Education / Family Services / Child Development'
#       END;;
#   }
#
#   dimension: engineering_design {
#     sql: CASE WHEN ${field_number} >= 121 AND ${field_number} <= 125 THEN 'Engineering / Design Industry'
#       END;;
#   }
#
#   dimension: energy_utilities {
#     sql: CASE WHEN ${field_number} >= 127 AND ${field_number} <= 130 THEN 'Energy / Utilities Industry'
#       END;;
#   }
#
#   dimension: fashion_interior_design {
#     sql: CASE WHEN ${field_number} >= 132 AND ${field_number} <= 133 THEN 'Fashion / Interior Design'
#       END;;
#   }
#
#   dimension: finance_business {
#     sql: CASE WHEN ${field_number} >= 135 AND ${field_number} <= 137 THEN 'Finance / Business'
#       END;;
#   }
#
#   dimension: health_science_medical_tech {
#     sql: CASE WHEN ${field_number} >= 139 AND ${field_number} <= 144 THEN 'Health Science / Medical Technology'
#       END;;
#   }

}
