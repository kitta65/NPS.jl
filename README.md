# NetPromoterScore.jl

NetPromoterScore.jl is a simple package to calculate [NPS](https://en.wikipedia.org/wiki/Net_promoter_score).


## Install

```sh
julia -e 'using Pkg; Pkg.add("NetPromoterScore")'
```

## Example

```julia
using NetPromoterScore

nps(0) # NetPromoterScore.detractor
nps([0, 7, 9]) # 0.0
nps([NetPromoterScore.passive, NetPromoterScore.promoter]) # 50.0
```
