include: "test.model.lkml"

view: ndt_test_2 {
  derived_table: {
    sql_trigger_value: SELECT NOW()  ;;
    explore_source: users {
      column: age {}
      column: gender { field: users.gender}
      column: count {}
      filters: {
        field: users.age
        value: ">50"
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
