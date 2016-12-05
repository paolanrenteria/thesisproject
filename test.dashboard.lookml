- dashboard: test
  title: Test
  layout: tile
  tile_size: 100

  filters:

  - name: birth_date
    title: 'Birth Date'
    type: field_filter
    explore: users
    field: users.birth_date

  - name: username
    title: 'Username'
    type: field_filter
    explore: users
    field: users.username
    listens_to_filters: [age]


  elements:

    - name: add_a_unique_name_1480954094
      title: Untitled Visualization
      type: table
      model: digital_nest
      explore: users
      dimensions: [users.username, users.birth_date]
      measures: [users.count]
      sorts: [users.birth_date desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      limit_displayed_rows: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: '#808080'
      series_types: {}
