### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 7c2bbd9f-f64d-445a-8f02-a2b28d3c7a49
module B
	include("t1.jl")
	using .A

	function main()
		s = A.soma(2, 3)
		println(s)
	end
	main()
end


# ╔═╡ 228b7e2a-52ce-412a-9a91-b17d6045fdec
begin
	using LinearAlgebra
	Symmetric(rand(0:9, 5, 5))
end

# ╔═╡ 01039489-74e4-4641-ba81-6b3b2c1aeee3
using Genie

# ╔═╡ 43e4bb10-553d-411a-816f-5457da2c65bf
using CSV

# ╔═╡ 8b095784-1b7d-45ed-b59f-c226a272c4e3
using CategoricalArrays

# ╔═╡ e9ad49c0-ceb6-4315-ad84-1bcc019cd128
using DataFramesMeta

# ╔═╡ 1393e9ac-f584-11ec-2e80-eb23799e9841
md"""#### Fill an empty array (Vector of vectors) in Julia using for loop
  """

# ╔═╡ cefc6a6f-ede3-49fb-b377-66b62ff75f27
a = [[2,3,7],[7,2,7],[2,3,9]];

# ╔═╡ 65184293-4388-44bf-a71d-3283f845a08f
a

# ╔═╡ 14fd9102-f353-4d7e-a8de-f145671bafa7
b = enumerate(a) |> 
		collect .|>
 		collect

# ╔═╡ 07f971b0-bf01-4d7d-9abe-80ea6545732c
md"""#### How to identify different members?
"""

# ╔═╡ b8ced4fa-bfa2-43a1-acd0-56d59d9d6bee
begin
	t1 = [(1,2,3), (1,2,4),(2,5,1),(2,5,2)]
	t2 = [(1,2,3), (1,2,8),(2,5,1),(2,5,2)]
end

# ╔═╡ 512c3296-652c-4f04-bf5a-00fa436cdbb3
filter(∉(t1),t2)

# ╔═╡ 13176606-97c1-402c-ab81-812a4d529c20
 setdiff(t2, t1)

# ╔═╡ 32b9bc9c-9dd7-4f6a-8304-c912e307d9b0
md"""#### How to use function that belongs to module 1 inside module 2
"""

# ╔═╡ dffea70a-5bf1-4434-8b09-70e9ee44a6b4
md""" #### Julia: sort two arrays (like lexsort in numpy)
"""

# ╔═╡ b7f18dff-1156-4421-a0c7-199be6aa73e8
begin
	a1 = Vector([1,1,1,2,2,2])
	b1 = Vector([10,8,11,4,8,0])
end

# ╔═╡ 296b7ed2-a5c3-4e5a-a68d-6c1bf103d1cb
begin
	using StructArrays
	sort!(StructArray((a1, b1)))
end

# ╔═╡ 3747ea77-5cf0-4e4b-9d8c-6d38507de488
begin
	using DataFrames
	sortperm(DataFrame(a1=a1,b1=b1, copycols=false))
end

# ╔═╡ 44094652-2ced-4ae1-a36f-484a0d7602a5
md"""#### Renaming multiple columns in Julia DataFrames
"""

# ╔═╡ 0a41b11c-8170-419d-b9fd-b6327c201142
begin
	data_test = DataFrame(Time = 1:2, X1 = [0,1], X2 = [10,5])
	technology = ["oil", "gas"]
end

# ╔═╡ 29e45022-6648-4aae-8455-fbc0fc4d7789
#rename!(data_test, ["X$i"=> tech for (i, tech) in enumerate(technology)])

# ╔═╡ f632bab1-b981-4cc3-8626-5c26f5726211
rename!(data_test, :X1 => "oil", :X2 => "gas")

# ╔═╡ 8a586046-6cae-464c-927a-c2aaf890d3aa
data_test

# ╔═╡ f6ea795f-2cd6-43f6-8dd3-9f657999c22e
md"""#### How to generate symmetric matrices in Julia?
"""

# ╔═╡ 049c7d05-c840-459b-8e8e-1e6e59080522
rand(0:9, 5, 5)

# ╔═╡ 30f9072e-81a2-4110-9c2d-d38fc4154e71
md"""#### Julia set data from DataFrames to JSON
"""

# ╔═╡ 34657e9f-a158-4df4-8477-4418cb0c784c
df = DataFrame(a=[1, 2, 3], b=[11, 12, 13])

