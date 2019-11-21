class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :category, :answers
end
