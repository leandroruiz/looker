view: previous_date {
  sql_table_name: `leandro-277122.Leandro1.Previous_Date`
    ;;

  dimension: snapshot_date_last {
    primary_key: yes
    type: date
    sql: ${TABLE}.Snapshot_Date_Last ;;
  }

  dimension_group: snapshot_date_prev_day {
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
    sql: ${TABLE}.Snapshot_Date_Prev_Day ;;
  }

  dimension_group: snapshot_date_prev_week {
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
    sql: ${TABLE}.Snapshot_Date_Prev_Week ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
