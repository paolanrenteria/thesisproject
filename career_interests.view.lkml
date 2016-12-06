view: career_interests {
  derived_table: {
    sql: SELECT
          DISTINCT lead_id as lead_id,
          MAX(CASE WHEN field_number = 1 THEN CAST(value as CHAR(50)) END) as username,
          MAX(CASE WHEN field_number LIKE '93.1' THEN value END) as agriculture_natural,
          MAX(CASE WHEN field_number LIKE '93.11' THEN value END) as hospitality_tourism,
          MAX(CASE WHEN field_number LIKE '93.12' THEN value END) as information_tech,
          MAX(CASE WHEN field_number LIKE '93.13' THEN value END) as manufacturing_product,
          MAX(CASE WHEN field_number LIKE '93.14' THEN value END) as marketing_sales,
          MAX(CASE WHEN field_number LIKE '93.15' THEN value END) as public_services,
          MAX(CASE WHEN field_number LIKE '93.16' THEN value END) as transportation,
          MAX(CASE WHEN field_number LIKE '93.2' THEN value END) as arts_media,
          MAX(CASE WHEN field_number LIKE '93.3' THEN value END) as building_construction,
          MAX(CASE WHEN field_number LIKE '93.4' THEN value END) as education_family_child,
          MAX(CASE WHEN field_number LIKE '93.5' THEN value END) as energy_utilities,
          MAX(CASE WHEN field_number LIKE '93.6' THEN value END) as engineering_design,
          MAX(CASE WHEN field_number LIKE '93.7' THEN value END) as fashion_design,
          MAX(CASE WHEN field_number LIKE '93.8' THEN value END) as finance_business,
          MAX(CASE WHEN field_number LIKE '93.9' THEN value END) as health_science_tech
          FROM wp_ivlu_rg_lead_detail
          WHERE lead_id NOT IN (411, 421, 412, 413, 415, 416, 422, 423, 424, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 458, 459, 460)
          GROUP BY lead_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: lead_id {
    type: number
    sql: ${TABLE}.lead_id ;;
    primary_key: yes
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: agriculture_natural {
    type: string
    sql: ${TABLE}.agriculture_natural ;;
  }

  dimension: hospitality_tourism {
    type: string
    sql: ${TABLE}.hospitality_tourism ;;
  }

  dimension: information_tech {
    type: string
    sql: ${TABLE}.information_tech ;;
  }

  dimension: manufacturing_product {
    type: string
    sql: ${TABLE}.manufacturing_product ;;
  }

  dimension: marketing_sales {
    type: string
    sql: ${TABLE}.marketing_sales ;;
  }

  dimension: public_services {
    type: string
    sql: ${TABLE}.public_services ;;
  }

  dimension: transportation {
    type: string
    sql: ${TABLE}.transportation ;;
  }

  dimension: arts_media {
    type: string
    sql: ${TABLE}.arts_media ;;
  }

  dimension: building_construction {
    type: string
    sql: ${TABLE}.building_construction ;;
  }

  dimension: education_family_child {
    type: string
    sql: ${TABLE}.education_family_child ;;
  }

  dimension: energy_utilities {
    type: string
    sql: ${TABLE}.energy_utilities ;;
  }

  dimension: engineering_design {
    type: string
    sql: ${TABLE}.engineering_design ;;
  }

  dimension: fashion_design {
    type: string
    sql: ${TABLE}.fashion_design ;;
  }

  dimension: finance_business {
    type: string
    sql: ${TABLE}.finance_business ;;
  }

  dimension: health_science_tech {
    type: string
    sql: ${TABLE}.health_science_tech ;;
  }

  measure: agriculture {
    type: count
    filters: {
      value: "-NULL"
      field: agriculture_natural
    }
  }

  measure: hospitality_and_tourism {
    type: count
    filters: {
      value: "-NULL"
      field: hospitality_tourism
    }
  }

  measure: arts_and_media {
    type: count
    filters: {
      field: arts_media
      value: "-NULL"
    }
  }

  measure: building_and_construction {
    type: count
    filters: {
      field: building_construction
      value: "-NULL"
    }
  }

  measure: education_and_family {
    type: count
    filters: {
      field: education_family_child
      value: "-NULL"
    }
  }

  measure: energy_and_utilities {
    type: count
    filters: {
      field: energy_utilities
      value: "-NULL"
    }
  }

  measure: engineering_and_design {
    type: count
    filters: {
      field: engineering_design
      value: "-NULL"
    }
  }

  measure: fashion_and_design {
    type: count
    filters: {
      field: fashion_design
      value: "-NULL"
    }
  }

  measure: finance_and_business {
    type: count
    filters: {
      field: finance_business
      value: "-NULL"
    }
  }
  measure: health_and_science_tech {
    type: count
    filters: {
      field: health_science_tech
      value: "-NULL"
    }
  }
  measure: info_and_tech {
    type: count
    filters: {
      field: information_tech
      value: "-NULL"
    }
  }

  measure: manufacturing_and_product {
    type: count
    filters: {
      field: manufacturing_product
      value: "-NULL"
    }
  }

  measure: marketing_and_sales {
    type: count
    filters: {
      field: marketing_sales
      value: "-NULL"
    }
  }

  measure: public_services_v2 {
    label: "Public Services"
    type: count
    filters: {
      field: fashion_design
      value: "-NULL"
    }
  }

  measure: transporation_v2 {
    label: "Transportation"
    type: count
    filters: {
      field: transportation
      value: "-NULL"
    }
  }

  set: detail {
    fields: [lead_id, username, agriculture_natural, hospitality_tourism, information_tech, manufacturing_product, marketing_sales, public_services, transportation, arts_media, building_construction, education_family_child, energy_utilities, engineering_design, fashion_design, finance_business, health_science_tech]
  }
}
