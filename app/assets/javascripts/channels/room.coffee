App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert("You have a new mention") if data.mention
    unless data.content.blank?
      $('#messages-table').append '<div class="message">' +
        '<div class="message-user">' + data.username + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'
      scroll_bottom()

  $(document).ready ->
    submit_message()
    scroll_bottom()

  submit_message = () ->
    $('#message_content').on 'keydown', (event) ->
      if event.keyCode is 13 && !event.shiftKey
        $('input').click()
        event.target.value = ""
        event.preventDefault()

  scroll_bottom = () ->
    $('#messages').scrollTop($('#messages')[0].scrollHeight)
