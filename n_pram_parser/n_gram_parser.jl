
module n_gram_parser
    export make_n_gram
        function make_n_gram(text::String, parse = "char"::String, n = 2::Int)
    """ charとwordはオプションで指定する"""
    if parse == "char"
        split_list = split(text, r"", keepempty = false)
        filter!(e->e ≠ " ", split_list)
    elseif parse == "word"
        split_list = split(text, " ", keepempty = false)
    else
        throw("set char/word parse")
        return
    end
    """ 先に行列の宣言をする """
    n_gram_list = []
    """ for文を回して、n-gram_unitを作る処理を繰り返す """
    """ n-gramはn個のの単語を後ろから取るようにする。なので(n-1)番目までで良い """
    for i = 1:length(split_list) - (n - 1)
        """ n-gramの単位行列を作るための宣言をする """
        """ n語取り出して入れ込む """
        n_gram_unit_list = [String(split_list[i + j - 1]) for j in 1:n]
        """ 先に宣言した行列に値を入れ込む """
        n_gram_list = append!(n_gram_list, [n_gram_unit_list])
    end
    """ returnでn-gramの行列を返す """
    return n_gram_list
end
end
