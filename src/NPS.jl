module NPS

export nps

@enum Category promoter passive detractor

function nps(x::Integer)::Category
    if 0 <= x <= 6
        return detractor
    elseif 7 <= x <= 8
        return passive
    elseif 9 <= x <= 10
        return promoter
    end

    err = DomainError(x, "`x` must be between 0 and 10")
    return throw(err)
end

end
