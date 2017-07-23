# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@selectEmployee = (element, employeeId) ->
  selectListElement(element)
  $('#complaint_employee_id').val(employeeId)

selectListElement = (element) ->
  $('.list-group-item').removeClass('active')
  $(element).addClass('active')

@filterEmployees = ->
  filter = $('#filter').val().toUpperCase()
  employeesList = $('#employees-list').children()
  filterElement(filter, $(employee)) for employee in employeesList

filterElement = (filter, element) ->
  if element.text().toUpperCase().indexOf(filter) > -1
    element.show()
  else
    element.hide()
