function recurrence_coefficient_alpha(pol::LaguerrePolynomialSequence, i)
  T = eltype(pol)
  if i == 0
    T(pol.a+1)
  else
    T(2*i + pol.a + 1)
  end
end
function recurrence_coefficient_beta(pol::LaguerrePolynomialSequence, i)
  if i == 0
    gamma(pol.a+1)
  else
    i*(i+pol.a)
  end
end
