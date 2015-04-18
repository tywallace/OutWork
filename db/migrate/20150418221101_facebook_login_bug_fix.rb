class FacebookLoginBugFix < ActiveRecord::Migration
  def change
  	add_column :users, :oauth_expires_at, :datetime
  	remove_column :users, :ouath_expires_at
  end
end
