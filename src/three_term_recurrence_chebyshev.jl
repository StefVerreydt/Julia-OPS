function three_term_recurrence(ops::FirstChebyshevPolynomialSequence, n::Int, x::Number)

  if n == 0
    1
  elseif n == 1
    x
  else
    cos(*(n,acos(x)))
  end
end

# https://books.google.be/books?id=fZyqWPNjx4AC&pg=PA60&lpg=PA60&dq=Tk(x)+%3D+cos(kcos-1(x))&source=bl&ots=Ka-vMvb63m&sig=HOns3lM_xdRZFQWnQ8vlV4S9rnA&hl=nl&sa=X&ved=0ahUKEwj2v8m-opLTAhWCtBoKHWQ7BKIQ6AEIKDAB#v=onepage&q=Tk(x)%20%3D%20cos(kcos-1(x))&f=false
