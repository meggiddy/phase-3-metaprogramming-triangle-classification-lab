class Triangle
  # write code here
  class TriangleError < StandardError
  end

  def initialize(height, width, hypotenus)
    @sides = [height, width, hypotenus].sort
    raise TriangleError, "Invalid sides" unless valid?
  end

  def kind
    case @sides.uniq.size
    when 1
      :equilateral
    when 2
      :isosceles
    else
      :scalene
    end
  end

  private

  def valid?
    @sides.all?(&:positive?) && @sides[0] + @sides[1] > @sides[2]
  end
end
