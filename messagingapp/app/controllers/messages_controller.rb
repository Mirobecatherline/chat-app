class MessagesController < ApplicationController
    def index
        messages = Message.all
        render json: messages
      end
      def create
        user = User.find(params[:user_id])
        message = params[:message]
        created_message = user.messages.create(content: message)
        ActionCable.server.broadcast('message_channel', created_message) if user.save
        head :ok
      end
end
