recurrence_coefficient_alpha(pol::JacobiPolynomialSequence, i) =
  if i == 0
    (pol.b-pol.a)/(pol.a+pol.b+2)
  else
    (pol.b^2-pol.a^2)/((2*i+pol.a+pol.b).*((2*i+pol.a+pol.b)+2))
  end
recurrence_coefficient_beta(pol::JacobiPolynomialSequence, i) =
  if i == 0
    2^(pol.a+pol.b+1)*gamma(pol.a+1)*gamma(pol.b+1)/gamma(pol.a+pol.b+2)
  else
    4*(i+pol.a).*(i+pol.b).*i.*(i+pol.a+pol.b)./(((2*i+pol.a+pol.b).^2).*((2*i+pol.a+pol.b)+1).*((2*i+pol.a+pol.b)-1))
  end