# ╔═╡ 5dbf1435-3265-469e-991c-b59880f07987
Genie.Renderer.Json.json(Dict("alldata" => "columns" => Vector.(eachrow(df))))

# ╔═╡ e7bbc58f-ab77-40af-8cc1-d7d3d94b07eb
Genie.Renderer.Json.json(Dict("alldata" => "columns" => copy.(eachrow(df))))

# ╔═╡ bfc17efe-7aa8-4dbe-9115-32611c6322fd
md"""#### How to index a dataframe with a user-defined string?
"""

# ╔═╡ 9e4f5013-535e-4003-99c7-72633a25c537
filenm = "/Users/arunk/Downloads/Data.csv"

# ╔═╡ 500e6075-cfe7-4a82-943a-678350d5e918
dat = DataFrame(CSV.File(filenm, delim = ","))

# ╔═╡ 7012738e-7028-4755-bc11-c143d34a40dd
str1 = "Salary"

# ╔═╡ aa8d34d1-56ec-49e4-879e-a47474866894
dat[:,str1]

# ╔═╡ c91b93fb-b392-4fb6-8374-552a018a150c
dat[!, str1]

# ╔═╡ 3816d07e-36db-4135-a17e-e40db1431f61
md"""#### Julia BitArray with UInt128
"""

# ╔═╡ 5d7b2842-ad04-40c3-8fc2-e6bfbc08272c
bnew = BitArray(undef, 5, 5, 5)

# ╔═╡ d6426a5a-1ccf-49e3-bce6-3a1060f7d974
bnew .= 0

# ╔═╡ 058051c9-fece-400a-809d-7b5e7861fcac
bnew[3, 2, 2] = 1

# ╔═╡ 57984a11-607d-48ed-97ce-cc5a8d44511f
bnew[3, :, :]

# ╔═╡ f1abacdc-e692-4e09-a614-71da815551a7
md"""#### Is there as.factor analogue in Julia?
"""

# ╔═╡ f3d13963-3c5e-472f-a509-b2448f622f36
df1 = DataFrame(a = 1:3, b = 'a':'c')

# ╔═╡ 341d3c0c-7710-4dc6-815a-8f9714adadc4
@transform(df1, :b = categorical(:b))

# ╔═╡ ffba5c41-9f67-4c1d-9274-97d33e7e307c
md"""#### Replacing a column in a DF from another DF in Julia
"""

# ╔═╡ 7e69c530-9633-44c0-8cdf-53d9b3a8dd01
df1new = DataFrame(id=["a", "a", "a", "b", "b", "b", "c", "c", "c", "d", "d"],
    var=[1, 32, 3, 22, 5, 4, 6, 7, 8, 4, 3])

# ╔═╡ 3a9b2f63-e659-499b-aa86-cddba100b6d9
df2new = DataFrame(id=["a", "a", "b", "b", "b", "c", "c", "c"],
    var=[1, 1, 2, 2, 2, 6, 6, 6])

# ╔═╡ 62629221-1df5-4f69-9462-0f563db7d3bc
leftjoin!(df1new, unique(df2new, :id), on = :id, makeunique = true)

# ╔═╡ ceb9909f-bef3-4009-acdd-a93779708d35
select!(df1new, :id, [:var_1, :var] => ByRow(coalesce) => :var)

# ╔═╡ df5d9f48-7242-4f50-afba-b02491c2c593
md"""#### Performance of the splat operator when accessing a matrix
"""

# ╔═╡ 07efaef5-5cc2-4c21-8980-d018dc1d8e95
matrix = Matrix{Float64}(undef, 5000, 4000)

# ╔═╡ 97750c76-419c-425f-b5b4-89b2c0fb9b34
point = [1244, 3353]

# ╔═╡ df7e4997-3343-4116-bcdb-940ae50acd91
matrix[point...]

# ╔═╡ 966925d3-fcce-4406-bfa9-9700fc88a8dd


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
CategoricalArrays = "324d7699-5711-5eae-9e2f-1d82baa6b597"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
DataFramesMeta = "1313f7d8-7da2-5740-9ea0-a2ca25f37964"
Genie = "c43c736e-a2d1-11e8-161f-af95117fbd1e"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
StructArrays = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"

