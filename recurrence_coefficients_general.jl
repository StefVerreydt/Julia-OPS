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
