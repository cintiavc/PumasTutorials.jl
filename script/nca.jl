
using PuMaS.NCA


using PuMaS, CSV

root = joinpath(dirname(pathof(PuMaS)), "..")
const example_nca_data = CSV.read("$root/examples/nca_test_data/dapa_IV.csv")
concs(i) = Float64.(example_nca_data[:CObs])[16(i-1)+1:16*i]
times(i) = Float64.(example_nca_data[:TIME])[16(i-1)+1:16*i]


auc(concs(1), times(1))
auc(concs(1), times(1), method=:linuplogdown)


nca = NCAdata(concs(1), times(1))
auc(nca)


ncas = @. NCAdata(concs(1:24), times(1:24));


ncas = @. NCAdata(concs(1:24), times(1:24), dose=5000.)
auc(ncas[1], auctype=:AUClast)


@. auc(ncas, auctype=:AUClast)


auc(ncas[1], interval=(10,Inf))


auc_extrap_percent(ncas[1])


aumc(ncas[1])
aumc_extrap_percent(ncas[1])


lambdaz(ncas[1])


lambdaz(ncas[1], threshold=15)


lambdaz(ncas[1], idx=[10, 15, 16])


tmax(ncas[1])
cmax(ncas[1])
cmax(ncas[1], interval=(20, 24))


tlast(ncas[1])
clast(ncas[1])


thalf(ncas[1])


NCA.interpextrapconc(ncas[1], 12., interpmethod=:linear)

