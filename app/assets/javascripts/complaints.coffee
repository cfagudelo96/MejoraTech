# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@extend_date = (id) ->
  cancel = I18n.t('complaints.index.cancel')
  ok = I18n.t('complaints.index.extend')
  swal({
    title: I18n.t('complaints.index.title_extend_date_modal'),
    icon: 'warning',
    buttons: [cancel, ok],
    dangerMode: true
  }).then((will_extend_date) ->
    if (will_extend_date)
      $.post("/complaints/#{id}/extend_date")
  )