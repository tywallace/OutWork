class FacebookAuthtoUser < ActiveRecord::Migration
  def change
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  	add_column :users, :oauth_token, :string
  	add_column :users, :ouath_expires_at, :datetime
  end
end
