class ChangePubmedLinkToPmid < ActiveRecord::Migration
  def self.up
    change_table :publications do |t|
      t.remove :pubmed_link
      t.integer :pmid
    end
  end

  def self.down
    t.remove :pmid
    t.string :pubmed_link
  end
end
