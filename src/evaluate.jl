function evaluate(ops::OrthogonalPolynomialSequence, n::Int, x::Number)
  a = RecurrenceCoefficientAlpha(ops, n)
  b = RecurrenceCoefficientBeta(ops, n)
  three_term_recurrence(a,b,x)
end

function evaluate(pol::OrthogonalPolynomial, x::Number)
  a = RecurrenceCoefficientAlpha(pol.ops, pol.n)
  b = RecurrenceCoefficientBeta(pol.ops, pol.n)
  three_term_recurrence(a,b,x)
end
