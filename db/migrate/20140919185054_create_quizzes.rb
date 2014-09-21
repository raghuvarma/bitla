class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.text :title
      t.string :type

      t.timestamps
    end
  end
end
