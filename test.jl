function test_three_term_rec(xvals, pol::OrthogonalPolynomial)
  result = zeros(length(xvals))
  for k in 1:length(xvals)
    result[k] = three_term_recurrence(pol, x[k])
  end
  result
end

function test_three_term_rec(xvals, pol::OrthogonalPolynomial)
  result = zeros(length(xvals))
  for k in 1:length(xvals)
    result[k] = three_term_recurrence_array(pol, x[k])
  end
  result
end
