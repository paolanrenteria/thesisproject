connection: "digital_nest"
include: "*.view.lkml"
include: "*.dashboard"

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

explore:  household {
}

explore:  sign_in {
}

explore:  application {
}

explore: attendance {
  join: member_information {
    type: left_outer
    relationship: one_to_one
    sql_on: ${attendance.person_id} = ${member_information.person_id} ;;
  }
}

explore: member_information {}

explore: attenmarch {
  label: "Attendance Per Day"
  join: attenmay {
    type: left_outer
    relationship: one_to_one
    sql_on: ${attenmarch.person_id} = ${attenmay.may_person_id} ;;
    }
  join: attenjuly {
      type: left_outer
      relationship: one_to_one
      sql_on: ${attenmarch.person_id} = ${attenjuly.july_person_id} ;;
  }
  join: attensept {
    type: left_outer
    relationship: one_to_one
    sql_on: ${attenmarch.person_id} = ${attensept.sept_person_id} ;;
  }
  join: attennov {
    type: left_outer
    relationship: one_to_one
    sql_on: ${attenmarch.person_id} = ${attennov.nov_person_id} ;;
 }
}

explore: description {
  from: whitespace
}
