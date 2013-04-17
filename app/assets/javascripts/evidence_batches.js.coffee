jQuery ->
  window.EvidenceBatches = {
  # Internal: called by filepicker multiple upload success
  uploadSuccess: (fpFiles) ->
    $('#submit').removeAttr('disabled')
    $("#is-image-landing li.placeholder").hide()

    getImageContainer = () ->
      $addField = $imageLanding.children('input.js-add-field[type=hidden]')
      $images = $imageLanding.find('ul')
      PMForms.addFields($addField, $images)

    PMFilePicker.addImages(fpFiles, getImageContainer, () ->
      $imageProgressBar.parent().hide()

    )



  # Public: Use to open a filepicker for post images
  pickFiles: () ->
    PMFilePicker.pickFiles(EvidenceBatches.uploadSuccess, (fpError) ->
      if window.console then console.log "Line 41: ", fpError
    )
  }

  #  Create the drop pane
  if $(".new_evidence_batch").length > 0 # not sure i like how this works...

    $dropPane = $("#is-image-drop")
    $imageProgressBar = $("#is-image-progress-bar")
    $imageLanding = $("#is-image-landing")


    # Behavior for remove image links
    $imageLanding.on 'click', '.is-remove-fields', (event) ->
      count = $imageLanding.find('ul li:not(.placeholder)').length
      $imageLanding.find('li.placeholder').toggle(count > 0)
      $(event.target).closest('li.js-nested-fields').remove()
      false


    PMFilePicker.dropPane({
      $dropPane: $dropPane
      multiple: true

      dragEnter: ->
        $imageLanding.find('ul').addClass('active')

      dragLeave: ->
        $imageLanding.find('ul').removeClass('active')

      onStart: () ->
        $imageProgressBar.css('width', '0%')
        $imageProgressBar.parent().show()

      onSuccess: EvidenceBatches.uploadSuccess

      onError: (type, message) ->
        alert '(' + type + ')' + message

      onProgress: (percentage) ->
        $imageProgressBar.css('width', "#{percentage}%")
      })
