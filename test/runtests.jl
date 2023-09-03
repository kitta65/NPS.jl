using NetPromoterScore
using Test

@testset "all" begin
    @testset "Integer" begin
        @test nps(0) == NetPromoterScore.detractor
        @test nps(6) == NetPromoterScore.detractor
        @test nps(7) == NetPromoterScore.passive
        @test nps(8) == NetPromoterScore.passive
        @test nps(9) == NetPromoterScore.promoter
        @test nps(10) == NetPromoterScore.promoter
        @test_throws DomainError nps(-1)
    end

    @testset "AbstractArray{Integer}" begin
        @test nps([0, 9]) == 0.0
        @test nps([7, 8, 9]) == 1 / 3 * 100
    end

    @testset "AbstractArray{NPSCategory}" begin
        @test nps([NetPromoterScore.detractor, NetPromoterScore.promoter]) == 0.0
    end
end
