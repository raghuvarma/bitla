class AddScoreToExam < ActiveRecord::Migration
  def change
    add_column :exams, :score, :integer
    add_column :exams, :result, :string
  end
end
