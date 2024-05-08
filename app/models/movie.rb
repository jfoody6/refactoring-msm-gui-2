# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)
  
  belongs_to(:director)
  has_many(:characters, class_name: "Character", foreign_key: "movie_id")
  has_many(:actors, through: :characters, source: :actor)

  # def characters
  #   key = self.id
  #   the_many = Character.where( {:movie_id => key })
  #   return the_many
  # end
end
