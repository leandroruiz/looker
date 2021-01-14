view: salesforce_opportunity {
  sql_table_name: `leandro-277122.Leandro1.Salesforce_Opportunity_Last`
    ;;

  dimension: account_name__account_name {
    type: string
    label: "Account Name"
    sql: ${TABLE}.Account_Name ;;
  }

  dimension: partner_name {
    type: string
    label: "Partner_Name"
    sql: ${TABLE}.Comp_Product_Factor ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension: analytics_amt {
    type: number
    sql: ${TABLE}.Analytics_Amt ;;
  }

  measure: analytics_amt_sum {
    type: sum
    label: "Analytcs ACV"
    value_format: "$#,##0,\" K\""
    drill_fields: [opportunity_name, forecast_category,opportunity_record_type, analytic_fsr,close_quarter,analytics_amt_sum, opportunity_id]
    sql: ${analytics_amt} ;;
  }

  dimension: analytic_fsr {
    type: string
    sql: ${TABLE}.Analytic_FSR ;;
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
    allow_fill: no
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
    sql: ${TABLE}.Forecast_Category ;;
  }

  dimension: opportunity_id {
    type: string
    link: {
      label: "Vector"
      url: "https://vector.lightning.force.com/lightning/r/Opportunity/{{ value }}/view"
      icon_url: "http://google.com/favicon.ico"
    }
    sql: ${TABLE}.Opportunity_ID ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.Opportunity_Name ;;
  }

  dimension: opportunity_owner__full_name {
    type: string
    label: "Opportunity Owner"
    sql: ${TABLE}.Opportunity_Owner ;;
  }

  dimension: opportunity_owner__pod_micro_region {
    type: string
    sql: ${TABLE}.Pod_Micro_Region ;;
  }

  dimension: opportunity_record_type {
    type: string
    sql: ${TABLE}.Opportunity_Record_Type ;;
  }

  dimension_group: snapshot {
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
    sql: ${TABLE}.Snapshot_Date ;;
  }

  dimension: term__months_ {
    type: number
    sql: ${TABLE}.Term__Months_ ;;
  }

  measure: amount_sum {
    type: sum
    label: "TCV"
    value_format: "$#,##0,\" K\""
    drill_fields: [opportunity_name,forecast_category,close_quarter,opportunity_id,amount_sum]
    sql: ${amount} ;;
  }



  measure: annual_contract_amount_sum {
    type: sum
    label: "ACV"
    value_format: "$#,##0,\" K\""
    drill_fields: [opportunity_name,forecast_category,opportunity_record_type,close_quarter,opportunity_id,annual_contract_amount_sum]
    sql: ${amount} *12/term__months_;;
  }


  measure: non_analytics_acv_sum {
    type: sum
    label: "Other ACV"
    value_format: "$#,##0,\" K\""
    drill_fields: [opportunity_name,forecast_category,opportunity_record_type,close_quarter,opportunity_id,annual_contract_amount_sum]
    sql: ${amount} *12/term__months_-${analytics_amt};;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, account_name__account_name, opportunity_owner__full_name]
  }
}
