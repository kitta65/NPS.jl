using NPS
using Test

@testset "all" begin
    @test nps(0) == NPS.detractor
    @test nps(6) == NPS.detractor
    @test nps(7) == NPS.passive
    @test nps(8) == NPS.passive
    @test nps(9) == NPS.promoter
    @test nps(10) == NPS.promoter
end