[compat]
CSV = "~0.10.4"
CategoricalArrays = "~0.10.6"
DataFrames = "~1.3.4"
DataFramesMeta = "~0.11.0"
Genie = "~4.18.1"
StructArrays = "~0.6.11"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "af92965fb30777147966f58acb05da51c5616b5f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.3"

[[deps.ArgParse]]
deps = ["Logging", "TextWrap"]
git-tree-sha1 = "3102bce13da501c9104df33549f511cd25264d7d"
uuid = "c7e460c6-2fb9-53a9-8c5b-16f535851c63"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CSTParser]]
deps = ["Tokenize"]
git-tree-sha1 = "b66abc140f8b90a1d6bc7bfad5c80070f8c1ddc6"
uuid = "00ebfdb7-1f24-5e51-bd34-a7502290713f"
version = "3.3.3"

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings"]
git-tree-sha1 = "873fb188a4b9d76549b81465b1f75c82aaf59238"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.4"

[[deps.CategoricalArrays]]
deps = ["DataAPI", "Future", "Missings", "Printf", "Requires", "Statistics", "Unicode"]
git-tree-sha1 = "5f5a975d996026a8dd877c35fe26a7b8179c02ba"
uuid = "324d7699-5711-5eae-9e2f-1d82baa6b597"
version = "0.10.6"

[[deps.Chain]]
git-tree-sha1 = "339237319ef4712e6e5df7758d0bccddf5c237d9"
uuid = "8be319e6-bccf-4806-a6f7-6fae938471bc"
version = "0.4.10"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "6d4fa04343a7fc9f9cb9cff9558929f3d2752717"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.0.9"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "4cd7063c9bdebdbd55ede1af70f3c2f48fab4215"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.6"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "9be8be1d8a6f44b96482c8af52238ea7987da3e3"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.45.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "fb5f5316dd3fd4c5e7c30a24d50643b73e37cd40"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.10.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "daa21eb85147f72e41f6352a57fccea377e310a9"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.3.4"

[[deps.DataFramesMeta]]
deps = ["Chain", "DataFrames", "MacroTools", "OrderedCollections", "Reexport"]
git-tree-sha1 = "f1d89a07475dc4b03c08543d1c6b4b2945f33eca"
uuid = "1313f7d8-7da2-5740-9ea0-a2ca25f37964"
version = "0.11.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.EzXML]]
deps = ["Printf", "XML2_jll"]
git-tree-sha1 = "0fa3b52a04a4e210aeb1626def9c90df3ae65268"
uuid = "8f5d6c58-4d21-5cfd-889c-e3ad7ee6a615"
version = "1.1.0"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "129b104185df66e408edd6625d480b7f9e9823a0"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.18"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GMP_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "781609d7-10c4-51f6-84f2-b8444358ff6d"

[[deps.Genie]]
deps = ["ArgParse", "Dates", "Distributed", "EzXML", "FilePathsBase", "HTTP", "HttpCommon", "Inflector", "JSON3", "JuliaFormatter", "Logging", "Markdown", "MbedTLS", "Millboard", "Nettle", "OrderedCollections", "Pkg", "REPL", "Random", "Reexport", "Revise", "SHA", "Serialization", "Sockets", "UUIDs", "Unicode", "VersionCheck", "YAML"]
git-tree-sha1 = "c3fa75b1f98dbe5f36c55f5e474171ec2fd2c3fc"
uuid = "c43c736e-a2d1-11e8-161f-af95117fbd1e"
version = "4.18.1"

[[deps.HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[deps.HttpCommon]]
deps = ["Dates", "Nullables", "Test", "URIParser"]
git-tree-sha1 = "46313284237aa6ca67a6bce6d6fbd323d19cff59"
uuid = "77172c1b-203f-54ac-aa54-3f1198fe9f90"
version = "0.5.0"

[[deps.Inflector]]
deps = ["Unicode"]
git-tree-sha1 = "8555b54ddf27806b070ce1d1cf623e1feb13750c"
uuid = "6d011eab-0732-4556-8808-e463c76bf3b6"
version = "1.0.1"

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "61feba885fac3a407465726d0c330b3055df897f"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.1.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JSON3]]
deps = ["Dates", "Mmap", "Parsers", "StructTypes", "UUIDs"]
git-tree-sha1 = "fd6f0cae36f42525567108a42c1c674af2ac620d"
uuid = "0f8b85d8-7281-11e9-16c2-39a750bddbf1"
version = "1.9.5"

