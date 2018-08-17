class CreateAnagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :anagrams do |t|
      t.string :firstword
      t.string :secondword
      t.boolean :matching

      t.timestamps
    end
  end
end
