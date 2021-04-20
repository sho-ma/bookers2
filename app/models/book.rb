class Book < ApplicationRecord

  belongs_to :user, optional: true

    validates:title, presence:true
    validates:opinion, {presence: true, length: {maximum:200}}
end
