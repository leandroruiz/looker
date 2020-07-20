view: modified_records {
  sql_table_name: `leandro-277122.Leandro1.Modified_Records`
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
    drill_fields: [opportunity_name,forecast_category,close_quarter,amount_sum]
    sql: ${amount} ;;
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

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.Forecast_Category ;;
  }

  dimension: new_state {
    type: string
    sql: ${TABLE}.New_State ;;
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

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.Opportunity_Name ;;
  }

  dimension: opportunity_record_type {
    type: string
    sql: ${TABLE}.Opportunity_Record_Type ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, account_name__account_name]
  }
}
