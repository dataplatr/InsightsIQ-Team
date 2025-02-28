
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
  file: "bundle.js"
  entitlements: {
    core_api_methods: ["me","lookml_model_explore","create_sql_query","run_sql_query","run_query","create_query"]
    navigation: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
    new_window_external_urls: ["https://developers.generativeai.google/*"]
    local_storage: yes
    # external_api_urls: ["cloud function url"]
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
