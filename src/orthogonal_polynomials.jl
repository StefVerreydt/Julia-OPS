import Base.eltype

abstract OrthogonalPolynomialSequence{T}

typealias OPS OrthogonalPolynomialSequence

function eltype{T}(pol::OrthogonalPolynomialSequence{T})
  T
end

# The monic generalized Hermite polynomials.
# These are orthogonal on [-Inf,Inf]
# relative to the weight function w(t)=|t|exp(-t^2).
immutable HermitePolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
end


HermitePolynomialSequence() = HermitePolynomialSequence{Float64}()

# The monic Jacobi polynomials with parameters
# a and b. These are orthogonal on [-1,1] relative to the
# weight function w(t)=(1-t)^a(1+t)^b.
immutable JacobiPolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
  a :: T
  b :: T
  function JacobiPolynomialSequence(a, b)
      @assert a >= -1
      @assert b >= -1
      new(a,b)
  end
end

JacobiPolynomialSequence(a, b) = JacobiPolynomialSequence(promote(a,b)...)

JacobiPolynomialSequence{T}(a::T, b::T) = JacobiPolynomialSequence{T}(a,b)

# The monic Gegenbauer polynomials with parameter a.
# These are orthogonal on [-1,1] relative to the
# weight function w(t)=(1-t^2)^(a-1/2)
immutable GegenbauerPolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
  a::T
end

immutable FirstChebyshevPolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
end

immutable SecondChebyshevPolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
end

# weight function 1
immutable LegendrePolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
end

# The monic generalized Laguerre polynomials
# with parameter a. These are orthogonal on [0,Inf] relative
# to the weight function w(t)=t^a exp(-t).
immutable LaguerrePolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
  a :: T
end


immutable OrthogonalPolynomial{T <: Number}
    ops ::  OrthogonalPolynomialSequence{T}
    n   ::  Int64

    function OrthogonalPolynomial(ops, n)
        @assert n >= 0
        new(ops, n)
    end
end

OrthogonalPolynomial{T}(ops::OrthogonalPolynomialSequence{T}, n::Int64) = OrthogonalPolynomial{T}(ops,n)

Base.getindex(ops::OrthogonalPolynomialSequence, n) = OrthogonalPolynomial(ops, n)
