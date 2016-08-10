module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def render_message(message)
      ApplicationController.render(
      partial: 'messages/message',
      locals: {
        message: message,
        username: current_user.username
      })
    end
  end
end
