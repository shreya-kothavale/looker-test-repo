view: state_code_table {
  sql_table_name: `qp-qai-training-1-2021-05.demo_df_dataset.state_code_table`
    ;;

  dimension: callid {
    type: string
    sql: ${TABLE}.callid ;;
  }

  dimension: country {
    type: string
    map_layer_name: usa_canada_map
    sql: ${TABLE}.country ;;

  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name : usa_canada_map
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
