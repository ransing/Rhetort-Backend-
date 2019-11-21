class Api::V1::AnswersController < ApplicationController

    def index 
        if token_is_valid
        @answers = Answer.all
        render json: {answer: @answers}  
        else
        render json: { go_away: true }, status: :unauthorized
        end 
    end 

    def show 
        @answer = Answer.find(params[:id])
        render json: { answer: AnswerSerializer.new(@answer) }
    end

    def create 
        @answer = Answer.create(answer_params)
        if @answer.valid?
           render json: { answer: AnswerSerializer.new(@answer) }
          else
            render json: { error: @answer.errors.full_messages }, status: :not_acceptable
          end
        end

    def update 
        @answer = Answer.find(params[:id]) 
        # byebug
        @answer.update(answer_params)
        render json: @answer
    end

     

    def destroy
        @answer = Answer.find(params[:id])
        @answer.destroy
    end 

    private

    def answer_params
        params.require(:answer).permit(:answer, :like, :user_id, :question_id)
    end

end 

    

        