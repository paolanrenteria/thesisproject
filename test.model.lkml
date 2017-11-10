connection: "digital_nest"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: users {
  label: "USERS"
  view_label: "USERS"
  join: ndt_test_thing {
    from: ndt_test
    fields: [ndt_test_thing.age, ndt_test_thing.gender]
    sql_on: ${users.age} = ${ndt_test_thing.age} ;;
    relationship: one_to_one
  }
  join: ndt_test_thing_two {
    from: ndt_test_2
    fields: [ndt_test_thing_two.count, ndt_test_thing_two.gender, ndt_test_thing_two.age]
    sql_on: ${ndt_test_thing_two.age} = ${users.age} ;;
    relationship: one_to_one
  }
}
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
