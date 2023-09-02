using NPS
using Test

@testset "all" begin
    @test 1 == 1
    @test NPS.greet() == "Hello World!"
end