[[deps.JuliaFormatter]]
deps = ["CSTParser", "CommonMark", "DataStructures", "Pkg", "Tokenize"]
git-tree-sha1 = "2e9129c034d3b9338d0f77672db5f8b312047689"
uuid = "98e50ef6-434e-11e9-1051-2b60c6c9e899"
version = "0.22.11"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "52617c41d2761cc05ed81fe779804d3b7f14fff7"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.13"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "dedbebe234e06e1ddad435f5c6f4b85cd8ce55f7"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.2.2"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Millboard]]
git-tree-sha1 = "ea6a5b7e56e76d8051023faaa11d91d1d881dac3"
uuid = "39ec1447-df44-5f4c-beaa-866f30b4d3b2"
version = "0.2.5"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.Nettle]]
deps = ["Libdl", "Nettle_jll"]
git-tree-sha1 = "f96a7485d2404f90c7c5c417e64d231f8edc5f08"
uuid = "49dea1ee-f6fa-5aa6-9a11-8816cee7d4b9"
version = "0.5.2"

[[deps.Nettle_jll]]
deps = ["Artifacts", "GMP_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "eca63e3847dad608cfa6a3329b95ef674c7160b4"
uuid = "4c82536e-c426-54e4-b420-14f461c4ed8b"
version = "3.7.2+0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.Nullables]]
git-tree-sha1 = "8f87854cc8f3685a60689d8edecaa29d2251979b"
uuid = "4d1e1d77-625e-5b40-9113-a560ec7a8ecd"
version = "1.0.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "dfb54c4e414caa595a1f2ed759b160f5a3ddcba5"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "d7a7aef8f8f2d537104f170139553b14dfe39fe9"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.2"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "4d4239e93531ac3e7ca7e339f15978d0b5149d03"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.3.3"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "db8481cf5d6278a121184809e9eb1628943c7704"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.13"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "9f8a5dc5944dc7fbbe6eb4180660935653b0a9d9"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.0"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6edcea211d224fa551ec8a85debdc6d732f155dc"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.0.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StringEncodings]]
deps = ["Libiconv_jll"]
git-tree-sha1 = "50ccd5ddb00d19392577902f0079267a72c5ab04"
uuid = "69024149-9ee7-55f6-a4c4-859efe599b68"
version = "0.3.5"

