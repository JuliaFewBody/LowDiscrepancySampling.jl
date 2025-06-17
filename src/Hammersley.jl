export hammersley_set

"""
hammersley_set(n, d)

Generate the Hammersley point set of `n` points in `d` dimensions.
The first dimension is a uniform grid, the remaining dimensions use the radical inverse with different bases.

# Arguments
- `n::Int`: Number of points
- `d::Int`: Number of dimensions (d >= 2)

# Returns
- `Array{Float64,2}`: n x d matrix of points
"""
function hammersley_set(n::Int, d::Int)
    if d < 2
        throw(ArgumentError("Hammersley set requires at least 2 dimensions"))
    end
    # First dimension: uniform grid
    points = zeros(n, d)
    for i in 1:n
        points[i, 1] = (i - 1) / n
    end
    for j in 2:d
        base = primes(j - 1)
        for i in 1:n
            points[i, j] = radical_inverse(i - 1, base)
        end
    end
    return points
end

function radical_inverse(i::Int, base::Int)
    inv = 0.0
    f = 1.0 / base
    while i > 0
        inv += (i % base) * f
        i = div(i, base)
        f /= base
    end
    return inv
end

function primes(k::Int)
    prime_list = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]
    if k < 1 || k > length(prime_list)
        throw(ArgumentError("Prime index out of range (1-$(length(prime_list)))"))
    end
    return prime_list[k]
end
