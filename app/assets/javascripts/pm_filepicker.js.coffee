jQuery ->
  window.PMFilePicker = {
# Public: Opens a filepicker to select one or multiple files
  pickFiles: (onSuccess, onError) ->
    filepicker.pickMultiple(onSuccess, onError)

# Public: Creates a filepicker drop pane
#
# options - The hash containing selectors for drop pane elements
#           :dropPane - The selector for element to turn into drop pane (required).
#           :imageLanding - The selector for the container to place the image(s),
#                           must containe "= add_fields_tag f, :images" (required).
#           :imageProgressBar - The selector for a bootstrap progress bar (required).
#           :allowMultiple - Boolean indicating if multiple images or just one is allowed (optional, default: true).
#           :dragEnter - function() called when dragging file over drop pane (optional)
#           :dragLeave - function() called when dragging file out of drop pane (optional)
#           :onStart - function() called when upload starts (optional)
#           :onSucess - function(fpFiles) called with an array of filepicker files, called
#                       when upload is successful (required)
#           :onError - function(type, message) with an the errors message and
#                      type when an error occurs during upload (required)
#           :onProgress - function(percentage) called during upload with percentage (required)
#
  dropPane: (options) ->
    options = $.extend({
                       $dropPane: null
                       imageLanding: null
                       imageProgressBar: null
                       dragEnter: null
                       dragLeave: null
                       onStart: null
                       onSuccess: null
                       onError: null
                       onProgress: null
                       getImageContainer: null
                       allowMultiple: true
                       }, options || {})




    requiredOptions = {
    $dropPane: options.$dropPane != null
    $dropPane: options.$dropPane.length > 0
    onSuccess: options.onSuccess != null
    onError: options.onError != null
    }
    for optionName, optionValue of requiredOptions
      unless optionValue
        if window.console then console.log "ERROR Line 55: ", optionName

    $.globalMessenger().do
      errorMessage: 'Error uploading your image'
      successMessage: 'Image uploaded!'
      action: (messenger) ->
        filepicker.makeDropPane(options.$dropPane, {
        multiple: options.allowMultiple
        mimetype: 'image/*'
        dragEnter: () ->
          if options.dragEnter
            options.dragEnter()
        dragLeave: () ->
          if options.dragLeave
            options.dragLeave()
        onStart: () ->
          if options.onStart
            options.onStart()
        onSuccess: (fpfiles) ->
          options.onSuccess(fpfiles, messenger)
        onError: (type, message) ->
          if options.onError
            options.onError(type, message, messenger)
        onProgress: (percentage) ->
          if options.onProgress
            options.onProgress(percentage)

        })

  addImages: (fpfiles, getImageContainer, onComplete) ->
    for file in fpfiles
      $imageContainer = getImageContainer()
      $urlField = $imageContainer.find('input.js-image-url[type=hidden]').last()
      $sourceField = $imageContainer.find('input.js-image-source[type=hidden]').last()
      $urlField.val(file.url)
      $sourceField.val("filepicker")
      $imageContainer.find('img').last().attr('src', file.url)
    onComplete()

  }
