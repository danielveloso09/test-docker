$(document).on "turbolinks:load", ->
  $('#reports-datatable').dataTable
    processing: true
    serverSide: true
    ajax: $('#reports-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {"data": "id"},
      {"data": "user"},
      {"data": "name"},
      {"data": "location"},
      {"data": "created_at"}
    ]