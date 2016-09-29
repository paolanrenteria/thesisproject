- connection: digital_nest

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: wp_ivlu_rg_lead_detail
  hidden: true

- explore: users

- explore: household

# - explore: time_zone

# - explore: time_zone_leap_second

# - explore: time_zone_name
#   joins:
#     - join: time_zone
#       type: left_outer 
#       sql_on: ${time_zone_name.time_zone_id} = ${time_zone.time_zone_id}
#       relationship: many_to_one


# - explore: time_zone_transition
#   joins:
#     - join: time_zone
#       type: left_outer 
#       sql_on: ${time_zone_transition.time_zone_id} = ${time_zone.time_zone_id}
#       relationship: many_to_one


# - explore: time_zone_transition_type
#   joins:
#     - join: time_zone
#       type: left_outer 
#       sql_on: ${time_zone_transition_type.time_zone_id} = ${time_zone.time_zone_id}
#       relationship: many_to_one


# - explore: u_users

# - explore: users

# - explore: wp_ivlu_bp_activity
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_bp_activity.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_bp_activity_meta

# - explore: wp_ivlu_bp_friends

# - explore: wp_ivlu_bp_groups

# - explore: wp_ivlu_bp_groups_groupmeta

# - explore: wp_ivlu_bp_groups_members
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_bp_groups_members.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_bp_notifications
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_bp_notifications.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_bp_notifications_meta

# - explore: wp_ivlu_bp_user_blogs
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_bp_user_blogs.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_bp_user_blogs_blogmeta

# - explore: wp_ivlu_bp_xprofile_data
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_bp_xprofile_data.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_bp_xprofile_fields

# - explore: wp_ivlu_bp_xprofile_groups

# - explore: wp_ivlu_bp_xprofile_meta

# - explore: wp_ivlu_commentmeta

# - explore: wp_ivlu_comments
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_comments.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_gf_addon_feed

# - explore: wp_ivlu_links

# - explore: wp_ivlu_options

# - explore: wp_ivlu_p2p

# - explore: wp_ivlu_p2pmeta

# - explore: wp_ivlu_postmeta

# - explore: wp_ivlu_posts

# - explore: wp_ivlu_rg_form

# - explore: wp_ivlu_rg_form_meta

# - explore: wp_ivlu_rg_form_view

# - explore: wp_ivlu_rg_incomplete_submissions

# - explore: wp_ivlu_rg_lead

# - explore: wp_ivlu_rg_lead_detail_long

# - explore: wp_ivlu_rg_lead_meta

# - explore: wp_ivlu_rg_lead_notes
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_rg_lead_notes.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_rg_userregistration

# - explore: wp_ivlu_signups

# - explore: wp_ivlu_term_relationships

# - explore: wp_ivlu_term_taxonomy

# - explore: wp_ivlu_termmeta

# - explore: wp_ivlu_terms

# - explore: wp_ivlu_usermeta
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_usermeta.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_users

# - explore: wp_ivlu_wp_pro_quiz_category

# - explore: wp_ivlu_wp_pro_quiz_form

# - explore: wp_ivlu_wp_pro_quiz_lock
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_wp_pro_quiz_lock.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_wp_pro_quiz_master

# - explore: wp_ivlu_wp_pro_quiz_prerequisite

# - explore: wp_ivlu_wp_pro_quiz_question

# - explore: wp_ivlu_wp_pro_quiz_statistic

# - explore: wp_ivlu_wp_pro_quiz_statistic_ref
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_wp_pro_quiz_statistic_ref.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: wp_ivlu_wp_pro_quiz_template

# - explore: wp_ivlu_wp_pro_quiz_toplist
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${wp_ivlu_wp_pro_quiz_toplist.user_id} = ${users.user_id}
#       relationship: many_to_one


