# view: team_members {
#   view_label: "my team"
#   sql_table_name: `gcp-insight-iq.marketing_dataset.team_members` ;;

#   dimension: employee_id {
#     type: string
#     sql: ${TABLE}.employee_id ;;
#   }
#   dimension: name {
#     type: string
#     sql: ${TABLE}.name ;;
#   }
#   dimension: team_id {
#     type: string
#     sql: ${TABLE}.team_id ;;
#   }
#   measure: count {
#     type: count
#     drill_fields: [name]
#   }
# }


view: team_members {
  view_label: "My Team"
  sql_table_name: `gcp-insight-iq.marketing_dataset.team_members` ;;

  dimension: employee_id {
    type: string
    label: "Employee ID"
    description: "Primary key, uniquely identifies each team member."
    sql: ${TABLE}.employee_id ;;
  }
  dimension: name {
    type: string
    label: "Employee Name"
    description: "Name of the employee."
    sql: ${TABLE}.name ;;
  }
  dimension: team_id {
    type: string
    label: "Team ID"
    description: "Foreign key reference to teams table, identifies the team to which the member belongs."
    sql: ${TABLE}.team_id ;;
  }
  measure: count {
    type: count
    label: "Team Member Count"
    description: "Total number of team members."
    drill_fields: [name]
  }
}
