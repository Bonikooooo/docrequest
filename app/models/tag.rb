class Tag < ApplicationRecord
    has_many :request_tags
    has_many :requests, through: :request_tags
end
