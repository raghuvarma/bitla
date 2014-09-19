class CreateQuizAnswers < ActiveRecord::Migration
  def change
    create_table :quiz_answers do |t|
      t.integer :quiz_option_id

      t.timestamps
    end
  end
end
