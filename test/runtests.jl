using NPS
using Test

@testset "all" begin
    @testset "Integer" begin
        @test nps(0) == NPS.detractor
        @test nps(6) == NPS.detractor
        @test nps(7) == NPS.passive
        @test nps(8) == NPS.passive
        @test nps(9) == NPS.promoter
        @test nps(10) == NPS.promoter
        @test_throws DomainError nps(-1)
    end

    @testset "AbstractArray{Integer}" begin
        @test nps([0, 9]) == 0.0
        @test nps([7, 8, 9]) == 1 / 3 * 100
    end

    @testset "AbstractArray{NPSCategory}" begin
        @test nps([NPS.detractor, NPS.promoter]) == 0.0
    end
end
