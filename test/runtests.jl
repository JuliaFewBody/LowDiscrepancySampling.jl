using LowDiscrepancySampling
using Test

@testset "LowDiscrepancySampling.jl" begin

include("test_Corput.jl")
include("test_Hammersley.jl")

end
