view: salesforce_detail_previous {
  sql_table_name: `Leandro1.Salesforce_Detail_Previous`
    ;;

  dimension: snapshot_date {
    type: date
    datatype: date
    allow_fill: no
    sql: ${TABLE}.Snapshot_Date ;;
  }

  dimension: account_name__account_name {
    type: string
    sql: ${TABLE}.Account_Name__Account_Name ;;
  }

  dimension: acv {
    type: number
    sql: ${TABLE}.ACV ;;
  }

  measure: acv_sum {
    type: sum
    value_format: "$#,##0,\" K\""
    sql: ${acv} ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension: analytic_fsr {
    type: string
    sql: ${TABLE}.Analytic_FSR ;;
  }

  measure: amount_sum {
    type: sum
    value_format: "$#,##0,\" K\""
    sql: ${amount} ;;
  }


  dimension: analytics_amt {
    type: number
    sql: ${TABLE}.Analytics_Amt ;;
  }

  measure: analyitcs_amt_sum {
    type: sum
    value_format: "$#,##0,\" K\""
    drill_fields: [opportunity_name, forecast_category,opportunity_record_type, analytic_fsr,close_quarter,analyitcs_amt_sum, opportunity_id]
    sql: ${analytics_amt} ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Close_Date ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Created_Date ;;
  }

  dimension: forecast_category {
    type: string
    drill_fields: [opportunity_name]
    sql: ${TABLE}.Forecast_Category ;;
  }

  dimension: opportunity_id {
    type: string
    link: {
      label: "Vector"
      url: "https://vector.lightning.force.com/lightning/r/Opportunity/{{ value }}/view"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.Opportunity_Name ;;
  }

  dimension: opportunity_owner__full_name {
    type: string
    sql: ${TABLE}.Opportunity_Owner__Full_Name ;;
  }

  dimension: opportunity_owner__pod_micro_region {
    type: string
    sql: ${TABLE}.Opportunity_Owner__Pod_Micro_Region ;;
  }

  dimension: opportunity_owner__sub_region {
    type: string
    sql: ${TABLE}.Opportunity_Owner__Sub_region ;;
  }

  dimension: opportunity_record_type {
    type: string
    sql: ${TABLE}.Opportunity_Record_Type ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.Quarter ;;
  }

  dimension: term__months_ {
    type: number
    sql: ${TABLE}.Term__Months_ ;;
  }

  dimension: vector_quality {
    type: number
    sql: ${TABLE}.Vector_Quality ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, account_name__account_name, opportunity_owner__full_name]
  }
}
