namespace :slurp do
  desc "TODO"
  task users: :environment do
    require "csv"
    # users
    User.destroy_all
    csv_text = File.read(Rails.root.join("lib", "csvs", "users.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = User.new
      t.id = row["id"]
      t.username = row["username"]
      t.email = row["email"]
      t.password_digest = row["password_digest"]
      t.genre = row["genre"]
      t.time_commitment = row["time_commitment"]
      t.age = row["age"]
      t.experience = row["experience"]
      t.role = row["role"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
      # puts "#{t.street_address}, #{t.zip} saved"    
    end
    puts "There are now #{User.count} rows in the user table"

    # photos
    Photo.destroy_all
    csv_text2 = File.read(Rails.root.join("lib", "csvs", "photos.csv"))
    csv2 = CSV.parse(csv_text2, :headers => true, :encoding => "ISO-8859-1")
    csv2.each do |row|
      t = Photo.new
      t.id = row["id"]
      t.caption = row["caption"]
      t.image = row["image"]
      t.owner_id = row["owner_id"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "There are now #{Photo.count} rows in the photo table"

    # messages
    Message.destroy_all
    csv_text3 = File.read(Rails.root.join("lib", "csvs", "messages.csv"))
    csv3 = CSV.parse(csv_text3, :headers => true, :encoding => "ISO-8859-1")
    csv3.each do |row|
      t = Message.new
      t.id = row["id"]
      t.content = row["content"]
      t.receiver_id = row["receiver_id"]
      t.sender_id = row["sender_id"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "There are now #{Message.count} rows in the message table"

    
    # comments
    Comment.destroy_all
    csv_text4 = File.read(Rails.root.join("lib", "csvs", "comments.csv"))
    csv4 = CSV.parse(csv_text4, :headers => true, :encoding => "ISO-8859-1")
    csv4.each do |row|
      t = Comment.new
      t.id = row["id"]
      t.body = row["body"]
      t.commenter_id = row["commenter_id"]
      t.photo_id = row["photo_id"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "There are now #{Comment.count} rows in the comment table"    


    # likes
    Like.destroy_all
    csv_text5 = File.read(Rails.root.join("lib", "csvs", "likes.csv"))
    csv5 = CSV.parse(csv_text5, :headers => true, :encoding => "ISO-8859-1")
    csv5.each do |row|
      t = Like.new
      t.id = row["id"]
      t.liker_id = row["liker_id"]
      t.photo_id = row["photo_id"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "There are now #{Like.count} rows in the like table"        

    # follow requests
    FollowRequest.destroy_all
    csv_text6 = File.read(Rails.root.join("lib", "csvs", "requests.csv"))
    csv6 = CSV.parse(csv_text6, :headers => true, :encoding => "ISO-8859-1")
    csv6.each do |row|
      t = FollowRequest.new
      t.id = row["id"]
      t.sender_id = row["sender_id"]
      t.recipient_id = row["recipient_id"]
      t.status = row["status"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "There are now #{FollowRequest.count} rows in the follow request table"        
  end

end
