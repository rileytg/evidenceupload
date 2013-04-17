jQuery ->
  window.PMForms = {
  addFields: (element, appendTo) ->
    $element = $(element)
    time = new Date().getTime()
    regexp = new RegExp($element.data('id'), 'g')
    $appendTo = appendTo
    $appendTo.append($element.data('fields').replace(regexp, time))
  }
