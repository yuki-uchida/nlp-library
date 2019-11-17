include("n_gram_parser.jl")
# using n_gram_parser
using Test
@test n_gram_parser.make_n_gram("I am a NLPer", "word", 2) == Any[["I","am"],["am","a"],["a","NLPer"]]

@test n_gram_parser.make_n_gram("I am a NLPer", "word", 3) == Any[["I","am","a"],["am","a","NLPer"]]

@test n_gram_parser.make_n_gram("I am a NLPer", "char", 2) == Any[["I","a"],["a","m"],["m","a"],["a","N"],["N","L"],["L","P"],["P","e"],["e","r"]]

@test n_gram_parser.make_n_gram("I am a NLPer", "char", 3) == Any[["I","a","m"],["a","m","a"],["m","a","N"],["a","N","L"],["N","L","P"],["L","P","e"],["P","e","r"]]



@test n_gram_parser.joint_str(Any[["I","am","a"],["am","a","NLPer"]]) == Any["Iama","amaNLPer"]
@test n_gram_parser.joint_str(Any[["p","a"],["a","r"],["r","a"]]) == Any["pa","ar","ra"]