function recurrence_coefficients(pol::OrthogonalPolynomialSequence, N::Int)
    @assert N >= 0
    a = zeros(N)
    b = zeros(N)
    for i in 1:N
        a[i] = recurrence_coefficient_alpha(pol, i-1)
        b[i] = recurrence_coefficient_beta(pol, i-1)
    end
    a,b
end

recurrence_coefficients(p::OrthogonalPolynomial) = recurrence_coefficients(p.ops, p.n)


immutable RecurrenceCoefficientAlpha{O,T <: Number}
  pol::O
  n::Int

  RecurrenceCoefficientAlpha(pol::OrthogonalPolynomialSequence{T},n) = new(pol,n)
end

RecurrenceCoefficientAlpha{T}(pol::OrthogonalPolynomialSequence{T}, n) = RecurrenceCoefficientAlpha{typeof(pol),T}(pol, n)



immutable RecurrenceCoefficientBeta{T <: Number} # OPQ.RecurrenceCoefficientAlpha{OPQ.HermitePolynomialSequence{Float64}}
  pol::OrthogonalPolynomialSequence{T} # OPQ.HermitePolynomialSequence{Float64}
  n::Int
end
Base.length(rc::RecurrenceCoefficientAlpha) = rc.n
Base.length(rc::RecurrenceCoefficientBeta) = rc.n
Base.eltype(rc::RecurrenceCoefficientAlpha) = eltype(rc.pol)
Base.eltype(rc::RecurrenceCoefficientBeta) = eltype(rc.pol)
Base.getindex(r::RecurrenceCoefficientAlpha, i::Int ) = recurrence_coefficient_alpha(r.pol, i)
Base.getindex(r::RecurrenceCoefficientBeta, i::Int ) = recurrence_coefficient_beta(r.pol, i)
