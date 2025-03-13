# include: "/views/teams.view.lkml"
# view: campaigns {
#   sql_table_name: `gcp-insight-iq.marketing_dataset.campaigns` ;;
#   drill_fields: [campaign_id]

#   dimension: campaign_id {
#     primary_key: yes
#     type: string
#     sql: ${TABLE}.campaign_id ;;
#   }
#   dimension: budget_allocated {
#     type: number
#     sql: ${TABLE}.budget_allocated ;;
#   }
#   dimension: budget_remaining {
#     type: number
#     sql: ${TABLE}.budget_remaining ;;
#   }
#   dimension: campaign_name {
#     type: string
#     sql: ${TABLE}.campaign_name ;;
#   }
#   dimension_group: end {
#     type: time
#     timeframes: [raw, date, week, month, quarter, year]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.end_date ;;
#   }
#   dimension: global_campaign_flag {
#     type: yesno
#     sql: ${TABLE}.global_campaign_flag ;;
#   }
#   dimension_group: last_updated {
#     type: time
#     timeframes: [raw, time, date, week, month, quarter, year]
#     sql: ${TABLE}.last_updated ;;
#   }
#   dimension_group: start {
#     type: time
#     timeframes: [raw, date, week, month, quarter, year]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.start_date ;;
#   }
#   dimension: team_id {
#     type: string
#     # hidden: yes
#     sql: ${TABLE}.team_id ;;
#   }
#   parameter: time_granularity {
#     type: unquoted
#     label: "Select Time Granularity"
#     allowed_value:{
#       label: "Daily"
#         value: "day"}

#       allowed_value:{
#         label: "Weekly"
#         value: "week" }

#     allowed_value: {
#       label: "Monthly"
#       value: "month" }

#     allowed_value: {
#       label: "quarterly"
#       value: "quarter" }

#     allowed_value: {
#       label: "Yearly"
#       value: "year" }
#     }
#   dimension: dynamic_time {
#     # type: string
#     sql:
#     {% if time_granularity._parameter_value == 'day' %}
#     ${start_date}
#     {% elsif time_granularity._parameter_value == 'week' %}
#     ${start_week}
#     {% elsif time_granularity._parameter_value == 'month' %}
#     ${start_month}
#     {% elsif time_granularity._parameter_value == 'quarter' %}
#     ${start_quarter}
#     {% elsif time_granularity._parameter_value == 'year' %}
#     ${start_year}

#     {% else %}
#     ${start_date}
#     {% endif %}
#   ;;
#   }


#   measure: count {
#     type: count
#     drill_fields: [campaign_id, campaign_name, teams.team_id, teams.team_name, campaign_metrics.count]
#   }
#   measure: total_budget_allocated {
#     type: sum
#     sql: ${budget_allocated} ;;
#   }
#   measure: total_budget_remaining {
#     type: sum
#     sql: ${budget_remaining} ;;
#   }
#   measure: Difference {
#     type: sum
#     sql:${budget_allocated}-${budget_remaining} ;;
#   }
#   measure: percentage_change {
#     # type: number
#     value_format: "0.00%"
#     sql: (
#           (${total_budget_allocated} -
#             LAG(${total_budget_allocated})
#             OVER (PARTITION BY ${teams.team_name} ORDER BY  ${start_year}))
#           / NULLIF(LAG(${total_budget_allocated})
#             OVER (PARTITION BY ${teams.team_name} ORDER BY  ${start_year}), 0)
#           * 100
#         ) ;;
#   }

# }

include: "/views/teams.view.lkml"
view: campaigns {
  sql_table_name: `gcp-insight-iq.marketing_dataset.campaigns` ;;
  drill_fields: [campaign_id]

  dimension: campaign_id {
    primary_key: yes
    type: string
    label: "Campaign ID"
    description: "Primary key, Identifies unique campaigns."
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: budget_allocated {
    type: number
    label: "Budget Allocated"
    description: "Total budget allocated to the campaign."
    sql: ${TABLE}.budget_allocated ;;
  }
  dimension: budget_remaining {
    type: number
    label: "Budget Remaining"
    description: "Remaining budget for the campaign."
    sql: ${TABLE}.budget_remaining ;;
  }
  dimension: campaign_name {
    type: string
    label: "Campaign Name"
    description: "Name of the campaign."
    sql: ${TABLE}.campaign_name ;;
  }
  dimension_group: end {
    type: time
    label: "End Date"
    description: "End date of the campaign."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }
  dimension: global_campaign_flag {
    type: yesno
    label: "Global Campaign Flag"
    description: "Indicates if the campaign is global."
    sql: ${TABLE}.global_campaign_flag ;;
  }
  dimension_group: last_updated {
    type: time
    label: "Last Updated"
    description: "Timestamp of the last update for the record."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated ;;
  }
  dimension_group: start {
    type: time
    label: "Start Date"
    description: "Start date of the campaign."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }
  dimension: team_id {
    type: string
    label: "Team ID"
    description: "Identifies the team managing the campaign."
    # hidden: yes
    sql: ${TABLE}.team_id ;;
  }
  parameter: time_granularity {
    type: unquoted
    label: "Select Time Granularity"
    description: "Allows selection of different time granularities for analysis."
    allowed_value:{
      label: "Daily"
      value: "day"}

    allowed_value:{
      label: "Weekly"
      value: "week" }

    allowed_value: {
      label: "Monthly"
      value: "month" }

    allowed_value: {
      label: "Quarterly"
      value: "quarter" }

    allowed_value: {
      label: "Yearly"
      value: "year" }
  }
  dimension: dynamic_time {
    label: "Dynamic Time"
    description: "Dynamically adjusts the time dimension based on selected granularity."
    sql:
    {% if time_granularity._parameter_value == 'day' %}
    ${start_date}
    {% elsif time_granularity._parameter_value == 'week' %}
    ${start_week}
    {% elsif time_granularity._parameter_value == 'month' %}
    ${start_month}
    {% elsif time_granularity._parameter_value == 'quarter' %}
    ${start_quarter}
    {% elsif time_granularity._parameter_value == 'year' %}
    ${start_year}
    {% else %}
    ${start_date}
    {% endif %}
  ;;
  }

  measure: count {
    type: count
    label: "Count"
    description: "Total number of campaign records."
    drill_fields: [campaign_id, campaign_name, teams.team_id, teams.team_name, campaign_metrics.count]
  }
  measure: total_budget_allocated {
    type: sum
    label: "Total Budget Allocated"
    description: "Sum of all allocated budgets for campaigns."
    sql: ${budget_allocated} ;;
  }
  measure: total_budget_remaining {
    type: sum
    label: "Total Budget Remaining"
    description: "Sum of all remaining budgets for campaigns."
    sql: ${budget_remaining} ;;
  }
  measure: Difference {
    type: sum
    label: "Budget Difference"
    description: "Difference between allocated and remaining budget."
    sql:${budget_allocated}-${budget_remaining} ;;
  }
  measure: percentage_change {
    value_format: "0.00%"
    label: "Percentage Change"
    description: "Calculates the percentage change in total budget allocated over time."
    sql: (
          (${total_budget_allocated} -
            LAG(${total_budget_allocated})
            OVER (PARTITION BY ${teams.team_name} ORDER BY  ${start_year}))
          / NULLIF(LAG(${total_budget_allocated})
            OVER (PARTITION BY ${teams.team_name} ORDER BY  ${start_year}), 0)
          * 100
        ) ;;
  }
}
