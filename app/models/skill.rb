class Skill < ActiveRecord::Base
    belongs_to :user

    # a skill belongs to a user
    def user
        # self is the skill instance
        User.find(self.user_id)
    end


end