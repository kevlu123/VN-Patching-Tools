set list=yozora_com_000_E CG_PAGE yozora_hika_103d_H_E

for %%a in (%list%) do (
    echo %%a
    php ws2_compile.php ..\sky\EnOrig\Rio\ 1.9 update %%a
    cp ..\sky\EnOrig\Rio\%%a.ws2u ..\sky\EnUpdated\Rio\%%a.ws2
)

php arc_pack.php ..\sky\EnUpdated\Rio\ "f:\SteamLib\steamapps\common\A Sky Full of Stars\Rio.arc"
