recurrence_coefficient_alpha{T}(pol::HermitePolynomialSequence{T}, i) = T(0)
function recurrence_coefficient_beta{T}(pol::HermitePolynomialSequence{T}, i)
   i == 0 ? gamma(T(1)/2) : (T(1)/2)*i
end
