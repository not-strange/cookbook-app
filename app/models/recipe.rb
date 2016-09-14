class Recipe < ApplicationRecord
  belongs_to :user

  def ingredients_list
    list = []
    ingredients.split(', ').each do |ingredient|
      list << ingredient.upcase
    end
    list
  end

  def directions_list
    directions.split(', ')
  end

  def friendly_updated_at
    updated_at.strftime('%b %d, %Y')
  end

  def friendly_prep_time
    message = ""
    hours = prep_time / 60
    minutes = prep_time % 60

    message += "#{hours} #{'Hour'.pluralize(hours)}" if hours > 0
    message += ", " if hours > 0 && minutes > 0
    message += "#{minutes} #{'Minute'.pluralize(minutes)}" if minutes > 0

    message
  end

  def chef
    user.name
  end
end




