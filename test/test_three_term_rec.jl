include("../src/OPQ.jl")
import OPQ.OrthogonalPolynomial
import OPQ.three_term_recurrence

function test_three_term_rec(xvals, pol::OrthogonalPolynomial)
  result = zeros(length(xvals))
  for k in 1:length(xvals)
    result[k] = three_term_recurrence(pol, x[k])
  end
  result
end

function test_three_term_rec_array(xvals, pol::OrthogonalPolynomial)
  result = zeros(length(xvals))
  for k in 1:length(xvals)
    result[k] = three_term_recurrence_array(pol, x[k])
  end
  result
end

function test_three_term_rec(xvals, pol::OrthogonalPolynomial)
  result = zeros(length(xvals))
  for k in 1:length(xvals)
    result[k] = three_term_recurrence(pol, x[k])
  end
  result
end

function test_TTR(n, k)
  time = 0
  for i = 1:n
    a = rand(k) .* (20) .+ (-10)
    b = rand(k) .* (20) .+ (-10)
    x = 10 * rand() - 5
    tic()
    y = three_term_recurrence(a,b,x)
    time = time + toq()
  end
  time/n
end
