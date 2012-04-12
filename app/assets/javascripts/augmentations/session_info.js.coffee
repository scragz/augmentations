class Augmentations.SessionInfo
  @sessionInfoUrl = '/session/info.json'
  constructor: (@url=SessionInfo.sessionInfoUrl)->
  loading: =>
    @spinner = $('<div/>').appendTo('#hd_masthead_sessionmenu').spin({color:'#fff', lines: 12})
  doneLoading: =>
    @spinner.remove()
  load: =>
    @loading()
    $.getJSON @url
  display: =>
    @load().success (data)=>
      @session = data
      log @session
      @doneLoading()
      @triggerEvent()
  triggerEvent: =>
    event = jQuery.Event('sessionLoad')
    $(document).trigger(event, [@session])
