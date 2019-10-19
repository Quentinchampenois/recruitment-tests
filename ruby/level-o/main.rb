class Test
  def smallest_or_highest(arr, sort)
      if sort == "min"
          p arr.min
      elsif sort == "max"
          p arr.max
      else
          p arr
      end
    end
end
