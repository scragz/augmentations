Augmentations.Common = {}

# Show .loggedIn or .loggedOut, both previously hidden
class Augmentations.Common.LoggedInStatus extends Augmentations.Base
  test: =>
    @session.user_signed_in
  augment: =>
    @root()
      .find('.loggedIn').show()
      .find('a:first').text(@session.display_name)
  failed: =>
    @root().find('.loggedOut').show()

# Hides .default text and shows previously hidden .hasOrder
class Augmentations.Common.OrderStatus extends Augmentations.Base
  test: =>
    @session.has_order
  augment: =>
    @root()
      .find('.default').hide().end()
      .find('.hasOrder').show()

# Append an admin dropdown to the main menu
class Augmentations.Common.AdminMenu extends Augmentations.Base
  url: =>
    '/admin/augmentations/menu.html'
  test: =>
    @session.is_admin
  augment: =>
    $.get(@url()).success (data)=>
      $(data).appendTo(@root())

# Subclass and use on a show action to add admin augmentations
class Augmentations.Common.AdminShow extends Augmentations.Base
  getId: =>
    @_id = $('html').attr('data-id')
  test: =>
    @session.is_admin && @getId()
