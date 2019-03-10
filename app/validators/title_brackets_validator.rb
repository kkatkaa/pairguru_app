class TitleBracketsValidator < ActiveModel::Validator
  def validate(movie)
    if !movie_valid?(movie)
      movie.errors.add(:title, "brackets failure")
    end
  end

  private

  def movie_valid?(movie)
    brackets = { "(" => ")", "{" => "}", "[" => "]"} 
    stack = []
    left = brackets.keys
    right = brackets.values
    
    movie.title.each_char.with_index do |char, i|
    if left.include? char
      stack << char
    elsif right.include? char
      last_element = stack.last 
      if stack.empty? || (brackets[stack.pop] != char) || (movie.title[i-1] == last_element)
        return false
      end
    end
  end

  stack.empty?
  end
end