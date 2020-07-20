connection: "bq_leandro"

# include all the views
include: "/views/**/*.view"

datagroup: leandro_bq_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: leandro_bq_default_datagroup

explore: analytics_fsr {}

explore: salesforce {
  join: analytics_fsr {
    foreign_key: opportunity_owner__full_name
    relationship: many_to_one # Could be excluded since many_to_one is the default
    type: left_outer          # Could be excluded since left_outer is the default
  }

}

explore: salesforce_detail {
  join: analytics_fsr_master {
    foreign_key: analytic_fsr
    relationship: many_to_one # Could be excluded since many_to_one is the default
    type: left_outer          # Could be excluded since left_outer is the default
  }
}

explore: salesforce_detail_previous {join: analytics_fsr_master {
    foreign_key: analytic_fsr
    relationship: many_to_one # Could be excluded since many_to_one is the default
    type: left_outer          # Could be excluded since left_outer is the default
  }}

explore: vector_quality_problems {}

explore: modified_records {}

explore: salesforce_opportunity {}

explore: analytics_fsr_master {}
