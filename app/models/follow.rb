class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, foreign_key: :follow_uesr_id, primary_key: :user_id
end
