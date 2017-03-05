recurrence_coefficient_alpha(pol::HermitePolynomialSequence, i) = 0
function recurrence_coefficient_beta(pol::HermitePolynomialSequence, i)
   i == 0 ? gamma(1/2) : (1/2)*i
end

## Hoe OPSWithPrecision hierin verwerken?
## -> HermitePolynomialSequenceWithPrecision ?
## -> function recurrence_coefficient_alpha(OPSWP::OPSWithPrecision, i)
##      recurrence_coefficient_alpha(OPSWP.ops, i, OPSWP.typeIndicator)
##    end
