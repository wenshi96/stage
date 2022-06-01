class MessagesController < ApplicationController
  def index
    # matching_messages = Message.all
    matching_messages = @current_user.sent_messages.or(@current_user.received_messages)
    contact_users_id = matching_messages.map_relation_to_array(:sender_id)+matching_messages.map_relation_to_array(:receiver_id)
    @contact_users_id = contact_users_id.reject { |n| n == @current_user.id }.uniq

    @list_of_messages = matching_messages.order({ :created_at => :desc })

    render({ :template => "messages/index.html.erb" })
  end

  def show
    #contact user
    the_id = params.fetch("path_id")
    @the_user = User.where({:id=>the_id}).first
    matching_messages = @current_user.sent_messages.or(@current_user.received_messages)
    matching_messages = matching_messages.where(:sender=>@the_user).or(matching_messages.where(:receiver=>@the_user))
    @list_of_messages = matching_messages.order({ :created_at => :desc })

    render({ :template => "messages/show.html.erb" })
  end

  def create
    the_message = Message.new
    the_message.sender_id = @current_user.id
    the_message.receiver_id = params.fetch("query_receiver_id")
    the_message.content = params.fetch("query_content")

    if the_message.valid?
      the_message.save
      redirect_to("/messages/#{the_message.receiver_id}", { :notice => "Message sent successfully." })
    else
      redirect_to("/messages/#{the_message.receiver_id}", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end
end
