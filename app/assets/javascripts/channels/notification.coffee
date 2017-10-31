App.notification = App.cable.subscriptions.create {
    channel: "NotificationChannel"
    garage_id: 1.toString()
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#logo-notification').load((location.href + " #logo-notification"))
