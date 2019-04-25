# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
       validates :text, :poll_id, presence: true

    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :AnswerChoice
    
    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll

    has_many :responses,
        through: :answer_choices,
        source: :responses

    def results_n_plus_one
        answer_choices = self.answer_choices
        result = {}
        answer_choices.each do |choice|
            result[choice.text] = choice.responses.count
        end
        result
    end

    def results
        results = {}
        ans_choices = self.answer_choices
            .select('answer_choices.*', 'COUNT(*) AS response_count')
            .left_outer_joins(:responses)
            .group(:id)
        ans_choices.each do |choice|
            results[choice.text] = choice.response_count
        end
        results
    end

    
end
