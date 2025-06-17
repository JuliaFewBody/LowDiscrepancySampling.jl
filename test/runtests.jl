using LowDiscrepancySampling
using Test

@testset "LowDiscrepancySampling.jl" begin

include("test_Halton.jl")
include("test_Hammersley.jl")

end
