connection: "digital_nest"
include: "*.view.lkml"
include: "*.dashboard"

explore: wp_ivlu_rg_lead_detail {
  hidden: yes
}

explore: users_v2 {
  from: users
  view_name: users
  hidden: yes
  join: wp_ivlu_rg_lead_detail {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.lead_id} = ${wp_ivlu_rg_lead_detail.lead_id} ;;
  }
  join: education {}
}

explore: users {
  join:  household {
    sql_on: ${users.username} = ${household.username} ;;
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
  join: career_interests {
    sql_on: ${career_interests.lead_id} = ${users.lead_id} ;;
    relationship: one_to_one
  }
}

explore:  household {
  hidden: yes
}

explore: atten_activities {
  label: "Attendance and Information"
  view_label: "Attendance"
  from: atten_per_day
  join: users {
    type: left_outer
    sql_on: TRIM(LOWER(${atten_activities.student_name_2})) = TRIM(LOWER(${users.full_name})) ;;
    relationship: many_to_one
  }
  join: activities {
    type: left_outer
    relationship: many_to_one
    sql_on: TRIM(LOWER(${atten_activities.student_name_2})) = TRIM(LOWER(${activities.student_name})) ;;
  }
  join: household {
    sql_on: ${users.username} = ${household.username};;
    relationship: one_to_one
  }
  join: education {
    sql_on: ${users.username} = ${education.username} ;;
    relationship: one_to_one
  }
  join: career_interests {
    sql_on: ${career_interests.lead_id} = ${users.lead_id};;
    relationship: one_to_one
  }
}

explore:  sign_in {
}

explore:  application {
}

explore: attendance {}

explore: member_information {}

explore: attenmarch {
  hidden: yes
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
  hidden: yes
  from: whitespace
}

explore: atten_per_day {
  label: "Attendance Per Day - Since Jan"
  view_label: "Attendance"
  join: member_information {
    type: left_outer
    relationship: many_to_one
    sql_on: ${atten_per_day.person_id} = ${member_information.person_id} ;;
  }
}
