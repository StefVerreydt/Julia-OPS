function three_term_recurrence(a, b, x::Number)
  T = eltype(a)
  pkm2 = zero(T)
  pkm1 = one(T)
  pk = one(T)
  for k = 1:length(a)
    pk = (x-a[k]) * zkm1 - b[k]*zkm2
    pkm2 = zkm1
    pkm1 = zkm
  end
  zkm
end

function thee_term_recurrence(pol::OrthogonalPolynomial, x::Number)
  a,b = recurrence_coefficients(pol.ops, pol.n)
  three_term_recurrence(a,b,x)
end
