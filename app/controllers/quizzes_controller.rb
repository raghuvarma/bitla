class QuizzesController < ApplicationController

	def index
		@quiz = Quiz.all
	end
end
