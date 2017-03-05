recurrence_coefficient_alpha(pol::LaguerrePolynomialSequence, i) =
  if i == 0
    pol.a+1
  else
    2*i + pol.a + 1
  end
recurrence_coefficient_beta(pol::LaguerrePolynomialSequence, i) =
  if i == 0
    gamma(pol.a+1)
  else
    i*(i+pol.a)
  end
