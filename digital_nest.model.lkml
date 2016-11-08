connection: "digital_nest"
include: "*.view.lkml"
include: "*.dashboard.lkml"

explore: wp_ivlu_rg_lead_detail {
  hidden: yes
}

explore:  users {
  join:  household {
    sql_on:  ${users.username} = ${household.username} ;;
    relationship: one_to_one
  }
  join: activities {
    sql_on: ${users.username} = ${activities.username} ;;
    relationship: one_to_one
  }
  join: education {
    sql_on: ${users.username} = ${education.username} ;;
    relationship: one_to_one
  }
}

explore:  household {}

explore:  sign_in {}

explore:  application {}

explore: attendance {}
