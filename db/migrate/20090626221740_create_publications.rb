class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :title
      t.string :journal_info
      t.text :abstract
      t.date :publication_date
      t.string :pubmed_link

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
