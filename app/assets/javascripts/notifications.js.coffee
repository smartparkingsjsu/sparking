class Notifications
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        @setup() if @notifications.length > 0 

    setup: -> 
        $.ajax(
            url: "/notifications.json"
            dataType: "JSON"
            method: "GET"
            success: @handleSuccess
        )

    handleSuccess: (data) =>
        console.log(data)
        items = $.map data, (a) ->
            "<li><a href='#{a.url}'>#{a.action} #{a.message.license_plate} #{a.garage.located_at}</a></li>"

        $("[data-behavior='unread-count']").text(items.length)
        $("[data-behavior='notification-items']").html(items)

jQuery ->
    new Notifications 