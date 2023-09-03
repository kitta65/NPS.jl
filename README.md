# NPS.jl

NPS.jl is a simple package to calculate [NPS](https://en.wikipedia.org/wiki/Net_promoter_score) (Net Promoter Score).


## Install

```sh
julia -e 'using Pkg; Pkg.add("NPS")'
```

## Example

```julia
using NPS

nps(0) # NPS.detractor
nps([0, 7, 9]) # 0.0
nps([NPS.passive, NPS.promoter]) # 50.0
```
