using Test
using LowDiscrepancySampling

@testset "hammersley_set basic functionality" begin
    # Test 2D, 5 points
    n, d = 5, 2
    pts = hammersley_set(n, d)
    @test size(pts) == (n, d)
    @test all(0 .<= pts .< 1)
    # First column should be uniform grid
    @test pts[:, 1] ≈ (0:(n-1)) ./ n

    # Test 3D, 4 points
    n, d = 4, 3
    pts = hammersley_set(n, d)
    @test size(pts) == (n, d)
    @test all(0 .<= pts .< 1)
    # First column: uniform grid
    @test pts[:, 1] ≈ (0:(n-1)) ./ n
    # Second column: radical inverse base 2
    expected_base2 = [0.0, 0.5, 0.25, 0.75]
    @test pts[:, 2] ≈ expected_base2
    # Third column: radical inverse base 3
    expected_base3 = [0.0, 1/3, 2/3, 1/9]
    @test isapprox.(pts[:, 3], expected_base3, atol=1e-8) |> all

    # Test error on d < 2
    @test_throws ArgumentError hammersley_set(10, 1)
end

@testset "hammersley_set edge cases" begin
    # Test n = 1, d = 2
    pts = hammersley_set(1, 2)
    @test size(pts) == (1, 2)
    @test pts[1, 1] == 0.0
    @test pts[1, 2] == 0.0

    # Test large d within prime list
    n, d = 3, 10
    pts = hammersley_set(n, d)
    @test size(pts) == (n, d)
    @test all(0 .<= pts .< 1)
end