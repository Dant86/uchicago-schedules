class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :number
      t.references :course, foreign_key: true
      t.text :times

      t.timestamps
    end
  end
end
