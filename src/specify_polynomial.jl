function specify_polynomial_sequence(ops::JacobiPolynomialSequence)
  if (ops.a == ops.b)
    if (ops.a == -1/2)
      FirstChebyshevPolynomialSequence{eltype(ops)}()
    elseif (ops.a == 1/2)
      SecondChebyshevPolynomialSequence{eltype(ops)}()
    elseif (ops.a == 0)
      LegendrePolynomialSequence{eltype(ops)}()
    else
      GegenbauerPolynomialSequence{eltype(ops)}(ops.a)
    end
  else
    ops
  end
end

function specify_polynomial_sequence(ops::GegenbauerPolynomialSequence)
  if (ops.a == -1/2)
    FirstChebyshevPolynomialSequence{eltype(ops)}()
  elseif (ops.a == 1/2)
    SecondChebyshevPolynomialSequence{eltype(ops)}()
  elseif (ops.a == 0)
    LegendrePolynomialSequence{eltype(ops)}()
  else
    ops
  end
end

specify_polynomial(pol::OrthogonalPolynomial) = OrthogonalPolynomial(specify_polynomial_sequence(pol.ops),pol.n)
