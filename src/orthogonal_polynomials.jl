import Base.eltype

abstract OrthogonalPolynomialSequence{T}

typealias OPS OrthogonalPolynomialSequence

eltype{T}(pol::OrthogonalPolynomialSequence{T}) = T

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

function GegenbauerPolynomialSequence{T <: Number}(jac::JacobiPolynomialSequence{T})
  @assert jac.a == jac.b
  GegenbauerPolynomialSequence(jac.a)
end

# a=b=-1/2
immutable FirstChebyshevPolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
end

FirstChebyshevPolynomialSequence() = FirstChebyshevPolynomialSequence{Float64}()

# a=b=1/2
immutable SecondChebyshevPolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
end

SecondChebyshevPolynomialSequence() = SecondChebyshevPolynomialSequence{Float64}()

# weight function 1
immutable LegendrePolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
end

LegendrePolynomialSequence() = LegendrePolynomialSequence{Float64}()

# The monic generalized Laguerre polynomials
# with parameter a. These are orthogonal on [0,Inf] relative
# to the weight function w(t)=t^a exp(-t).
immutable LaguerrePolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence{T}
  a :: T
end


immutable OrthogonalPolynomial{O<: OrthogonalPolynomialSequence}
    ops ::  O
    n   ::  Int

    function OrthogonalPolynomial(ops, n)
        @assert n >= 0
        new(ops, n)
    end
end

OrthogonalPolynomial(ops::OrthogonalPolynomialSequence, n) = OrthogonalPolynomial{typeof(ops)}(ops,n)

Base.getindex(ops::OrthogonalPolynomialSequence, n) = OrthogonalPolynomial(ops, n)

eltype(pol::OrthogonalPolynomial) = eltype(pol.ops)
