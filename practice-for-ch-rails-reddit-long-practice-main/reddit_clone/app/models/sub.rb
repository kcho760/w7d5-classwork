class Sub < ApplicationRecord
    has_many :posts,
        foreign_key: :post_id,
        class_name: :Post

    has_one :moderator,
        foreign_key: :user_id,
        class_name: :User
end
