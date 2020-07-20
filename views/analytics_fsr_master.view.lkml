view: analytics_fsr_master {
  sql_table_name: `leandro-277122.Leandro1.analytics_fsr_master`
    ;;

  measure: commit_quota {
    type: sum
    value_format: "$#,##0,\" K\""
    sql: ${TABLE}.commit_quota ;;
  }


  measure: dwv_quota {
    type: sum
    value_format: "$#,##0,\" K\""
    sql: ${TABLE}.dwv_quota ;;
  }

  dimension: fsr {
    type: string
    primary_key: yes
    sql: ${TABLE}.FSR ;;
  }

  measure: looker_quota {
    type: sum
    value_format: "$#,##0,\" K\""
    sql: ${TABLE}.looker_quota ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
