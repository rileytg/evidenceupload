jQuery ->
  window.EvidenceBatches = {
  # Internal: called by filepicker multiple upload success
  uploadSuccess: (fpFiles, messenger) ->

    getImageContainer = () ->
      $addField = $imageLanding.children('input.js-add-field[type=hidden]')
      $images = $imageLanding.find('ul')
      PMForms.addFields($addField, $images)

    PMFilePicker.addImages(fpFiles, getImageContainer, () ->
      $dropPane.html("Drop here to upload.").css({
       'backgroundColor': "#F6F6F6",
       'border': "1px dashed #666"
       })
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
        $dropPane.html("Drop here to upload").css({
          'backgroundColor': "#E0E0E0"
          'border': "1px solid #000"
        })

      dragLeave: () ->
        $dropPane.html("Drop images here").css({
          'backgroundColor': "#F6F6F6"
          'border': "1px dashed #666"
        })

      onStart: () ->
        $dropPane.html("Uploading.")
        $imageProgressBar.parent().show()

      onSuccess: EvidenceBatches.uploadSuccess

      onError: (type, message) ->
        alert '(' + type + ')' + message

      onProgress: (percentage) ->
        $imageProgressBar.html("#{percentage}%")
      })
