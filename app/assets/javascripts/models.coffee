@changeFilters = () ->
  selectedValue = $('#available_filters').val()
  inputs = $('.form-group').children('input')
  filterChanged(input, selectedValue) for input in inputs

filterChanged = (input, selectedValue) ->
  $(input).val('')
  if input.id == selectedValue
    $(input).removeClass('hide')
  else
    $(input).addClass('hide')
