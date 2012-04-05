= Augmentations

A tiny framework for helping solve common problem when using caches_action in rails apps: Still needing to show custom info for the current user, order, etc.

First it loads the JSON of the current session info, by default from `/session/info.json`. All the augmentations are then called with this information.

An example from the included default rules:

    class Augmentations.AdminMenu extends Augmentations.Base
      url: =>
        '/admin/augmentations/menu.html'
      test: =>
        @session.is_admin
      augment: =>
        $.get(@url()).success (data)=>
          $(data).prependTo(@root()).dropdownTab()
    $(->
      (new Augmentations.AdminMenu).attach()
    )