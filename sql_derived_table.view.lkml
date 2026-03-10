
view: sql_derived_table {
  derived_table: {
    sql: {% raw %} SELECT
          `orders`.`id` AS `orders.id`,
          `users`.`id` AS `users.id`,
          COUNT(DISTINCT orders.id ) AS `orders.count`,
          COUNT(DISTINCT users.id ) AS `users.count`
      FROM
          `demo_db`.`order_items` AS `order_items`
          LEFT JOIN `demo_db`.`orders` AS `orders` ON `order_items`.`order_id` = `orders`.`id`
          LEFT JOIN `demo_db`.`users` AS `users` ON `orders`.`user_id` = `users`.`id`
      GROUP BY
          users.id
      LIMIT 500 {% endraw %} ;;
  }

  measure: counts {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.`orders.id` ;;
  }

  dimension: users_id {
    type: number
    sql: ${TABLE}.`users.id` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  set: detail {
    fields: [
        orders_id,
  users_id,
  orders_count,
  users_count
    ]
  }
}
