class AddPaperclipToContact < ActiveRecord::Migration
  def change
  	add_attachment :contacts, :image, :default_url => "missing_avatar.jpg"
  end
end
