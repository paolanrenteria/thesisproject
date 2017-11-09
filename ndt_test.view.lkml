include: "test.model.lkml"

view: ndt_test {
  derived_table: {
    sql_trigger_value: SELECT NOW() ;;
    explore_source: users {
      column: age {}
      column: gender {}
      column: count {}
      filters: {
        field: users.age
        value: ">20"
      }
    }
    indexes: ["count"]
  }
  dimension: age {
    type: number
  }
  dimension: gender {}
  dimension: count {
    type: number
  }
}
