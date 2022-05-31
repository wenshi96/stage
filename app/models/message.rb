# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :integer
#  sender_id   :integer
#
class Message < ApplicationRecord
  belongs_to(:sender, { :required => true, :class_name => "User", :foreign_key => "sender_id" })
  belongs_to(:receiver, { :required => true, :class_name => "User", :foreign_key => "receiver_id" })
end
