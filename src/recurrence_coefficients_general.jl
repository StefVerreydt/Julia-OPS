function recurrence_coefficients(ops::OrthogonalPolynomialSequence, N)
    @assert N >= 0
    a = zeros(N)
    b = zeros(N)
    for i in 1:N
        a[i] = recurrence_coefficient_alpha(ops, i-1)
        b[i] = recurrence_coefficient_beta(ops, i-1)
    end
    a,b
end

recurrence_coefficients(pol::OrthogonalPolynomial) = recurrence_coefficients(p.ops, p.n)

immutable RecurrenceCoefficientAlpha{O <: OrthogonalPolynomialSequence}
  ops::O
  n::Int
end


immutable RecurrenceCoefficientBeta{O <: OrthogonalPolynomialSequence}
  ops::O
  n::Int
end

#Make RecurrenceCoefficientAlpha and -Beta iterable:
Base.start(rec::RecurrenceCoefficientAlpha) = 1
Base.next(rec::RecurrenceCoefficientAlpha, n::Int) = getindex(rec,n) , n+1
Base.done(rec::RecurrenceCoefficientAlpha, n::Int) = n == rec.n

Base.start(rec::RecurrenceCoefficientBeta) = 1
Base.next(rec::RecurrenceCoefficientBeta, n::Int) = getindex(rec,n) , n+1
Base.done(rec::RecurrenceCoefficientBeta, n::Int) = n == rec.n



Base.length(rc::RecurrenceCoefficientAlpha) = rc.n
Base.length(rc::RecurrenceCoefficientBeta) = rc.n
Base.eltype(rc::RecurrenceCoefficientAlpha) = eltype(rc.ops)
Base.eltype(rc::RecurrenceCoefficientBeta) = eltype(rc.ops)
Base.getindex(r::RecurrenceCoefficientAlpha, i) = recurrence_coefficient_alpha(r.ops, i)
Base.getindex(r::RecurrenceCoefficientBeta, i) = recurrence_coefficient_beta(r.ops, i)
