# Augmentations

A tiny framework for helping solve the common problem when using caches_action in rails apps: Still needing to show custom info for the current user, order, etc.

First it loads the JSON of the current session info, by default from `/session/info.json`. All the augmentations are then called with this information.

app/assets/application.js:
    //= require augmentations/application
    //= require augmentations

app/assets/javascripts/augmentations.js.coffee:
    class Augmentations.AdminMenu extends Augmentations.Base
      url: =>
        '/admin/augmentations/menu.html'
      # only attaches if selector exists
      # @root() gives a jquery object of this selector
      selector: =>
        '#hd_menu'
      # make a test on the session info
      test: =>
        @session.is_admin
      # load the menu and add it to the top menu
      augment: =>
        $.get(@url()).success (data)=>
          $(data).appendTo(@root())
    $(->
      # listen for sessionLoad
      (new Augmentations.AdminMenu).attach()
    )