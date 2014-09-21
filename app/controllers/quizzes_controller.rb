class QuizzesController < ApplicationController

	def index
		@quiz = Quiz.all
	end

	def create
	    @exam = Exam.new
	    @exam.exam_level = params[:exam_level]
	    @exam.save
	    	redirect_to quizzes_path
  end

end
