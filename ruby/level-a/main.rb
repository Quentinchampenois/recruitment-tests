class Test
  # fibo returns the fibonacci sequence for an integer passed as parameter
  # Params n: Integer
  # return Integer
  def fibo(n)
    if n == 1
        1
    elsif n < 1
        0
    else
        fibo(n - 1) + fibo(n - 2)
    end
  end
end