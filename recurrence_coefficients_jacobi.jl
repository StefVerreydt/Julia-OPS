function recurrence_coefficient_alpha(pol::JacobiPolynomialSequence, i)
  T = eltype(pol)
  if i == 0
    T((pol.b-pol.a)/(pol.a+pol.b+2))
  else
    T((pol.b^2-pol.a^2)/((2*i+pol.a+pol.b).*((2*i+pol.a+pol.b)+2)))
  end
end
function recurrence_coefficient_beta(pol::JacobiPolynomialSequence, i)
  T = eltype(pol)
  if i == 0
    T(2^(pol.a+pol.b+1)*gamma(pol.a+1)*gamma(pol.b+1)/gamma(pol.a+pol.b+2))
  else
    T(4*(i+pol.a).*(i+pol.b).*i.*(i+pol.a+pol.b)./(((2*i+pol.a+pol.b).^2).*((2*i+pol.a+pol.b)+1).*((2*i+pol.a+pol.b)-1)))
  end
end
