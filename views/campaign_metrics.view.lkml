# view: campaign_metrics {
#   sql_table_name: `gcp-insight-iq.marketing_dataset.campaign_metrics` ;;

#   dimension: campaign_id {
#     type: string
#     # hidden: yes
#     sql: ${TABLE}.campaign_id ;;
#   }
#   dimension: clicks {
#     type: number
#     sql: ${TABLE}.clicks ;;
#   }
#   dimension: conversions {
#     type: number
#     sql: ${TABLE}.conversions ;;
#   }
#   dimension: cost_per_inquiry {
#     type: number
#     sql: ${TABLE}.cost_per_inquiry ;;
#   }
#   dimension: data_source {
#     type: string
#     sql: ${TABLE}.data_source ;;
#   }
#   dimension: high_impact_flag {
#     type: yesno
#     sql: ${TABLE}.high_impact_flag ;;
#   }
#   dimension: impressions {
#     type: number
#     sql: ${TABLE}.impressions ;;
#   }
#   dimension_group: last_updated {
#     type: time
#     timeframes: [raw, time, date, week, month, quarter, year]
#     sql: ${TABLE}.last_updated ;;
#   }
#   dimension: roi {
#     type: number
#     sql: ${TABLE}.roi ;;
#   }
#   measure: count {
#     type: count
#     drill_fields: [campaigns.campaign_name, campaigns.campaign_id]
#   }
# }

view: campaign_metrics {
  sql_table_name: `gcp-insight-iq.marketing_dataset.campaign_metrics` ;;

  dimension: campaign_id {
    type: string
    label: "Campaign ID"
    description: "Primary key, Identifies unique campaigns."
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: clicks {
    type: number
    label: "Clicks"
    description: "Number of times the campaign was clicked."
    sql: ${TABLE}.clicks ;;
  }
  dimension: conversions {
    type: number
    label: "Conversions"
    description: "Number of successful conversions."
    sql: ${TABLE}.conversions ;;
  }
  dimension: cost_per_inquiry {
    type: number
    label: "Cost Per Inquiry"
    description: "Cost per customer inquiry."
    sql: ${TABLE}.cost_per_inquiry ;;
  }
  dimension: data_source {
    type: string
    label: "Data Source"
    description: "Source of the campaign data."
    sql: ${TABLE}.data_source ;;
  }
  dimension: high_impact_flag {
    type: yesno
    label: "High Impact Flag"
    description: "Indicates if the campaign had high impact."
    sql: ${TABLE}.high_impact_flag ;;
  }
  dimension: impressions {
    type: number
    label: "Impressions"
    description: "Number of times the campaign was displayed."
    sql: ${TABLE}.impressions ;;
  }
  dimension_group: last_updated {
    type: time
    label: "Last Updated"
    description: "Timestamp of the last update for the record."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated ;;
  }
  dimension: roi {
    type: number
    label: "ROI"
    description: "Return on investment for the campaign."
    sql: ${TABLE}.roi ;;
  }
  measure: count {
    type: count
    label: "Count"
    description: "Total number of campaign records."
    drill_fields: [campaigns.campaign_name, campaigns.campaign_id]
  }
}
