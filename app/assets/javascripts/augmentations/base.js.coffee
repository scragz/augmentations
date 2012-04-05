class Augmentations.Base
  @$document = $(document)
  constructor: ->
    @$document = Augmentations.Base.$document
  # The root element this augmentation is concerned with.
  # The Augmentation will not attach unless this element exists.
  root: =>
    @_root ||= $(@selector())
  # Binds this Augmentation to the `sessionLoad` event.
  # @see @trigger()
  attach: =>
    @$document.on {sessionLoad: @trigger} if @root().length
  # Saves the session and triggers the augmentation.
  trigger: (event, session)=>
    if @session = session then @augment() else @failed()
  # @return String jquery selector
  selector: =>
    throw "Not implemented"
  # @return Boolean
  test: =>
    throw "Not implemented"
  # Do your business.
  augment: =>
    throw "Not implemented"
  # In the rarer case that something needs to happen when the test fails
  failed: =>
    null