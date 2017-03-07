function three_term_recurrence(a, b, x::Number)
  T = eltype(a)
  pkm2 = zero(T)
  pkm1 = one(T)
  pk = one(T)
  for k = 1:length(a)
    pk = (x-a[k]) * pkm1 - b[k]*pkm2
    pkm2 = pkm1
    pkm1 = pk
  end
  pk
end

function thee_term_recurrence(pol::OrthogonalPolynomial, x::Number)
  a,b = recurrence_coefficients(pol.ops, pol.n)
  three_term_recurrence(a,b,x)
end
