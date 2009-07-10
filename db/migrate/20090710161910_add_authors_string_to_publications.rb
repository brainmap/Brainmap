class AddAuthorsStringToPublications < ActiveRecord::Migration
  def self.up
    change_table :publications do |t|
      t.string :authors_info
    end
  end

  def self.down
    change_table :publications do |t|
      t.remove :authors_info
    end
  end
end
