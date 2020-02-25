class Postcard < ApplicationRecord
  # model associations
  belongs_to :user

  # validations
  validates_presence_of :user_id,
                        :sent_to,
                        :sent_at,
                        :message,
                        :from_location,
                        :image_link
end
