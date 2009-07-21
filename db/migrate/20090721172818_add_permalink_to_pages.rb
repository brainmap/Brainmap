class AddPermalinkToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.string :permalink
    end
  end

  def self.down
    change_table :pages do |t|
      t.remove :permalink
    end
  end
end
