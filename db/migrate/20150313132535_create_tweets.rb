class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |v|
      v.string :text
      v.belongs_to :twitteruser
      v.timestamps null: false

    end
  end
end
