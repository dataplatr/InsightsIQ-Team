# connection: "insightiq_sample"
# include:"/views/campaigns.view.lkml"
# include: "/views/campaign_metrics.view.lkml"
# include: "/views/teams.view.lkml"
# include: "/views/team_members.view.lkml"

# datagroup: insightiq_poc1_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

# persist_with: insightiq_poc1_default_datagroup
# explore: campaigns {
#   # label: "campaign_performance"
#   join: campaign_metrics {
#     type: left_outer
#     relationship: one_to_one
#     sql_on: ${campaigns.campaign_id}=${campaign_metrics.campaign_id} ;;
#   }
#   join: teams {
#     type: left_outer
#     relationship: one_to_one
#     sql_on: ${campaigns.team_id}=${teams.team_id} ;;
#   }
#   join: team_members {
#     type: left_outer
#     relationship: one_to_one
#     sql_on: ${teams.team_id}=${team_members.team_id} ;;
#   }
# }
# explore: campaign_metrics {}
# explore: teams {}


connection: "insightiq_sample"
include:"/views/campaigns.view.lkml"
include: "/views/campaign_metrics.view.lkml"
include: "/views/teams.view.lkml"
include: "/views/team_members.view.lkml"

datagroup: insightiq_poc1_default_datagroup {
  # Data group for caching and persistence
  max_cache_age: "1 hour"
}

persist_with: insightiq_poc1_default_datagroup

explore: campaigns {
  label: "Campaign Performance"
  description: "Explores campaign details, including metrics, teams, and team members."

  join: campaign_metrics {
    type: left_outer
    relationship: one_to_one
    sql_on: ${campaigns.campaign_id}=${campaign_metrics.campaign_id} ;;
    # label: "Campaign Metrics"
    # description: "Joins campaign performance data with campaign metrics."
  }

  join: teams {
    type: left_outer
    relationship: one_to_one
    sql_on: ${campaigns.team_id}=${teams.team_id} ;;
    # label: "Teams"
    # description: "Joins campaign data with team information."
  }

  join: team_members {
    type: left_outer
    relationship: one_to_one
    sql_on: ${teams.team_id}=${team_members.team_id} ;;
    # label: "Team Members"
    # description: "Joins team data with team member details."
  }
}

explore: campaign_metrics {
  label: "Campaign Metrics"
  description: "Provides an overview of campaign performance metrics."
}

explore: teams {
  label: "Teams Overview"
  description: "Explores team details, including team members and cost centers."
}
