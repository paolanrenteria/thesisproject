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
  
}

