# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
       validates :user_id, :answer_choice_id, presence: true
       validate :not_duplicate_response, :not_authored_the_poll

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_one :question,
    through: :answer_choice,
    source: :question

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def not_duplicate_response
        if respondent_already_answered? 
             errors[:user_id] << 'user already responded to this question'
        end
    end

    def respondent_already_answered?
        sibling_responses.exists?(user_id: self.user_id)
    end

    def not_authored_the_poll
        if author_cant_respond_to_own_question? 
             errors[:user_id] << "user can't respond to own poll"
        end
    end

    def author_cant_respond_to_own_question?
        var = self.question.poll.user_id
        var.nil? ? false : true
    end


end
