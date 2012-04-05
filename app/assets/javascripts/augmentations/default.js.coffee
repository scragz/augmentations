Augmentations.Default = {}
class Augmentations.Default.LoggedInStatus extends Augmentations.Base
  test: =>
    @session.user_signed_in
  augment: =>
    @root()
      .find('.loggedIn').show()
      .find('a:first').text(@session.display_name)
  failed: =>
    @root().find('.loggedOut').show()

class Augmentations.Default.OrderStatus extends Augmentations.Base
  test: =>
    @session.has_order
  augment: =>
    @root()
      .find('.default').hide().end()
      .find('.hasOrder').show()

class Augmentations.Default.AdminMenu extends Augmentations.Base
  url: =>
    '/admin/augmentations/menu.html'
  test: =>
    @session.is_admin
  augment: =>
    $.get(@url()).success (data)=>
      $(data).prependTo(@root()).dropdownTab()

# Used on a show action to add admin augmentations
class Augmentations.Default.AdminShow extends Augmentations.Base
  getId: =>
    @_id = $('html').attr('data-id')
  test: =>
    @session.is_admin && @getId()