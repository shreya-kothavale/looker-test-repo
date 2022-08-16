connection: "qai_de_looker_training_prod_q03617_shreya_kothavale"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

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
