view: teams {
  sql_table_name: `gcp-insight-iq.marketing_dataset.teams` ;;
  drill_fields: [team_id]

  dimension: team_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.team_id ;;
  }
  dimension: team_cost_center {
    type: string
    sql: ${TABLE}.team_cost_center ;;
  }
  dimension: team_name {
    type: string
    sql: ${TABLE}.team_name ;;
  }
  measure: count {
    type: count
    drill_fields: [team_id, team_name, campaigns.count]
  }
}
