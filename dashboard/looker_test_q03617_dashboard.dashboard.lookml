- dashboard: looker_test_q03617_dashboard
  title: Looker Training Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: total_sessions
    name: total_sessions
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: single_value
    fields: [dialogflow_cleaned_logs.total_sessions]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: Total Sessions
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 2
    col: 0
    width: 4
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: Conversation Summary
    body_text: "***\n"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: avg_queries_per_session
    name: avg_queries_per_session
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: single_value
    fields: [dialogflow_cleaned_logs.average_queries_per_session]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#103de8"
    single_value_title: Avg Queries/Session
    value_format: '0'
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 2
    col: 8
    width: 4
    height: 2
  - title: avg sessions per day
    name: avg sessions per day
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: single_value
    fields: [dialogflow_cleaned_logs.average_session_per_day]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1032d1"
    single_value_title: Avg Sessions/Day
    value_format: '0'
    series_types: {}
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 2
    col: 4
    width: 4
    height: 2
  - title: avg session duration
    name: avg session duration
    model: "@{model_name}"
    explore: session_level
    type: single_value
    fields: [conversation_length.avg_session_duration]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1032d1"
    single_value_title: Avg Session Duration
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 2
    col: 12
    width: 4
    height: 2
  - title: 'Busiest Hour '
    name: 'Busiest Hour '
    model: "@{model_name}"
    explore: session_level
    type: looker_funnel
    fields: [session_level.total_sessions, conversation_length.hour_frame]
    sorts: [session_level.total_sessions desc]
    limit: 500
    query_timezone: America/New_York
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: right
    percentType: total
    percentPosition: hidden
    valuePosition: Hidden
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: ccba75a3-58c7-4b9c-a931-4ffc59e79cba
      options:
        steps: 5
        reverse: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#0423B0"
    single_value_title: Avg Session Duration (mins)
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 2
    col: 16
    width: 8
    height: 7
  - title: Sentiment Distribution
    name: Sentiment Distribution
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_pie
    fields: [dialogflow_cleaned_logs.count, dialogflow_cleaned_logs.sentiment_bucket_1]
    fill_fields: [dialogflow_cleaned_logs.sentiment_bucket_1]
    sorts: [dialogflow_cleaned_logs.sentiment_bucket_1]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    start_angle: 90
    series_colors:
      Partially Positive: "#C2DD67"
      Neutral: "#FBB555"
      Partially Negative: "#E57947"
      T05 [0.6,1.0): "#72D16D"
      T04 [0.2,0.6): "#C2DD67"
      T03 [-0.2,0.2): "#FBB555"
      T02 [-0.6,-0.2): "#E57947"
      T01 [-1.0,-0.6): "#B32F37"
      4. Partially Negative: "#e33b43"
      3. Neutral: "#FF9E00"
      2. Partially Positive: "#bede18"
    series_labels:
      T05 [0.6,1.0): Positive
      T04 [0.2,0.6): Partially Positive
      T03 [-0.2,0.2): Neutral
      T02 [-0.6,-0.2): Partially Negative
      T01 [-1.0,-0.6): Negative
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#0d1ba6"
    single_value_title: Success Rate
    value_format: 0%
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    range_min: -1
    range_max: 1
    value_label_type: both
    value_label_font: 11
    value_label_padding: 60
    spinner_color: "#142969"
    gauge_fill_type: progress-gradient
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1.4
    target_label_padding: 1.5
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    show_view_names: true
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 11
    col: 19
    width: 5
    height: 4
  - title: Timeframe Trend
    name: Timeframe Trend
    model: "@{model_name}"
    explore: session_level
    type: looker_area
    fields: [session_level.total_sessions, conversation_length.hour_frame, conversation_length.session_date_time_hour_of_day]
    sorts: [conversation_length.session_date_time_hour_of_day]
    limit: 500
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: ccba75a3-58c7-4b9c-a931-4ffc59e79cba
      options:
        steps: 5
        reverse: true
    series_types: {}
    label_color: ["#FF9E00"]
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: right
    percentType: total
    percentPosition: hidden
    valuePosition: Hidden
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#0423B0"
    single_value_title: Avg Session Duration (mins)
    defaults_version: 1
    hidden_fields: [conversation_length.session_date_time_hour_of_day]
    listen:
      Date Range: conversation_length.date_date
    row: 31
    col: 0
    width: 12
    height: 6
  - title: Avg Sentiment Score
    name: Avg Sentiment Score
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [dialogflow_cleaned_logs.average_sentiment_score]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 25
    range_min: -1
    range_max: 1
    value_label_type: both
    value_label_font: 12
    value_formatting: '0.000'
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    fill_color: "#0092E5"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#282828"
    gauge_fill_type: segment
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.21
    circleThickness: 0.5
    circleFillGap: 0.5
    series_types: {}
    defaults_version: 0
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 11
    col: 8
    width: 4
    height: 4
  - title: Success rate
    name: Success rate
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: single_value
    fields: [dialogflow_cleaned_logs.success_rate]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#0d1ba6"
    single_value_title: Success Rate
    value_format: 0%
    conditional_formatting: [{type: less than, value: 0.5, background_color: '', font_color: "#B32F37",
        color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0.75, background_color: '', font_color: "#FF9E00", color_application: {
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0.75, background_color: '', font_color: "#18bf3a", color_application: {
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: equal
          to, value: 0.75, background_color: '', font_color: "#18bf3a", color_application: {
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    range_min: -1
    range_max: 1
    value_label_type: both
    value_label_font: 11
    value_label_padding: 60
    spinner_color: "#142969"
    gauge_fill_type: progress-gradient
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1.4
    target_label_padding: 1.5
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 11
    col: 0
    width: 4
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: Query Summary
    body_text: "***"
    row: 9
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: User Utterances
    body_text: "***"
    row: 15
    col: 0
    width: 24
    height: 2
  - title: Handled queries
    name: Handled queries
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: single_value
    fields: [dialogflow_cleaned_logs.count]
    filters:
      dialogflow_cleaned_logs.is_fallback: 'No'
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1aa630"
    single_value_title: Handled Queries
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    range_min: -1
    range_max: 1
    value_label_type: both
    value_label_font: 11
    value_label_padding: 60
    spinner_color: "#142969"
    gauge_fill_type: progress-gradient
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1.4
    target_label_padding: 1.5
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 13
    col: 0
    width: 4
    height: 2
  - title: Total Queries
    name: Total Queries
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: single_value
    fields: [dialogflow_cleaned_logs.count]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#0d1ba6"
    single_value_title: Total Queries
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    range_min: -1
    range_max: 1
    value_label_type: both
    value_label_font: 11
    value_label_padding: 60
    spinner_color: "#142969"
    gauge_fill_type: progress-gradient
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1.4
    target_label_padding: 1.5
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 11
    col: 4
    width: 4
    height: 2
  - title: unhandled queries
    name: unhandled queries
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: single_value
    fields: [dialogflow_cleaned_logs.count]
    filters:
      dialogflow_cleaned_logs.is_fallback: 'Yes'
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#bd0505"
    single_value_title: Unhandled Queries
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    range_min: -1
    range_max: 1
    value_label_type: both
    value_label_font: 11
    value_label_padding: 60
    spinner_color: "#142969"
    gauge_fill_type: progress-gradient
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1.4
    target_label_padding: 1.5
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 13
    col: 4
    width: 4
    height: 2
  - title: Avg Sentiment Weekly Trend
    name: Avg Sentiment Weekly Trend
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_column
    fields: [dialogflow_cleaned_logs.time_stamp_week, dialogflow_cleaned_logs.average_sentiment_score]
    fill_fields: [dialogflow_cleaned_logs.time_stamp_week]
    filters:
      dialogflow_cleaned_logs.query_text: -"TELEPHONY_WELCOME"
    sorts: [dialogflow_cleaned_logs.time_stamp_week desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Avg Sentiment Score, orientation: left, series: [{axisId: dialogflow_cleaned_logs.average_sentiment_score,
            id: dialogflow_cleaned_logs.average_sentiment_score, name: Dialogflow
              Cleaned Logs Average Sentiment Score}], showLabels: true, showValues: true,
        maxValue: 1, minValue: -1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    label_value_format: '0.00'
    series_types: {}
    series_colors:
      Partially Positive: "#C2DD67"
      Neutral: "#FBB555"
      Partially Negative: "#E57947"
      T05 [0.6,1.0): "#72D16D"
      T04 [0.2,0.6): "#C2DD67"
      T03 [-0.2,0.2): "#FBB555"
      T02 [-0.6,-0.2): "#E57947"
      T01 [-1.0,-0.6): "#B32F37"
      dialogflow_cleaned_logs.average_sentiment_score: "#169ad6"
    series_labels:
      T05 [0.6,1.0): Positive
      T04 [0.2,0.6): Partially Positive
      T03 [-0.2,0.2): Neutral
      T02 [-0.6,-0.2): Partially Negative
      T01 [-1.0,-0.6): Negative
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    start_angle: 90
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#0d1ba6"
    single_value_title: Success Rate
    value_format: 0%
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    range_min: -1
    range_max: 1
    value_label_type: both
    value_label_font: 11
    value_label_padding: 60
    spinner_color: "#142969"
    gauge_fill_type: progress-gradient
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1.4
    target_label_padding: 1.5
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 11
    col: 12
    width: 7
    height: 4
  - title: user utterances
    name: user utterances
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_grid
    fields: [dialogflow_cleaned_logs.query_text, dialogflow_cleaned_logs.total_sessions]
    filters:
      dialogflow_cleaned_logs.query_text: -"TELEPHONY_WELCOME"
    sorts: [dialogflow_cleaned_logs.total_sessions desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      dialogflow_cleaned_logs.query_text: User Utterances
    series_column_widths:
      dialogflow_cleaned_logs.total_sessions: 250
    series_cell_visualizations:
      dialogflow_cleaned_logs.total_sessions:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        value_display: true
    series_types: {}
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 17
    col: 0
    width: 13
    height: 12
  - title: top 10 positive user utterances
    name: top 10 positive user utterances
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_grid
    fields: [dialogflow_cleaned_logs.query_text, dialogflow_cleaned_logs.sentiment_score]
    filters:
      dialogflow_cleaned_logs.query_text: -"TELEPHONY_WELCOME"
    sorts: [dialogflow_cleaned_logs.sentiment_score desc]
    limit: 10
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      dialogflow_cleaned_logs.query_text: User Utterances
    series_column_widths:
      dialogflow_cleaned_logs.total_sessions: 250
      dialogflow_cleaned_logs.sentiment_score: 250
    series_cell_visualizations:
      dialogflow_cleaned_logs.total_sessions:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        value_display: true
      dialogflow_cleaned_logs.sentiment_score:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_types: {}
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 17
    col: 13
    width: 11
    height: 6
  - title: top 10 negative user utterances
    name: top 10 negative user utterances
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_grid
    fields: [dialogflow_cleaned_logs.query_text, dialogflow_cleaned_logs.sentiment_score]
    filters:
      dialogflow_cleaned_logs.query_text: -"TELEPHONY_WELCOME"
    sorts: [dialogflow_cleaned_logs.sentiment_score]
    limit: 10
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      dialogflow_cleaned_logs.query_text: User Utterances
    series_column_widths:
      dialogflow_cleaned_logs.total_sessions: 250
      dialogflow_cleaned_logs.sentiment_score: 250
    series_cell_visualizations:
      dialogflow_cleaned_logs.total_sessions:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
        value_display: true
      dialogflow_cleaned_logs.sentiment_score:
        is_active: true
        palette:
          palette_id: 1a23ff9b-3877-cce5-4b0c-74d2ccc63b7f
          collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
          custom_colors:
          - "#ff2308"
          - "#e66e1c"
          - "#e8bb34"
    series_types: {}
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 23
    col: 13
    width: 11
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: Session Analytics
    body_text: "***"
    row: 29
    col: 0
    width: 24
    height: 2
  - title: weekly traffic
    name: weekly traffic
    model: "@{model_name}"
    explore: session_level
    type: looker_column
    fields: [session_level.total_sessions, conversation_length.session_date_time_week]
    fill_fields: [conversation_length.session_date_time_week]
    sorts: [conversation_length.session_date_time_week desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      session_level.total_sessions: "#1032d1"
    x_axis_label_rotation: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 31
    col: 12
    width: 12
    height: 6
  - title: Call Duration *
    name: Call Duration *
    model: "@{model_name}"
    explore: session_level
    type: looker_column
    fields: [session_level.total_sessions, conversation_length.call_duration_bucket]
    fill_fields: [conversation_length.call_duration_bucket]
    sorts: [conversation_length.call_duration_bucket]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Call Duration
    series_types: {}
    series_colors:
      session_level.total_sessions: "#1c3ef7"
    x_axis_label_rotation: 0
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 37
    col: 0
    width: 12
    height: 6
  - title: Call Duration vs Avg Sentiment Score *
    name: Call Duration vs Avg Sentiment Score *
    model: "@{model_name}"
    explore: session_level
    type: looker_column
    fields: [conversation_length.call_duration_bucket, conversation_length.avg_sentiment_score]
    sorts: [conversation_length.call_duration_bucket]
    limit: 500
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_length.avg_sentiment_score,
            id: conversation_length.avg_sentiment_score, name: Avg Sentiment Score}],
        showLabels: true, showValues: true, maxValue: 1, minValue: -1, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Call Duration
    series_types: {}
    series_colors:
      session_level.total_sessions: "#1c3ef7"
      conversation_length.avg_sentiment_score: "#113cf7"
    x_axis_label_rotation: 0
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 37
    col: 12
    width: 12
    height: 6
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: Intent Analytics
    body_text: "***"
    row: 43
    col: 0
    width: 24
    height: 2
  - title: Traffic By Entry Intent
    name: Traffic By Entry Intent
    model: "@{model_name}"
    explore: session_level
    type: looker_column
    fields: [session_level.entry_intent, session_level.total_sessions]
    sorts: [session_level.total_sessions desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      custom:
        id: 24b88795-0473-576e-ac51-6d1977cbc9bf
        label: Custom
        type: discrete
        colors:
        - "#FF9E00"
        - "#B1399E"
        - "#C2DD67"
        - "#592EC2"
        - "#4276BE"
        - "#72D16D"
        - "#FFD95F"
        - "#B32F37"
        - "#9174F0"
        - "#E57947"
        - "#75E2E2"
        - "#FBB555"
      options:
        steps: 5
    y_axes: [{label: Total Sessions, orientation: left, series: [{axisId: session_level.count,
            id: session_level.count, name: Session Level}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 45
    col: 0
    width: 11
    height: 6
  - title: Traffic By Exit Intent
    name: Traffic By Exit Intent
    model: "@{model_name}"
    explore: session_level
    type: looker_bar
    fields: [exit_intent.exit_intent, session_level.total_sessions]
    sorts: [session_level.total_sessions desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      session_level.total_sessions: "#1032d1"
    x_axis_label_rotation: 0
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 45
    col: 11
    width: 13
    height: 6
  - title: Weekly Intents Trend
    name: Weekly Intents Trend
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_line
    fields: [dialogflow_cleaned_logs.time_stamp_week, dialogflow_cleaned_logs.intent_triggered,
      dialogflow_cleaned_logs.total_sessions]
    pivots: [dialogflow_cleaned_logs.intent_triggered]
    fill_fields: [dialogflow_cleaned_logs.time_stamp_week]
    sorts: [dialogflow_cleaned_logs.time_stamp_week desc, dialogflow_cleaned_logs.intent_triggered]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    series_labels: {}
    swap_axes: false
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hidden_fields: []
    hidden_points_if_no: []
    up_color: false
    down_color: false
    total_color: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 57
    col: 0
    width: 24
    height: 11
  - title: Intent Wise Information
    name: Intent Wise Information
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_grid
    fields: [dialogflow_cleaned_logs.intent_triggered, dialogflow_cleaned_logs.total_sessions,
      dialogflow_cleaned_logs.average_sentiment_score, dialogflow_cleaned_logs.average_intent_detection_confidence]
    filters:
      dialogflow_cleaned_logs.query_text: -"TELEPHONY_WELCOME"
    sorts: [dialogflow_cleaned_logs.total_sessions desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      T05 [0.6,1.0): Positive
      T04 [0.2,0.6): Partially Positive
      T03 [-0.2,0.2): Neutral
      T02 [-0.6,-0.2): Partially Negative
      T01 [-1.0,-0.6): Negative
      dialogflow_cleaned_logs.intent_triggered: Intent Triggered
      dialogflow_cleaned_logs.total_sessions: Total Sessions
      dialogflow_cleaned_logs.average_sentiment_score: Avg Sentiment Score
      dialogflow_cleaned_logs.average_intent_detection_confidence: Avg Intent Detection
        Confidence
    series_column_widths:
      dialogflow_cleaned_logs.intent_triggered: 350
    series_cell_visualizations:
      dialogflow_cleaned_logs.total_sessions:
        is_active: false
      dialogflow_cleaned_logs.average_intent_detection_confidence:
        is_active: false
        value_display: true
    header_font_color: "#fff2f2"
    header_background_color: "#4276BE"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: a2d3cc59-fe0d-18f2-9935-118ba197c78d, label: Custom, type: continuous,
            stops: [{color: "#fa4b15", offset: 0}, {color: "#ffe153", offset: 50},
              {color: "#55bd0d", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [dialogflow_cleaned_logs.average_sentiment_score]},
      {type: equal to, value: 1, background_color: "#16a81e", font_color: !!null '',
        color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [dialogflow_cleaned_logs.average_intent_detection_confidence]}]
    series_value_format:
      dialogflow_cleaned_logs.average_sentiment_score: '0.00'
      dialogflow_cleaned_logs.average_intent_detection_confidence: 0.00%
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Avg Sentiment Score, orientation: left, series: [{axisId: dialogflow_cleaned_logs.average_sentiment_score,
            id: dialogflow_cleaned_logs.average_sentiment_score, name: Dialogflow
              Cleaned Logs Average Sentiment Score}], showLabels: true, showValues: true,
        maxValue: 1, minValue: -1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    label_value_format: '0.00'
    series_types: {}
    series_colors:
      Partially Positive: "#C2DD67"
      Neutral: "#FBB555"
      Partially Negative: "#E57947"
      T05 [0.6,1.0): "#72D16D"
      T04 [0.2,0.6): "#C2DD67"
      T03 [-0.2,0.2): "#FBB555"
      T02 [-0.6,-0.2): "#E57947"
      T01 [-1.0,-0.6): "#B32F37"
      dialogflow_cleaned_logs.average_sentiment_score: "#169ad6"
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    start_angle: 90
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    custom_color: "#0d1ba6"
    single_value_title: Success Rate
    value_format: 0%
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    range_min: -1
    range_max: 1
    value_label_type: both
    value_label_font: 11
    value_label_padding: 60
    spinner_color: "#142969"
    gauge_fill_type: progress-gradient
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1.4
    target_label_padding: 1.5
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 51
    col: 10
    width: 14
    height: 6
  - title: Total Queries vs Call Duration *
    name: Total Queries vs Call Duration *
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_column
    fields: [conversation_length.call_duration_bucket, dialogflow_cleaned_logs.count]
    pivots: [conversation_length.call_duration_bucket]
    fill_fields: [conversation_length.call_duration_bucket]
    sorts: [conversation_length.call_duration_bucket]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total Sessions, orientation: left, series: [{axisId: dialogflow_cleaned_logs.count,
            id: "< 1 min - 0 - dialogflow_cleaned_logs.count", name: "< 1 min"}, {
            axisId: dialogflow_cleaned_logs.count, id: 1-3 min - 1 - dialogflow_cleaned_logs.count,
            name: 1-3 min}, {axisId: dialogflow_cleaned_logs.count, id: 3-5 min -
              2 - dialogflow_cleaned_logs.count, name: 3-5 min}, {axisId: dialogflow_cleaned_logs.count,
            id: 5-7 min - 3 - dialogflow_cleaned_logs.count, name: 5-7 min}, {axisId: dialogflow_cleaned_logs.count,
            id: "> 7 min - 4 - dialogflow_cleaned_logs.count", name: "> 7 min"}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      "< 1 min - 0 - dialogflow_cleaned_logs.count": "#2b0a87"
      1-3 min - 1 - dialogflow_cleaned_logs.count: "#0f1eeb"
      3-5 min - 2 - dialogflow_cleaned_logs.count: "#ffdf11"
      5-7 min - 3 - dialogflow_cleaned_logs.count: "#FF9E00"
      "> 7 min - 4 - dialogflow_cleaned_logs.count": "#ff4e11"
    series_labels: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    groupBars: true
    labelSize: 10pt
    showLegend: true
    map: auto
    map_projection: ''
    quantize_colors: false
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 51
    col: 0
    width: 10
    height: 6
  - title: Session Distribution vs Call Deflection *
    name: Session Distribution vs Call Deflection *
    model: "@{model_name}"
    explore: session_level
    type: looker_column
    fields: [session_level.total_sessions, deflection.deflection_bucket]
    fill_fields: [deflection.deflection_bucket]
    sorts: [session_level.total_sessions desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Deflection
    series_types: {}
    series_colors:
      session_level.total_sessions: "#1032d1"
    x_axis_label_rotation: 0
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 4
    col: 0
    width: 10
    height: 5
  - title: Deflection Rate *
    name: Deflection Rate *
    model: "@{model_name}"
    explore: session_level
    type: looker_pie
    fields: [session_level.total_sessions, deflection.deflection_rate]
    fill_fields: [deflection.deflection_rate]
    sorts: [session_level.total_sessions desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    series_colors:
      session_level.total_sessions: "#1032d1"
      Fully Deflected: "#72D16D"
      Partially Deflected: "#FBB555"
      Not Deflected: "#1032d1"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Deflection
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date Range: conversation_length.date_date
    row: 4
    col: 10
    width: 6
    height: 5
  - title: Intent Co-occurance
    name: Intent Co-occurance
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    type: looker_column
    fields: [intent_correlation.intent_triggered, intent_correlation.intent_list,
      intent_correlation.count]
    pivots: [intent_correlation.intent_triggered]
    filters:
      intent_correlation.intent_list: "-NULL"
    sorts: [intent_correlation.count desc 1, intent_correlation.intent_triggered]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: ccba75a3-58c7-4b9c-a931-4ffc59e79cba
      options:
        steps: 5
    y_axes: [{label: Frequency, orientation: left, series: [{axisId: AcceptedInsurance
              - intent_correlation.count, id: AcceptedInsurance - intent_correlation.count,
            name: AcceptedInsurance}, {axisId: AcceptInsurance - intent_correlation.count,
            id: AcceptInsurance - intent_correlation.count, name: AcceptInsurance},
          {axisId: AcceptInsurance - fallback - intent_correlation.count, id: AcceptInsurance
              - fallback - intent_correlation.count, name: AcceptInsurance - fallback},
          {axisId: AcceptInsurance - no - intent_correlation.count, id: AcceptInsurance
              - no - intent_correlation.count, name: AcceptInsurance - no}, {axisId: AcceptInsurance
              - yes - intent_correlation.count, id: AcceptInsurance - yes - intent_correlation.count,
            name: AcceptInsurance - yes}, {axisId: AcceptInsurance - yes - fallback
              - intent_correlation.count, id: AcceptInsurance - yes - fallback - intent_correlation.count,
            name: AcceptInsurance - yes - fallback}, {axisId: Acknowledge - intent_correlation.count,
            id: Acknowledge - intent_correlation.count, name: Acknowledge}, {axisId: Acknowledge
              - fallback - intent_correlation.count, id: Acknowledge - fallback -
              intent_correlation.count, name: Acknowledge - fallback}, {axisId: Acknowledge
              - no - intent_correlation.count, id: Acknowledge - no - intent_correlation.count,
            name: Acknowledge - no}, {axisId: Acknowledge - yes - intent_correlation.count,
            id: Acknowledge - yes - intent_correlation.count, name: Acknowledge -
              yes}, {axisId: Acknowledge - yes - fallback - intent_correlation.count,
            id: Acknowledge - yes - fallback - intent_correlation.count, name: Acknowledge
              - yes - fallback}, {axisId: AppointmentPsychiatrist - intent_correlation.count,
            id: AppointmentPsychiatrist - intent_correlation.count, name: AppointmentPsychiatrist},
          {axisId: AppointmentPsychiatrist - fallback - intent_correlation.count,
            id: AppointmentPsychiatrist - fallback - intent_correlation.count, name: AppointmentPsychiatrist
              - fallback}, {axisId: AppointmentPsychiatrist - no - intent_correlation.count,
            id: AppointmentPsychiatrist - no - intent_correlation.count, name: AppointmentPsychiatrist
              - no}, {axisId: AppointmentPsychiatrist - no - fallback - intent_correlation.count,
            id: AppointmentPsychiatrist - no - fallback - intent_correlation.count,
            name: AppointmentPsychiatrist - no - fallback}, {axisId: AppointmentPsychiatrist
              - no - yes - intent_correlation.count, id: AppointmentPsychiatrist -
              no - yes - intent_correlation.count, name: AppointmentPsychiatrist -
              no - yes}, {axisId: AppointmentPsychiatrist - yes - intent_correlation.count,
            id: AppointmentPsychiatrist - yes - intent_correlation.count, name: AppointmentPsychiatrist
              - yes}, {axisId: AppointmentTherapist - intent_correlation.count, id: AppointmentTherapist
              - intent_correlation.count, name: AppointmentTherapist}, {axisId: AppointmentTherapist
              - fallback - intent_correlation.count, id: AppointmentTherapist - fallback
              - intent_correlation.count, name: AppointmentTherapist - fallback},
          {axisId: AppointmentTherapist - no - intent_correlation.count, id: AppointmentTherapist
              - no - intent_correlation.count, name: AppointmentTherapist - no}, {
            axisId: AppointmentTherapist - yes - intent_correlation.count, id: AppointmentTherapist
              - yes - intent_correlation.count, name: AppointmentTherapist - yes},
          {axisId: AppointmentUrgent - intent_correlation.count, id: AppointmentUrgent
              - intent_correlation.count, name: AppointmentUrgent}, {axisId: AppointmentUrgent
              - fallback - intent_correlation.count, id: AppointmentUrgent - fallback
              - intent_correlation.count, name: AppointmentUrgent - fallback}, {axisId: CheckInsurance
              - intent_correlation.count, id: CheckInsurance - intent_correlation.count,
            name: CheckInsurance}, {axisId: CheckInsurance - fallback - intent_correlation.count,
            id: CheckInsurance - fallback - intent_correlation.count, name: CheckInsurance
              - fallback}, {axisId: CoPay - intent_correlation.count, id: CoPay -
              intent_correlation.count, name: CoPay}, {axisId: CreditCard - intent_correlation.count,
            id: CreditCard - intent_correlation.count, name: CreditCard}, {axisId: CreditCard
              - no - intent_correlation.count, id: CreditCard - no - intent_correlation.count,
            name: CreditCard - no}, {axisId: Default Fallback Intent - intent_correlation.count,
            id: Default Fallback Intent - intent_correlation.count, name: Default
              Fallback Intent}, {axisId: Default Fallback Intent - fallback - intent_correlation.count,
            id: Default Fallback Intent - fallback - intent_correlation.count, name: Default
              Fallback Intent - fallback}, {axisId: Default Fallback Intent - no -
              intent_correlation.count, id: Default Fallback Intent - no - intent_correlation.count,
            name: Default Fallback Intent - no}, {axisId: Default Fallback Intent
              - no - fallback - intent_correlation.count, id: Default Fallback Intent
              - no - fallback - intent_correlation.count, name: Default Fallback Intent
              - no - fallback}, {axisId: Default Fallback Intent - yes - intent_correlation.count,
            id: Default Fallback Intent - yes - intent_correlation.count, name: Default
              Fallback Intent - yes}, {axisId: Default Welcome Intent - fallback -
              intent_correlation.count, id: Default Welcome Intent - fallback - intent_correlation.count,
            name: Default Welcome Intent - fallback}, {axisId: FindInsuranceHelpLine
              - intent_correlation.count, id: FindInsuranceHelpLine - intent_correlation.count,
            name: FindInsuranceHelpLine}, {axisId: FindInsuranceHelpLine - fallback
              - intent_correlation.count, id: FindInsuranceHelpLine - fallback - intent_correlation.count,
            name: FindInsuranceHelpLine - fallback}, {axisId: GetAppointment - intent_correlation.count,
            id: GetAppointment - intent_correlation.count, name: GetAppointment},
          {axisId: GetAppointment - fallback - intent_correlation.count, id: GetAppointment
              - fallback - intent_correlation.count, name: GetAppointment - fallback},
          {axisId: GetMobileNumber - intent_correlation.count, id: GetMobileNumber
              - intent_correlation.count, name: GetMobileNumber}, {axisId: GetMobileNumber
              - fallback - intent_correlation.count, id: GetMobileNumber - fallback
              - intent_correlation.count, name: GetMobileNumber - fallback}, {axisId: HaveAccount
              - intent_correlation.count, id: HaveAccount - intent_correlation.count,
            name: HaveAccount}, {axisId: LiveAgentTransfer - intent_correlation.count,
            id: LiveAgentTransfer - intent_correlation.count, name: LiveAgentTransfer},
          {axisId: LiveAgentTransfer - fallback - intent_correlation.count, id: LiveAgentTransfer
              - fallback - intent_correlation.count, name: LiveAgentTransfer - fallback},
          {axisId: LiveAgentTransfer - yes - intent_correlation.count, id: LiveAgentTransfer
              - yes - intent_correlation.count, name: LiveAgentTransfer - yes}, {
            axisId: NoAccount - intent_correlation.count, id: NoAccount - intent_correlation.count,
            name: NoAccount}, {axisId: NoAccount - fallback - intent_correlation.count,
            id: NoAccount - fallback - intent_correlation.count, name: NoAccount -
              fallback}, {axisId: NoAccount - no - intent_correlation.count, id: NoAccount
              - no - intent_correlation.count, name: NoAccount - no}, {axisId: NoAccount
              - no - fallback - intent_correlation.count, id: NoAccount - no - fallback
              - intent_correlation.count, name: NoAccount - no - fallback}, {axisId: Prescription
              - intent_correlation.count, id: Prescription - intent_correlation.count,
            name: Prescription}, {axisId: Prescription - fallback - intent_correlation.count,
            id: Prescription - fallback - intent_correlation.count, name: Prescription
              - fallback}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Child Intent
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    series_types: {}
    defaults_version: 1
    listen:
      Intent Triggered: dialogflow_cleaned_logs.intent_triggered
      Date Range: dialogflow_cleaned_logs.date_date
    row: 68
    col: 0
    width: 24
    height: 12
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    listens_to_filters: []
    field: dialogflow_cleaned_logs.date_date
  - name: Intent Triggered
    title: Intent Triggered
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: "@{model_name}"
    explore: dialogflow_cleaned_logs
    listens_to_filters: []
    field: dialogflow_cleaned_logs.intent_triggered
