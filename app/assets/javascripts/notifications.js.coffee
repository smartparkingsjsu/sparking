class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @getNewNotifications() if @notifications.length > 0

    $("[data-behavior='notifications-link']").on "click", @handleClick
    setInterval (=>
        @getNewNotifications()
    ), 300000

  getNewNotifications: ->
      $.ajax(
          url: "/notifications.json"
          dataType: "JSON"
          method: "GET"
          success: @handleSuccess
      )

  handleClick: (e) =>
      $.ajax(
          url:"/notifications/mark_as_read"
          method: "POST"
          dataType: "JSON"
          success: -> 
              $("[data-behavior='unread-count']").text(0)
      )

  handleSuccess: (data) =>
    items = $.map data, (a) ->
      "<li><a href='#{a.url}'>#{a.action} #{a.message.license_plate} #{a.garage.located_at}</a></li>"

    $("[data-behavior='unread-count']").text(items.length)
    $("[data-behavior='notification-items']").html(items)

jQuery ->
  new Notifications