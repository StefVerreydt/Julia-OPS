recurrence_coefficient_alpha{T}(pol::HermitePolynomialSequence{T}, i) = T(0)

function recurrence_coefficient_beta(pol::HermitePolynomialSequence, i)
  T = eltype(pol)
  i == 0 ? gamma(T(1)/2) : (T(1)/2)*i
end

#recurrence_coefficients(ops::HermitePolynomialSequence, N) =
#  (RecurrenceCoefficientAlpha(ops, N), RecurrenceCoefficientBeta(ops, N))
