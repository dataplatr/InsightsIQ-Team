
# '''project_name: "insightIQ"

# application: insightIQ {
#   label: "insightIQ"
#   url: "https://localhost:8080/bundle.js"
# # file: "bundle.js
#   entitlements: {
#     core_api_methods: ["lookml_model_explore","me"]
#   }
# }



application: insightIQ {
  label: "insightIQ"
  url: "https://localhost:8080/bundle.js"
  # file: "bundle.js"
  entitlements: {
    core_api_methods: ["run_inline_query", "me", "all_looks", "run_look", "all_lookml_models", "run_sql_query", "create_sql_query",
      "lookml_model_explore", "create_query", "use_iframes", "use_embeds",  "use_form_submit",
      "all_dashboards", "dashboard_dashboard_elements", "run_query", "dashboard", "lookml_model"]
    navigation: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
    new_window_external_urls: ["https://developers.generativeai.google/*"]
    local_storage: yes
    external_api_urls: [ "https://insight-iq-backend-636080826235.us-central1.run.app",
  "https://localhost:8080","https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent","http://localhost:8080","http://localhost:5000/run-query","https://timestone.cloud.looker.com/api/4.0/login"]
  }
}
# application:insightIQ {
#   label: "insightIQ"
#   url: "https://localhost:8080/bundle.js"
#   file: "bundle.js"
#   entitlements: {
#     core_api_methods: ["lookml_model_explore","create_sql_query","run_sql_query","run_query","create_query"]
#     navigation: yes
#     use_embeds: yes
#     use_iframes: yes
#     # new_window: yes
#     # new_window_external_urls: ["https://insight-iq-backend-636080826235.us-central1.run.app*"]
#     local_storage: yes
#     external_api_urls: ["https://insight-iq-backend-636080826235.us-central1.run.app"]
#   }
# }
