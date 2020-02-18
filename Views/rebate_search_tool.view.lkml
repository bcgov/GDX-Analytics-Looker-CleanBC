include: "date_comparisons_common.view"

view: rebate_search_tool {
  derived_table: {
    sql: SELECT *, CONVERT_TIMEZONE('UTC', 'America/Vancouver',  root_tstamp) AS event_time FROM atomic.ca_bc_gov_cleanbc_rst_1 ;;
  }

  extends: [date_comparisons_common]

  dimension_group: filter_start {
    sql: ${TABLE}.event_time  ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;

  }

  dimension_group: Event {
    type: time
    sql: ${TABLE}.event_time ;;
    timeframes: [time, minute, minute10, hour, date, week, month, quarter, year, time_of_day, hour_of_day, day_of_week]
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination;;
  }

  dimension: element_type {
    type: string
    sql: ${TABLE}.element_type;;
  }

  dimension: filter_values {
    type: string
    sql: ${TABLE}.filter_values;;
  }

  dimension: heating_type {
    type: string
    sql: ${TABLE}.heating_type;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label;;
  }

  dimension: location {
    type: string
    sql: BTRIM(${TABLE}.location);;
  }

  dimension: project_type {
    type: string
    sql: ${TABLE}.project_type;;
  }

  dimension: rebate {
    type: string
    sql: ${TABLE}.rebate;;
  }


  measure: count {
    type: count
  }

}



#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
