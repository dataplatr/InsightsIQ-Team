# view: teams {
#   sql_table_name: `gcp-insight-iq.marketing_dataset.teams` ;;
#   drill_fields: [team_id]

#   dimension: team_id {
#     primary_key: yes
#     type: string
#     sql: ${TABLE}.team_id ;;
#   }
#   dimension: team_cost_center {
#     type: string
#     sql: ${TABLE}.team_cost_center ;;
#   }
#   dimension: team_name {
#     type: string
#     sql: ${TABLE}.team_name ;;
#   }
#   measure: count {
#     type: count
#     drill_fields: [team_id, team_name, campaigns.count]
#   }
# }

view: teams {
  sql_table_name: `gcp-insight-iq.marketing_dataset.teams` ;;
  drill_fields: [team_id]

  dimension: team_id {
    primary_key: yes
    type: string
    label: "Team ID"
    description: "Primary key, Identifies unique teams."
    sql: ${TABLE}.team_id ;;
  }
  dimension: team_cost_center {
    type: string
    label: "Team Cost Center"
    description: "Cost center associated with the team."
    sql: ${TABLE}.team_cost_center ;;
  }
  dimension: team_name {
    type: string
    label: "Team Name"
    description: "Name of the team."
    sql: ${TABLE}.team_name ;;
  }
  measure: count {
    type: count
    label: "Team Count"
    description: "Total number of teams."
    drill_fields: [team_id, team_name, campaigns.count]
  }
}
