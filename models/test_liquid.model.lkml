connection: "thelook"

view: orders {
  sql_table_name: {% if orders.id._in_query %} demo_db.orders {% else %} WRONG—orders.id IS in the query! {% endif %} ;;
  dimension: status {
    required_fields: [id]
  }
  dimension: id {
    type: number
  }
  measure: count {
    type: count
    required_fields: [id]
  }
}

explore: orders {}
