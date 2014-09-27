class ExamsController < ApplicationController

  def start
	 exam_level = params[:exam_level]
	 all = Quiz.where(:type => exam_level).map {|x| x.id}
	 session[:questions] = all.sort_by{rand}[0..(10-1)]
	 
	 session[:total]   = 10
	 session[:current] = 0
	 session[:correct] = 0
	 
	 @@exam = Exam.create(:exam_level => exam_level)

	 redirect_to :action => "question"
  end

  def question
	 @current = session[:current]
	 @total   = session[:total]
	 
	 if @current >= @total
		redirect_to :action => "end"
		return
	 end
	 
	 @question = Quiz.find(session[:questions][@current])
	 @choices = @question.quiz_options.sort_by{rand}

	 session[:question] = @question.id
	 session[:choices] = @choices.map{|c| c.id }

  end

  def answer
	 @current = session[:current]
	 @total   = session[:total]
	 
	 choiceid = params[:choice]
	 @question = Quiz.find(session[:question])
	 @choices = @question.quiz_options
	 @choice = choiceid ? QuizOption.find(choiceid) : nil

	 if @choice and @choice.correct
		@correct = true
		session[:correct] += 1
	 else
		@correct = false
	 end
	 
	 session[:current] += 1
  end

end
