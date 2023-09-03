module NetPromoterScore

export nps

"Represents NPS category"
@enum NPSCategory promoter passive detractor

"""
    nps(x::Integer) -> NPSCategory

Return NPS category
"""
function nps(x::Integer)::NPSCategory
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

"""
    nps(arr::AbstractArray{Integer}) -> Float64

Calculate NPS score
"""
function nps(arr::AbstractArray{T})::Float64 where {T<:Integer}
    categories = map(nps, arr)
    return nps(categories)
end

"""
    nps(arr::AbstractArray{NPSCategory}) -> Float64

Calculate NPS score
"""
function nps(arr::AbstractArray{NPSCategory})::Float64
    n_promoter = 0
    n_passive = 0
    n_detractor = 0

    for x in arr
        if x == promoter
            n_promoter += 1
        elseif x == passive
            n_passive += 1
        else
            n_detractor += 1
        end
    end

    sample_size = n_promoter + n_passive + n_detractor
    return (n_promoter - n_detractor) / sample_size * 100
end

end
