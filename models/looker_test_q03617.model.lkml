connection: "qai_de_looker_training_prod_q03617_shreya_kothavale"

# include all the views
include: "/views/**/dialogflow_cleaned_logs.view"
include: "/views/**/session_level.view"
include: "/views/**/exit_intent.view"
include: "/views/**/second_last_intent.view"
include: "/views/**/conversation_length.view"
include: "/views/**/deflection.view"
include: "/views/**/intent_correlation.view"
include: "/dashboard/looker_test_q03617_dashboard.dashboard.lookml"

# datagroup: looker_test_q03617_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "every 1 minute"
#   interval_trigger: "every 1 minute"
# }

# persist_with: looker_test_q03617_default_datagroup_default_datagroup

explore: dialogflow_cleaned_logs {
  join: conversation_length {
    type: full_outer
    relationship: one_to_many
    sql_on: dialogflow_cleaned_logs.session_id = conversation_length.session_id ;;
    # fields: [call_duration_bucket, session_id]
  }
  join: intent_correlation {
    type: left_outer
    relationship: one_to_many
    sql_on: dialogflow_cleaned_logs.response_id = intent_correlation.response_id ;;
  }
}

explore: session_level {
  join: exit_intent {
    type: left_outer
    relationship: one_to_one
    sql_on: session_level.session_id = exit_intent.session_id ;;
    # fields: [exit_intent]
  }
  join: second_last_intent {
    type: left_outer
    relationship: one_to_one
    sql_on: session_level.session_id = second_last_intent.session_id ;;
    # fields: [second_last_intent]
  }
  join: conversation_length {
    type: left_outer
    relationship: one_to_one
    sql_on: session_level.session_id = conversation_length.session_id ;;
    # fields: []
  }
  join: deflection {
    type: left_outer
    relationship: one_to_one
    sql_on: session_level.session_id = deflection.session_id ;;
    # fields: []
  }


}
