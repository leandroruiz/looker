view: salesforce {
  sql_table_name: `Leandro1.Salesforce`
    ;;

  dimension: account_name__account_name {
    type: string
    sql: ${TABLE}.Account_Name__Account_Name ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  measure: amount_sum {
    type: sum
    value_format: "$#,##0,\" K\""
    drill_fields: [account_name__account_name,opportunity_name,forecast_category,close_quarter,opportunity_id]
    sql: ${amount} ;;
  }

  dimension: amount_currency {
    type: string
    sql: ${TABLE}.Amount_Currency ;;
  }

  dimension: opportunity_id {
    type: string
    link: {
      label: "Vector"
      url: "https://vector.lightning.force.com/lightning/r/Opportunity/{{ value }}/view"
      icon_url: "http://google.com/favicon.ico"
    }
    sql: ${TABLE}.Opportunity_Id ;;
  }


  dimension: annual_contract_value {
    type: string
    sql: ${TABLE}.Annual_Contract_Value ;;
  }
  measure: annual_contract_value_sum {
    type: sum
    value_format: "$#,##0,\" K\""
    drill_fields: [account_name__account_name,opportunity_name,forecast_category,close_quarter,opportunity_id,amount,annual_contract_value,amount_sum,annual_contract_value_sum]
    sql: ${amount}*12/(CASE WHEN ${term__months_} =0 THEN 12 ELSE ${term__months_} END) ;;
  }

  dimension: annual_contract_value_currency {
    type: string
    sql: ${TABLE}.Annual_Contract_Value_Currency ;;
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

  dimension: comp_product_factor {
    type: number
    sql: ${TABLE}.Comp_Product_Factor ;;
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
    sql: ${TABLE}.Opportunity_Owner__Sub_Region ;;
  }

  dimension: opportunity_record_type {
    type: string
    sql: ${TABLE}.Opportunity_Record_Type ;;
  }

  dimension: pillar {
    type: string
    sql: ${TABLE}.Pillar ;;
  }

  dimension: solution {
    type: string
    sql: ${TABLE}.Solution ;;
  }

  dimension: term__months_ {
    type: number
    sql: ${TABLE}.Term__Months_ ;;
  }

  dimension: total_solution_value {
    type: number
    sql: ${TABLE}.Total_Solution_Value ;;
  }

  measure: total_solution_value_sum {
    type: sum
    value_format: "$#,##0,\" K\""
    drill_fields: [account_name__account_name,opportunity_name,forecast_category,close_quarter,opportunity_id]
    sql: ${total_solution_value} ;;
  }

  measure: solution_acv {
    type: sum
    value_format: "$#,##0,\" K\""
    drill_fields: [account_name__account_name,opportunity_name,forecast_category,close_quarter,opportunity_id]
    sql: ${total_solution_value}*12/(CASE WHEN ${term__months_} =0 THEN 12 ELSE ${term__months_} END) ;;
  }

  dimension: total_solution_value_currency {
    type: string
    sql: ${TABLE}.Total_Solution_Value_Currency ;;
  }

  dimension: use_case {
    type: string
    sql: ${TABLE}.Use_Case ;;
  }

  dimension: snapshot_date {
    type: date
    sql: ${TABLE}.Snapshot_Date ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, account_name__account_name, opportunity_owner__full_name]
  }
}
