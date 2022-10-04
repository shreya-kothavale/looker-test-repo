view: dialogflow_cleaned_logs {
  sql_table_name: `looker_training_prod.dialogflow_cleaned_logs`
    ;;

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: yes
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: intent_detection_confidence {
    type: number
    sql: ${TABLE}.intent_detection_confidence ;;
  }

  dimension: intent_triggered {
    type: string
    sql: ${TABLE}.intent_triggered ;;
  }

  dimension: is_fallback {
    type: yesno
    sql: ${TABLE}.isFallback ;;
  }

  dimension: language_code {
    type: string
    sql: ${TABLE}.language_code ;;
  }

  dimension: magnitude {
    type: number
    sql: ${TABLE}.magnitude ;;
  }

  dimension: month_number {
    type: number
    sql: ${TABLE}.month_number ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.query_text ;;
  }

  dimension: query_text_redacted {
    type: string
    sql: ${TABLE}.query_text_redacted ;;
  }

  dimension: response_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.response_ID ;;
  }

  dimension: sentiment_score {
    type: number
    sql: ${TABLE}.sentiment_score ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_ID ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time ;;
  }

  dimension_group: time_stamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time_stamp ;;
  }

  dimension: week_number {
    type: number
    sql: ${TABLE}.week_number ;;
  }

  # dimension: sentiment_bucket {
  #   type: tier
  #   tiers: [-1,-0.6,-0.2,0.2,0.6,1]
  #   sql: ${sentiment_score} ;;
  # }

  dimension: sentiment_bucket {
    type: string
    sql: CASE WHEN magnitude > 3 and sentiment_score between 0.25 and 1 THEN '1. Positive'
          WHEN magnitude <= 3 and sentiment_score between 0.25 and 1 THEN '2. Partially Positive'
          WHEN magnitude <= 3 and sentiment_score between -1 and -0.25 THEN '4. Partially Negative'
          WHEN magnitude > 3 and sentiment_score between -1 and -0.25 THEN '5. Negative'
          ELSE "3. Neutral" END ;;

  }

  dimension: sentiment_bucket_1 {
    case: {
      when: {
        sql: ${magnitude} > 3 and ${sentiment_score} between 0.25 and 1 ;;
        label: "1. Positive"
      }
      when: {
        sql: ${magnitude} <= 3 and ${sentiment_score} between 0.25 and 1 ;;
        label: "2. Partially Positive"
      }
      when: {
        sql: ${magnitude} <= 3 and ${sentiment_score} between -1 and -0.25 ;;
        label: "4. Partially Negative"
      }
      when: {
        sql: ${magnitude} > 3 and ${sentiment_score} between -1 and -0.25 ;;
        label: "5. Negative"
      }
      else: "3. Neutral"
    }
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_sessions {
    type: count_distinct
    sql: ${session_id} ;;
  }

  #====================================
  dimension_group: previous_start_time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql:
    SELECT time_stamp FROM `qp-qai-training-1-2021-05.looker_training_prod.dialogflow_cleaned_logs`
    WHERE  DATE(time_stamp) >= DATE_ADD({% date_start time_stamp_date %},INTERVAL (ifnull(DATE_DIFF({% date_start time_stamp_date %},{% date_end time_stamp_date %},DAY) DAY,0)))
    and DATE(time_stamp) <= {% date_start time_stamp_date %}
    ;;
  }

  measure: total_session_previous_duration{
    type: count_distinct
    sql: ${session_id};;

  }
  #====================================

  measure: average_queries_per_session {
    type: number
    sql: if(${total_sessions} > 0,count(${query_text})/${total_sessions}, 0) ;;
  }

  measure: date_count {
    type: count_distinct
    sql: ${time_stamp_date} ;;
  }

  measure: average_session_per_day {
    type: number
    sql: if(${date_count} > 0, ${total_sessions}/${date_count}, 0) ;;
  }

  measure: average_sentiment_score {
    type: average
    sql: ${sentiment_score};;
  }

  measure: average_intent_detection_confidence {
    type: average
    sql: ${intent_detection_confidence};;
  }

  measure: success_rate {
    type: number
    sql: if(${count} > 0, sum(if(${is_fallback},0,1))/${count}, 0) ;;
  }
}
