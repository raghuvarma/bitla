class CreateQuizOptions < ActiveRecord::Migration
  def change
    create_table :quiz_options do |t|
      t.string :option
      t.boolean :correct
      t.integer :value
      t.integer :quiz_id

      t.timestamps
    end
  end
end
