connection: "insightiq"

datagroup: insightiq_poc1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: insightiq_poc1_default_datagroup

