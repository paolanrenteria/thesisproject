view: pdt_test {
    derived_table:  {
      sql: SELECT
        DISTINCT lead_id as lead_id,
        MAX(CASE WHEN field_number = 1 THEN CAST(value as CHAR(50)) END) as username,
        MAX(CASE WHEN field_number LIKE '6.3' THEN value END) as name,
        MAX(CASE WHEN field_number LIKE '6.6' THEN value END) as last_name,
        MAX(CASE WHEN field_number = 176 THEN value END) as user_gender,
        MAX(CASE WHEN field_number = 3 THEN value END) as date_of_birth,
        MAX(CASE WHEN field_number = 5 THEN value END) as email,
        MAX(CASE WHEN field_number = 178 THEN value END) as phone,
        MAX(CASE WHEN field_number = 4 THEN value END) as current_education
      FROM wp_ivlu_rg_lead_detail
      WHERE lead_id NOT IN (411, 421, 412, 413, 415, 416, 422, 423, 424, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 458, 459, 460)
      AND {% condition name %} username {% endcondition %}
      GROUP BY lead_id
       ;;
      sql_trigger_value: SELECT 1 ;;
      indexes: ["username"]
    }

    filter: name {
      default_value: "Paola"
    }
    dimension: username {
      type: string
      sql: ${TABLE}.username ;;
    }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: pdt_test {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
