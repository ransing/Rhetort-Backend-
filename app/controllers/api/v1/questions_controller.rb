class Api::V1::QuestionsController < ApplicationController

    def index 
        @questions = Question.all
        render json: {question: @questions}
    end 

    def show 
        @question = Question.find(params[:id])
        @answers = @question.answers
        render json: { question: QuestionSerializer.new(@question) }
      end

end
