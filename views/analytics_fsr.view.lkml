view: analytics_fsr {
  sql_table_name: `Leandro1.Analytics_FSR`
    ;;

  dimension: analytic_fsr {
    type: string
    sql: ${TABLE}.Analytic_FSR ;;
  }

  dimension: fsm {
    type: string
    sql: ${TABLE}.FSM ;;
  }

  dimension: fsr {
    type: string
    sql: ${TABLE}.FSR ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
