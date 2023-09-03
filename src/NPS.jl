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

function nps(arr::AbstractArray{T})::Float64 where {T<:Integer}
    n_promoter = 0
    n_passive = 0
    n_detractor = 0

    for x in arr
        category = nps(x)

        if category == promoter
            n_promoter += 1
        elseif category == passive
            n_passive += 1
        else
            n_detractor += 1
        end
    end

    sample_size = n_promoter + n_passive + n_detractor
    return (n_promoter - n_detractor) / sample_size * 100
end

end