[[deps.StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "ec47fb6069c57f1cee2f67541bf8f23415146de7"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.11"

[[deps.StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "d24a825a95a6d98c385001212dc9020d609f2d4f"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.8.1"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "5ce79ce186cc678bbb5c5681ca3379d1ddae11a1"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.7.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TextWrap]]
git-tree-sha1 = "9250ef9b01b66667380cf3275b3f7488d0e25faf"
uuid = "b718987f-49a8-5099-9789-dcd902bef87d"
version = "1.0.1"

[[deps.Tokenize]]
git-tree-sha1 = "2b3af135d85d7e70b863540160208fa612e736b9"
uuid = "0796e94c-ce3b-5d07-9a54-7f471281c624"
version = "0.5.24"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[deps.URIParser]]
deps = ["Unicode"]
git-tree-sha1 = "53a9f49546b8d2dd2e688d216421d050c9a31d0d"
uuid = "30578b45-9adc-5946-b283-645ec420af67"
version = "0.4.1"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UrlDownload]]
deps = ["HTTP", "ProgressMeter"]
git-tree-sha1 = "05f86730c7a53c9da603bd506a4fc9ad0851171c"
uuid = "856ac37a-3032-4c1c-9122-f86d88358c8b"
version = "1.0.0"

[[deps.VersionCheck]]
deps = ["Dates", "JSON3", "Logging", "Pkg", "Random", "Scratch", "UrlDownload"]
git-tree-sha1 = "89ef2431dd59344ebaf052d0737205854ded0c62"
uuid = "a637dc6b-bca1-447e-a4fa-35264c9d0580"
version = "0.2.0"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "b1be2855ed9ed8eac54e5caff2afcdb442d52c23"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.2"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "58443b63fb7e465a8a7210828c91c08b92132dff"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.14+0"

[[deps.YAML]]
deps = ["Base64", "Dates", "Printf", "StringEncodings"]
git-tree-sha1 = "3c6e8b9f5cdaaa21340f841653942e1a6b6561e5"
uuid = "ddb6d928-2868-570f-bddf-ab3f9cf99eb6"
version = "0.4.7"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─1393e9ac-f584-11ec-2e80-eb23799e9841
# ╠═cefc6a6f-ede3-49fb-b377-66b62ff75f27
# ╠═65184293-4388-44bf-a71d-3283f845a08f
# ╠═14fd9102-f353-4d7e-a8de-f145671bafa7
# ╟─07f971b0-bf01-4d7d-9abe-80ea6545732c
# ╠═b8ced4fa-bfa2-43a1-acd0-56d59d9d6bee
# ╠═512c3296-652c-4f04-bf5a-00fa436cdbb3
# ╠═13176606-97c1-402c-ab81-812a4d529c20
# ╟─32b9bc9c-9dd7-4f6a-8304-c912e307d9b0
# ╠═7c2bbd9f-f64d-445a-8f02-a2b28d3c7a49
# ╟─dffea70a-5bf1-4434-8b09-70e9ee44a6b4
# ╠═b7f18dff-1156-4421-a0c7-199be6aa73e8
# ╠═296b7ed2-a5c3-4e5a-a68d-6c1bf103d1cb
# ╠═3747ea77-5cf0-4e4b-9d8c-6d38507de488
# ╟─44094652-2ced-4ae1-a36f-484a0d7602a5
# ╠═0a41b11c-8170-419d-b9fd-b6327c201142
# ╠═29e45022-6648-4aae-8455-fbc0fc4d7789
# ╠═f632bab1-b981-4cc3-8626-5c26f5726211
# ╠═8a586046-6cae-464c-927a-c2aaf890d3aa
# ╟─f6ea795f-2cd6-43f6-8dd3-9f657999c22e
# ╠═049c7d05-c840-459b-8e8e-1e6e59080522
# ╠═228b7e2a-52ce-412a-9a91-b17d6045fdec
# ╟─30f9072e-81a2-4110-9c2d-d38fc4154e71
# ╠═34657e9f-a158-4df4-8477-4418cb0c784c
# ╠═01039489-74e4-4641-ba81-6b3b2c1aeee3
# ╠═5dbf1435-3265-469e-991c-b59880f07987
# ╠═e7bbc58f-ab77-40af-8cc1-d7d3d94b07eb
# ╟─bfc17efe-7aa8-4dbe-9115-32611c6322fd
# ╠═9e4f5013-535e-4003-99c7-72633a25c537
# ╠═43e4bb10-553d-411a-816f-5457da2c65bf
# ╠═500e6075-cfe7-4a82-943a-678350d5e918
# ╠═7012738e-7028-4755-bc11-c143d34a40dd
# ╠═aa8d34d1-56ec-49e4-879e-a47474866894
# ╠═c91b93fb-b392-4fb6-8374-552a018a150c
# ╟─3816d07e-36db-4135-a17e-e40db1431f61
# ╠═5d7b2842-ad04-40c3-8fc2-e6bfbc08272c
# ╠═d6426a5a-1ccf-49e3-bce6-3a1060f7d974
# ╠═058051c9-fece-400a-809d-7b5e7861fcac
# ╠═57984a11-607d-48ed-97ce-cc5a8d44511f
# ╟─f1abacdc-e692-4e09-a614-71da815551a7
# ╠═f3d13963-3c5e-472f-a509-b2448f622f36
# ╠═8b095784-1b7d-45ed-b59f-c226a272c4e3
# ╠═e9ad49c0-ceb6-4315-ad84-1bcc019cd128
# ╠═341d3c0c-7710-4dc6-815a-8f9714adadc4
# ╟─ffba5c41-9f67-4c1d-9274-97d33e7e307c
# ╠═7e69c530-9633-44c0-8cdf-53d9b3a8dd01
# ╠═3a9b2f63-e659-499b-aa86-cddba100b6d9
# ╠═62629221-1df5-4f69-9462-0f563db7d3bc
# ╠═ceb9909f-bef3-4009-acdd-a93779708d35
# ╟─df5d9f48-7242-4f50-afba-b02491c2c593
# ╠═07efaef5-5cc2-4c21-8980-d018dc1d8e95
# ╠═97750c76-419c-425f-b5b4-89b2c0fb9b34
# ╠═df7e4997-3343-4116-bcdb-940ae50acd91
# ╠═966925d3-fcce-4406-bfa9-9700fc88a8dd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
