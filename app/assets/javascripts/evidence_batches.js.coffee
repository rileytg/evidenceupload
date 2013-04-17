jQuery ->
  window.EvidenceBatches = {
  # Internal: called by filepicker multiple upload success
  uploadSuccess: (fpFiles, messenger) ->

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



    PMFilePicker.dropPane({
      $dropPane: $dropPane
      multiple: true

      dragEnter: () ->


      dragLeave: () ->


      onStart: () ->
        $imageProgressBar.parent().show()

      onSuccess: EvidenceBatches.uploadSuccess

      onError: (type, message) ->
        alert '(' + type + ')' + message

      onProgress: (percentage) ->
        $imageProgressBar.html("#{percentage}%")
      })
