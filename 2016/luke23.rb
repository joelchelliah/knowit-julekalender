puts (3...250).inject([1,2,4]) { |Σ, i| Σ << Σ[i-3] + Σ[i-2] + Σ[i-1] }[-1]
