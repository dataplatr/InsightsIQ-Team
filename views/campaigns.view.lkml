view: campaigns {
  sql_table_name: `gcp-insight-iq.marketing_dataset.campaigns` ;;
  drill_fields: [campaign_id]

  dimension: campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: budget_allocated {
    type: number
    sql: ${TABLE}.budget_allocated ;;
  }
  dimension: budget_remaining {
    type: number
    sql: ${TABLE}.budget_remaining ;;
  }
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }
  dimension: global_campaign_flag {
    type: yesno
    sql: ${TABLE}.global_campaign_flag ;;
  }
  dimension_group: last_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }
  dimension: team_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.team_id ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_id, campaign_name, teams.team_id, teams.team_name, campaign_metrics.count]
  }
}
