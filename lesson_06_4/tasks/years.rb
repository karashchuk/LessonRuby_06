# https://gist.github.com/psylone/9c897e71cc5e70ae3f75#1-Модуль-определения-возраста

module CalculateYears

  SECONDS_IN_YEAR = 60 * 60 * 24 * 365


  def years_old
    seconds = Time.now - Time.new(*date.split('-'))
    seconds.fdiv(SECONDS_IN_YEAR).floor
  end
end

class User
  include CalculateYears

  def initialize name, date_of_birth
    @name          = name
    @date_of_birth = date_of_birth
  end

  def date
    @date_of_birth
  end
end

class Winery
  include CalculateYears

  def initialize title, date_of_foundation
    @title               = title
    @date_of_foundation  = date_of_foundation
  end

  def date
    @date_of_foundation
  end
end

p User.new('Julie', '1996-07-22').years_old # => 19
p Winery.new('A Light Drop', '1954-08-01').years_old # => 61
