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

function thee_term_recurrence_array(pol::OrthogonalPolynomial, x::Number)
  a,b = recurrence_coefficients(pol.ops, pol.n)
  three_term_recurrence(a,b,x)
end

function three_term_recurrence(pol::OrthogonalPolynomial, x::Number)
  a = RecurrenceCoefficientAlpha(pol.ops, pol.n)
  b = RecurrenceCoefficientBeta(pol.ops, pol.n)
  three_term_recurrence(a,b,x)
end

function thee_term_recurrence_array(ops::OrthogonalPolynomialSequence, n::Int, x::Number)
  a,b = recurrence_coefficients(pol.ops, n)
  three_term_recurrence(a,b,x)
end

function three_term_recurrence(ops::OrthogonalPolynomialSequence, n::Int, x::Number)
  a = RecurrenceCoefficientAlpha(ops, pol.n)
  b = RecurrenceCoefficientBeta(ops, pol.n)
  three_term_recurrence(a,b,x)
end
