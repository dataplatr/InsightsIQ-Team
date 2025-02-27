view: campaign_metrics {
  sql_table_name: `gcp-insight-iq.marketing_dataset.campaign_metrics` ;;

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }
  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }
  dimension: cost_per_inquiry {
    type: number
    sql: ${TABLE}.cost_per_inquiry ;;
  }
  dimension: data_source {
    type: string
    sql: ${TABLE}.data_source ;;
  }
  dimension: high_impact_flag {
    type: yesno
    sql: ${TABLE}.high_impact_flag ;;
  }
  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }
  dimension_group: last_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated ;;
  }
  dimension: roi {
    type: number
    sql: ${TABLE}.roi ;;
  }
  measure: count {
    type: count
    drill_fields: [campaigns.campaign_name, campaigns.campaign_id]
  }
}
