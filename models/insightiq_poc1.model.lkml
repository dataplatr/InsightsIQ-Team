connection: "insightiq_sample"
include:"/views/campaigns.view.lkml"
include: "/views/campaign_metrics.view.lkml"
include: "/views/teams.view.lkml"

datagroup: insightiq_poc1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: insightiq_poc1_default_datagroup
explore: campaigns {
  join: campaign_metrics {
    type: left_outer
    relationship: one_to_one
    sql_on: ${campaigns.campaign_id}=${campaign_metrics.campaign_id} ;;
  }
  join: teams {
    type: left_outer
    relationship: one_to_one
    sql_on: ${campaigns.team_id}=${teams.team_id} ;;
  }
}
explore: campaign_metrics {}
explore: teams {}
