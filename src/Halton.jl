"""
    corput(n::Int, b::Int=2)

Computes the n-th number in the van der Corput sequence in base `b`
using digit reversal. Follows the standard definition:
    qₙ = ∑ dₖ(n) * b^(-k-1)
"""
function corput(n::Int, b::Int=2)
    q = 0.0
    f = 1.0 / b
    while n > 0
        n, d = divrem(n, b)
        q += d * f
        f /= b
    end
    return q
end

"""
halton(n::Int, d::Int)

Generates the nth Halton sequence vector in `d` dimensions.
"""
function halton(n::Int, d::Int)
    base = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281]
    @assert d <= length(base) "Dimension exceeds available bases."
    return [corput(n, base[i]) for i in 1:d]
end