local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
Name = "The Community | Auto Piano",
LoadingTitle = "The Community | Auto Piano",
LoadingSubtitle = "Loading..",
ConfigurationSaving = {
Enabled = false
},
Discord = {
Enabled = false
},
KeySystem = true,
KeySettings = {
Title = "The Community | Auto Piano",
Subtitle = "Key System",
Note = "Enter the key to continue",
FileName = "TheCommunityKey",
SaveKey = false,
GrabKeyFromSite = false,
Key = {"H8H8H8"}
}
})

local MainTab = Window:CreateTab("Main")
local PresetTab = Window:CreateTab("Preset Songs")

local VirtualInputManager = game:GetService("VirtualInputManager")

local Playing = false
local CurrentBPM = 100
local SongText = ""
local PlaybackMode = "Custom song"
local SelectedPreset = "Golden-brown-easy.fil3"

local PresetSongs = {
["Golden-brown-easy.fil3"] = [[
^[EiT] q[EiT]^4[itW]
8[itW]4$[EIT] *
[EIT]$q[iTW]([iTW]*
[iTW]8[iTW]^[EiT] q[EiT]^
4[itW] 8[itW]4$[EIT]
[EIT]$q[iTW]([iTW]
[iTW]8[iTW]----
^ [EiT]-q [EiT] ^ 4 [itW]-
8 [itW] 4 $ [EIT]-
[EIT] [$Q] q [iTW]
( [iTW] * [iTW]
8 [iTW] ^[EiT] q
[EiT]^4[itW] 8[itW]4
$[EIT] [EIT]$q[iTW]
([iTW][iTW]8[iTW]----
^ [EiT]-
q [EiT] ^ 4 [itW]-8 [itW]
4 $ [EIT]- [EIT] [$Q] q
[iTW] ( [iTW] * [iTW] 8 [iTW]
]],

["Golden-Brown.fil3"] = [[

6 [etu] 0 [etu] 6 3 [wru] 7 [wru] 3
4 [eti] 8 [eti] 4 0 [wtu] 9 [wtu] 8
[wtu] 7 [wtu] 6 [etu] 0 [etu] 6 3 [wru]
7 [wru] 3 4 [eti] 8 [eti] 4 0 [wtu]
9 [wtu] 8 [wtu] 7 [wtu] 6 [etu] 0 [etu]
6 3 [wru] 7 [wru] 3 4 [eti] 8 [eti]
4 0 [wtu] 9 [wtu] 8 [wtu] 7 [wtu] 6
[etu] 0 [etu] 6 3 [wru] 7 [wru] 3 5
[wry] 9 [wry] 5 4 [eti] 3 [eti] 2 [eti]
1 [eti] 2 [eyi] 4 [eyi] 6 5 [3tuo] [1tuo]
2 [eyi] 4 [eyi] 6 5 [3tuo] [1tuo] 2 [eyi]
4 [eyi] 6 5 [3tuo] [1tuo] 2 [eyi] 4 [eyi]
6 5 [3tuo] [1tuo] 2 y 4 [we] [6w] 5
[3tuo] [1tuo] [2q] w 4 e [6w] 5 [3tuo] [1tuo]
2 y 4 e [6w] 5 [3tuo] [1tuo] [2q] w
4 e 6 [5w] 0 [3tuo] [1tuo] [29] 0 4
q [60] 5 [3tuo] [1tuo] [29] 0 4 q [60]
5 [3tuo] [1tuo] [29] 0 [4q] [60] 5 [3tuo] [1tuo]
[29] 8 4 6 5 5 [3tuo] [1tuo] 2 [eyi]
4 [eyi] 6 5 [3tuo] [1tuo] 2 [eyi] 4 [eyi]
6 5 [3tuo] [1tuo] 2 y 4 [we] [6w] 5
[3tuo] [1tuo] [2q] w 4 e [6w] 5 [3tuo] [1tuo]
2 y 4 e [6w] 5 [3tuo] [1tuo] [2q] w
4 e 6 [5w] 0 [3tuo] [1tuo] [29] 0 4
q [60] 5 [3tuo] [1tuo] [29] 0 4 q [60]
5 [3tuo] [1tuo] [29] 0 [4q] [60] 5 [3tuo] [1tuo]
[29] 8 4 6 5 5 [3tuo] [1tuo] 6 [etu]
0 [etu] 6 3 [wru] 7 [wru] 3 4 [eti]
8 [eti] 4 0 [wtu] 9 [wtu] 8 [wtu] 7
[wtu] 6 [etu] 0 [etu] 6 3 [wru] 7 [wru]
3 4 [eti] 8 [eti] 4 0 [wtu] 9 [wtu]
8 [wtu] 7 [wtu] 2 [eyi] 4 [eyi] 6 5
[3tuo] [1tuo] 2 [eyi] 4 [eyi] 6 5 [3tuo] [1tuo]
2 i [4u] i [6u] [5i] u [3i] u [1i]
u [2i] u i [4u] i [6u] [5i] u [3i]
u [1i] u [2i] u i [4u] i [6u] [5i]
u [3i] u [1i] u [2i] o 4 [eyi] 6
5 [3tuo] [1tuo] 2 i [4u] i [6u] [5i] u
[3i] u [1i] u [2i] u y 4 t [6e]
5 w 3 1 2 d [4s] [6p] [5o] [3i]
u 1 2 d [4s] [6p] [5o] [3i] u 1
[6q] w r [0t] u [6i] [3p] o i [7u]
t [3r] [4t] u i [8o] p [4d] [0s] u
9 y 8 t 7 r 6 [etu] 0 [etu]
6 3 [wru] 7 [wru] 3 4 [eti] 8 [eti]
4 0 [wtu] 9 [wtu] 8 [wtu] 7 [wtu] 6
[etu] 0 [etu] 6 3 [wru] 7 [wru] 3 4
[eti] 8 [eti] 4 0 [wtu] 9 [wtu]
7 [wtu] [6e] 8 6 [3r] 7 5 [4t] 8
6 [5yi] u 9 t 7 [6euo] i 8 u
6 [3ru] 7 5 [4t] 8 6 [5rt] r 9
w 7 [6ey] t 8 y 6 [3r] 7 5
[4t] 8 6 [5yi] u 9 t 7 [6euo] i
8 u 6 [3ru] 7 5 [4t] 8 6 [5rt]
r 9 w 7 [6ey] t 8 y 6 [3r]
7 5 [4t] 8 6 [5yi] u 9 t 7
[6euo] i 8 u 6 [3ru] 7 5 [4t] 8
6 [5rt] r 9 w 7 e [6ey] t 8
y 6 [3r] 7 5 [4t] 8 6 [5yi] u
9 t 7 [6euo] i 8 u 6 [3ru] 7
5 [4t] 8 6 [5rt] r 9 w 7
]],

["tetris-theme.fil3"] = [[

[3f] 0 [3a] [0s] [3d] 0 [3s] [0a]
[6p] 6 [6p] [6s] [6f] 6 [6d] [6s]
[7a] 7 7 [7s] [7d] 7 [7f] 7
[6s] 6 [6p] 6 [6p] 6 6 6
2 [9d] 2 [9g] [2j] 9 [2h] [9g]
[1f] 8 1 [8s] [1f] 8 [1d] [8s]
[7a] 7 7 [7s] [7d] 7 [7f] 7
[6s] 6 [6p] 6 [6p] 6 6 6
[6f] 6 6 6 [6s] 6 6 6
[%d] % % % [%a] % % %
[6s] 6 6 6 [6p] 6 6 6
[7O] 7 7 7 7 7 7 7
[6f] 6 6 6 [6s] 6 6 6
[7d] 7 7 7 [7a] 7 7 7
[1s] 8 [1f] 8 [1j] 8 [1j] 8
[7H] 7 7 7 7 7 7 7
[3f] 0 [3a] [0s] [3d] 0 [3s] [0a]
[6p] 6 [6p] [6s] [6f] 6 [6d] [6s]
[7a] 7 7 [7s] [7d] 7 [7f] 7
[6s] 6 [6p] 6 [6p] 6 6 6
2 [9d] 2 [9g] [2j] 9 [2h] [9g]
1 [8f] 1 [8s] [1f] 8 [1d] [8s]
7 [7a] 7 [7s] [7d] 7 [7f] 7
6 [6s] 6 [6p] [6p] 6 6 6
]],


["Rush-E.easy-fil.3"] = [[
u u u u u u u u u u u u u u u u u u u 6 8 3 8 [u6] 8 3 8
[u6] u [u8] u [u3] u [u8] u [u6] u[u8] u [u3] u [u8] u [u6] u [u8] u [u3] i [u8] Y [u6] [p8] [s3] 8
[d%] d [d9] d [d3] s [a9] d [s6] s [s8] s [s3] a [p8] s [a7] a [a(] a [I$] [a(] [O0] [H3]
]],

["Rush-E.fil3"] = [[
[6u] [80u]u[3u]
[80u]u[6u] [80u]
u[3u] [80u]u[6u]
i[80u]Y[3u] [80p]
[6s] [80] 3 [80s]
[%d] [90d]d[%d]s
[90a]d[6s] [80] 6
[80p]s[7a] [(ea]a[7I]
[(ea] [0rWO]| [30u]|
[6u] [80u]u[3u]
[80u]u[6u] [80u]
u[3u]i[80u]Y[6u]
[80p]s[3f] [80j]
[6l] [80] 3 [80l]
[%z]l[90k]z[6l]
[80] [7k]j[e(H]k
[8j] [0e] [9g]f
[qed]s[0a] [Wr]O
[etup]| [6e]|
[6u] [80u]u[3u]
[80u]u[6u] [80u]u[3u]
[80u]u[6u]i[80u]Y[3u]
[80p] [6s] [80] 3 [80s]
[%d] [90d]d[%d]s
[90a]d[6s] [80] 6
[80p]s[7a] [(ea]a[7I]
[(ea] [0rWO]| [30u]|
[6u] [80u]u[3u] [80u]u[6u]
[80u]u[3u]i[80u]Y[6u]
[80p]s[3f] [80j]
[6l] [80] 3 [80l]
[%z]l[90k]z[6l]
[80] [7k]j[e(H]k[8j]
[0e] [9g]f[qed]s[0a]
[Wr]O[etup]| [6e]|
[9d] [qe]S[9d] [qef]
[9g] [qe] 9 [qed] [8f]
[0e] 8 [0es] [8f] [0e] 8 [0es]
[7a] [(e] 7 [e(P] [7a]
[(es] [7d] [(ea] [8s] [0e]
8 [0e] 8 [0e] [8s] [0es]
[9d] [qe]S[9d] [qef] [9g]
[qe] 9 [qed] [8f] [0e] 8
[0es] [8f] [0e] [8j] [0e]
9 [qed] 9 [qeg] [8f] [0es]
[7d] [9wa] [680p]| f j| [6e]|
[6u] [80u]u[3u] [80u]u[6u]
[80u]u[3u] [80u]u[6u]i[80u]
Y[3u] [80p] [6s] [80] 3 [80s]
[%d] [90d]d[%d]s[90a]d[6s]
[80] 6 [80p]s[7a]
[(ea]a[7I] [(ea] [0rWO]| [30u]|
[6u] [80u]u[3u] [80u]u[6u]
[80u]u[3u]i[80u]Y[6u]
[80p]s[3f] [80j]
[6l] [80] 3 [80l]
[%z]l[90k]z[6l]
[80] [7k]j[e(H]k[8j]
[0e] [9g]f[qed]s[0a]
[Wr]O[etup]| [6e]|
[9p] [qep]p[6p]
[qep]p[9p] [qep]p[9p] [qep]p[6p]
[qep]p[9p]P[qep]O[6p]
[qed] [9g] [qe] 6 [qeg]
[h] [weh]h
[h]g[wef]h[9g]
[qe] 9 [qed]g[0f] [Wyf]f[0a]
[Wyf] [euTS]| [6ep]|
[9p] [qep]p[6p] [qep]p[9p]
[qep]p[6p]P[qep]
O[9p] [qed]g[6j]
[qez] [9c] [qe] 6 [qec]
[*v]c[wex]v[9c] [qe]
[0x]z[yWL]x[qz] [ey]
[wJ]j[Eyh]g[ef]
[Tu]S[yipd]| [9y]|
[wd] [Eyd]d[9d] [Eyd]d[wd]
[Eyd]d[9d] [Eyd]
d[wd]D[Eyd]S[9d]
[Eyh] [wJ] [Ey] 9 [yEJ]
[Ql] [tyl]l[Ql]J[tyj]l[wJ]
[Ey] w [Eyh]J[ej] [Toj]j[ef]
[Toj] [ypIG]| [9yd]|
[wd] [Eyd]d[9d] [Eyd]d[wd]
[Eyd]d[9d]D[Eyd]S[wd]
[Eyh]J[9z] [Eyv]
[wB] [Ey] 9 [yEB]
[Qm]B[tyb]m[wB] [Ey]
[eb]v[oTC]b[Ev] [yo]
[tZ]z[Yol]J[yj] [Ip]G[Podh]
]],


["Meant-to-be-cutntsniffer.fil3"] = [[

[GIY] a [Gu] a [GY] a [Gr]-
[GY] a [Gu] a [GY] a G-
[Hi] S [HI] S [Hi] S [GT] g
[HO] S [HI] S [Hi] S H-
[hu] s [hi] s [hu] s [ht]-
[hu] s [hi] s [hu] s h-
[Hi] S [HI] S [Hi] S [GT] g
[HO] S [HI] S [Hi] S [HI]-
3 0 3 0 3 0 3 0
[$G] [aQ] [$G] [aQ] [$G] [aQ] [$G] Q
[%G] [aW] [%G] [aW] [%G] [aW] [%f] [DW]
[!G] [*a] [!G] [*a] [!G] [*a] [!G] *
[3Y] 0 [3u] [3] [3Y] [3] [3r] [0r]
[$Y] Q [$u] [$Y] $ [$Y] [$r] [Qr]
[%Y] W [%u] [%Y] % [%r] [%r] W
[!] [*I] [!u] [!Y] ! [!] [!r] *
[3Y] 0 [3u] [3Y] 3 [3] [3r] [0r]
[$Y] Q [$u] [$] [$Y] [$r] [$] Q
[%Y] W [%u] [%Y] % [%] [%r] [rW]
[@I] [(u] @ [@Y] @ [@] [@] [(r]
[3Y] 0 [3u] [3] [3Y] [3] [3r] [0r]
[$] [QY] $ [$u] [$Y] [$] [$] Q
[%Y] [WY] [%u] [%Y] [%Y] [%] [%r] [rW]
[!I] * [!u] [!] [!Y] [!] [!] *
[3Y] 0 [3u] [3] [3Y] [3] [3I] [0I]
[$I] Q [$Y] [$] $ [$] [$Y] Q
[%I] W [%I] [%] [%I] [%] [%r] [rW]
[@I] [(I] @ [@I] @ [@I] @ T
[$giQ] S [$HQ] S [$HQ] S [$HQ]-
[$DQY] S [$HQ] S [$HQ] S [$HQ]-
[%STW] S [%HW] S [%HW] S [%GW] g
[%HW] S [%HW] S [%STW] S [%STW]-
[^EgH] S [^EH] S [^EGH] S [^EH]-
[^DEH] S [^EH] S [^EST] S [^EST]-
[(@ST] S [(@H] S [(@H] S [(@HO] [HO]
[(@HO] S [(@H] S [(@H] [(@S] [(@H] [(@]
[4fu] [4t] [4gi] [4t] [4fu] [4t] [4st] 4
[4fu] [4t] [4gi] [4t] [4fu] [4t] [4o] 4
[5fu] [5t] [5gi] [5t] [5fu] [5t] [5st] [5u]
[5ho] [5t] [5gi] [5t] [5fu] [5t] [5o] 5
[6fu] [6t] [6gi] [6t] [6fu] [6t] [6st] 6
[6fu] [6t] [6gi] [6t] [6fu] [6t] [6o] 6
[@gi] [@T] [@GI] [@T] [@gi] [@T] [@ST] [@i]
[@HO] [@T] [@GI] [@T] [@gi] [@T] [@GI] [@i]
[$gi] [$T] [$O] [$T] [$O] [$T] [$O] [$T]
[$DY] [$T] [$O] [$T] [$O] [$T] [$O] [$T]
[%ST] [%T] [%O] [%T] [%O] [%T] [%I] [%iT]
[%HO] [%T] [%GI] [%T] [%gi] [%T] [%GI] [%T]
[^gi] [^T] [^O] [^T] [^O] [^T] [^O] [^T]
[^DY] [^T] [^O] [^T] [^O] [^T] [^O] [^T]
[(ST] [(T] [(O] [(T] [*O] [*T] [*I] [*iT]
[%HO] [%T] [%GI] [%T] [*gi] [*T] [*GI] *
[03DY]-[03fu]-[03][03DY][03][03] [ar] [03]
[03DY]-[03fu]-[03][03DY][03][03]--
[$DQY]-[$fQu]-[$Q][$DQY][$Q][$Q] [ar] [$Q]
[$GIQ]-[$fQu]-[$Q][$DQY][$Q][$Q]--
[%DWY]-[%fuW]-[%W][%DWY][%W][%W] [ar] [%W]
[%DWY]-[%fuW]-[%W][%DWY][%W][%W] [ar]-
[*DTY] [DY] [*fTu]-[*T][*DTY][*T][*T] [ar] [*T]
[*GIT] [GI] [*fTu] [fu][*T][*DTY][*T][*T]--
[$giQ] [gi] [$GIQ]-[$Q][$giQ][$Q][$giQ] [ST] [$giQ]
[$Q] [GI] [$Q] [gi][$Q][$giQ][$Q][$GIQ]-[gi]
[%giW] [gi] [%W] [GI][%W][%giW][%W][%W] [ST] [%W]
[%HOW]-[%GIW] [gi][%W][%W][%W][%GIW]-[gi]
[6efu] [gi] [6e] [fu][6e][6e][6e][6e] [st] [6est]
[6dey]-[6e]-[6e][6est][6e][6est] [ho]-
[29ho]-[29fu]-[29][29][29][29] [fu] [29]
[29gi]-[29]-[29][29fu][29][29] [dy]-
[3ar] [07a] [3G] [07a] [3G] a3[3GI] [07]
[$DY] [aQ] [$G] [aQ] [$ST] [aQ] [$GI] [Q]
[%GI] [(aW] [%G] [(aW] [%G] [(aW] [%f] [(DW]
[!fu] [%a] [!G] [%a] [!DY] [%a] [!ar] [%]
[3DY] [07a] [3G] [07a] [3G] [07a] [3fu] [07]
[$DY] [*aQ] [$G] [*aQ] [$G] [*aQ] [$GI] [*Q]
[%GI] [(aW] [%fu] [(aW] [%GI] [(aW] [%DY] [(DW]
[@DY] [(^a] [@G] [(^a] [@G] [(^a] [@G]@[(^]@
[03DY] r [03fu] r [03DY] r [03ar] r
[03DY] r [03fu] r [03DY] r [03I][03][03r][03]
[%giW] T [%GIW] T [%giW] T [%STW] [iT]
[%HOW] T [%GIW] T [%giW] T [%OW] T[%W]
[6efu] t [6egi] t [6efu] t [6est] t
[6efu] t [6egi] t [6efu] t [6eo][6e][6et][6e]
[(giY] T [(GIY] T [*giT] T [*STW] [iT]
[%HOW] T [%GIW] [(TY] [*giT] T [*GIT] [*T]
[4fqx] [4qs] [4hq] [4qs] [4hq] [4qs] [4hq] [4q]
[4dqz] [4qs] [4hq] [4qs] [4hq] [4qs] [4q]
[5lsw] [5sw] [5hw] [5sw] [5hw] [5sw] [5gw] [5fw]
[5hvw] [5sw] [5cgw] [5sw] [5fwx] [5sw] [5cgw] [5w]
[6efx] [6es] [6eh] [6es] [6eh] [6es] [6eh] [6e]
[6dez] [6es] [6eh] [6es] [6eh] [6es] [6eh] [6e]
[9lsy] [9sy] [9hy] [9sy] [8ht] [8st] [8gt] [8ft]
[$GIQ] [$aQ] [$fQu] [$aQ] [7DrY] [7ar] [7fru] [7r]
Y--
]],

["Fur-elis_easy.e.fil3"] = [[

f D f D f a d s [pe]
t u p [a0] u O a [se]
u f D f D f a d s [pe]
t u p[ a0] u s a[ pe]
a s d [ft] o g f [dr]
i f d [se] u d s [a]
f D f D f a d s [pe]
t u p [a0] u Oa [se]
u f D f D f a d s [pe]
t u p [a0] u s a [peu] 6
]],

["fur-elise.fil3"] = [[

f D f D f a d s
[6p] 0 e t u p
[3a] 0 W u O a [6s] 0 e u
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W y s a [6p] 0 e
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W u O a [6s] 0 e u
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W y s a
[6p] 0 e a s d
[8f] w t o g f
[5d] w r i f d [6s] 0 e u d s
[3a] 0 u u
f u f f x D f D f D f D f D f D f a d s
[6p] 0 e t u p
[3a] 0 W u O a [6s] 0 e u
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W y s a
[6p] 0 e a s d
[8f] w t o g f
[5d] w r i f d [6s] 0 e u d s
[3a] 0 u u
f u f f x D f D f D f D f D f D f a d s
[6p] 0 e t u p
[3a] 0 W u O a [6s] 0 e u
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W y s a
[6p] 0 e [etus] [etis] [wts] [qs]
e t e [tg] e f [qf]
E [yd] E [yj] E j [qj]
[uh] [eqg] [uf] [eqd] [us] [qp]
e [tp] e P [tp] o [ep] P [qs]
e t e [td] [ed] [0f]
e t [ef] [9yg] [qp] [ws]
u w [ud] s a s [wd] i a [tus]
h o h p h [ioa] h [uos] h [yiod] h [tuof]
h l k [qej] h g f [wrd] h g d [tus]
h o h p h [ioa] h [uos] h [yiod] h [tuof]
h l k [qej] h g f [wrd] h g d [wrf]
g f D f a f D f a f D f
a f D f a f D f D f D f D f D f a d s
[6p] 0 e t u p
[3a] 0 W u O a [6s] 0 e u
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W y s a
[6p] 0 e a s d
[8f] w t o g f
[5d] w r i f d [6s] 0 e u d s
[3a] 0 u u
f u f f x D f D f D f D f D f D f a d s
[6p] 0 e t u p
[3a] 0 W u O a [6s] 0 e u
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W y s a
[6p] 6 6 6 6 6
[6uos] 6 6 6 6 6
[6ipd] 6 6 6 [s6f] [6dg] [6odg] 6
6 6 [6odg] 6 [6psf] 6 6 6 6 6
[26id] [26] [26] [26] [26us] [26ya]
[26tp] [26] [26] [26] [26tp] [26]
[36tp] [36] [36us] [36] [53ya] [35] [6tp]
6 6 6 6 6 [6uos] 6 6 6 6 6
[6ipd] 6 6 6 [s6f] [6dg] [6dg] 6 6 6 [6dg] 6
[6dg] ^ ^ ^ ^ ^ [o6d] ^ ^ ^ [6id] [6ys] [yi6p] ^ ^ ^ [6yip]
^ [7yio] 7 7 7 [7yio] 7 [8tup] [0wua]
[6e] t u p s f
[etud] s a [etup] s f j l x
[etuz] l k [etuj] l x b m x
[etuz] m n [etuB] bVvCcxZzLlkJjHhGgs
[6p] 0 e t u p
[3a] 0 W u O a [6s] 0 e u
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W y s a
[6p] 0 e a s d
[8f] w t o g f
[5d] w r i f d [6s] 0 e u d s
[3a] 0 u u
f u f f x D f D f D f D f D f D f a d s
[6p] 0 e t u p
[3a] 0 W u O a [6s] 0 e u
f D f D f a d s
[6p] 0 e t u p
[3a] 0 W u s a
[6p]s[6p]0etup[3a]0Wusa[6p]
]],

["MLight-Sonata-Beethoven1.e.fil3"] = [[

[9e]yi eyi eyi eyi |
[8e]yi eyi eyi eyi
Eyi Eyi EYo EYo
[6e]To eyi [6e]yu wTu
[9q]ey eyi eyi p eyp |
[p]uo euo euo p uop
[9p]yi eyi P yoE yo |
[8p]ti eti [8o]tu s uo
[4i]ti eti eti eti
Wti Wti Wti O tiO
OtI OtI OtI O tIO
TiW TiW yio yi
[8o] tYw tYW tyW ty |
[5o] tYw tY[wo] ryw ry
[8t] Yot Yot uosuo |
S iO[qt] iOW iO[qa] iO
[8s] uot uot uosuo |
S iO[qt] iOW iO[qa] iO
[8s] uot uo[6s] YIt YI
s ypt ypE yiE yi
8 tYW tY EuwEu
[9y]wE 9wE [9y]wt [9y]Qe
[5w]Ey Eyo yoP doP d
dps yps yps dpsd
[5d]oP yoP 0oP 8oP |
*op uop uop [8f]op
[9g]pdipd [5f]oPd ia |
6Tu pTu PTu oTu
6Tu eTu ETu wTu
6ey qey 6wT 0wT
[26qy] [26qy] [26qy]
]],

["MLight-Sonata-Beethoven(1).e.fil3"] = [[

[!W] T u W T u
W T u W T u
[7W] T u W T u
W T u W T u
[6e] T u e T u
[$e] y I e y I
[%W] t I W T u
[%W] T Y Q t Y
[!%0] W T W T u
W T u [OW] T u O
[%18OW] Y I W Y I
W Y I [OW] Y I O
[!*OW] T u W T u
[$ep] T I e T I
[7OW] r u W r u
[7eI] r Y [ae] r Y
[03uW] r u W r u
W r u W r u
[03w] r u w r u
w r u [ow] r u o
[29ow] r i w r i
w r i [ow] r i o
[18ow] t u [7w] r u
[^w] T u [IQ] T u
[7IQ] r y Q r y
[3ow] r T [05u] r T
[$IQ] r y Q r y
[$IQ] E T Q E T
[7r] y I r y I
r Y I [ar] Y I
[rs] u o [03r] u o
[5rw] u o [03Pr] u o
[7ar] Y I r Y I
r Y I [ar] Y I
[rs] u o [03r] u o
[5rw] u o [03Pr] u o
[7ar] Y I r Y I
[%ar] y i r y i
[4ar] T O r T O
[$ep] T I e T I
[7ow] r y w r y
[18IQ] e Y Q e Y
[!*T] Q e * Q e
[!T] Q W [T] q W
[!$Q] e T e T I
T I p [ST] I p S
[4qST] O a T O a
T O a [ST] O a S
[$QST] I p T I p
[(@st] I p [!ST] I p
[%18DY] I O Y I O
Y I O [%18DY] I O
[!%fu] O S u O S
[$DY] I p [5ST] u P
[%s] t Y O t Y
p t Y I t Y
[%] t Y W t Y
e t Y Q t Y
[%0] u O S u O
f u O S u O
[%] 0 W T 0 W
u 0 W T 0 W
[(%] e Q t e Y
t I Y p I s
[%0] T W u T O
u S O f S O
[%T] o u P o S
P f S h f J
[%I] s p D s G
D j G l j Z
l G j D G s
D p s I p Y
I t Y e t Q
e ( Q * Q e
[%8] Q W e W Q
[(] Q e [] Q e
[%8] Q W e W Q
[(] Q e [] Q e
[%8] Q W e W Q
[6] 0 T [] 0 T
[($] Q e ( Q e
[(%] W t ( Q t
[!%0] W T W T u
W T u [OW] T u O
[%18OW] Y I W Y I
W Y I [OW] Y I O
[!*OW] T u W T u
[$ep] T I e T I
[7OW] r u W r u
[7eI] r Y [ae] r Y
[03uW] r u r u O
r u O [Or] u O O
[(@Or] I p r I p
r I p [Or] I p O
[03ar] u O r u O
[(@st] I O [!ST] u O
[%18DY] I O Y I O
[!%fu] O S u O S
[$dy] I p y I p
[%st] I O t I O
[!*ST] u O T u O
T i O [ST] i O
[dT] I p [$QT] I p
[6eT] I p [$QsT] I p
[!*ST] i O T i O
T i O [ST] i O
[dT] I p [$QT] I p
[6eT] I p [$QsT] I p
[!*ST] i O T i O
[$ST] I p T I p
[(@ar] I p r I p
r I p [03ar] u O
[!*ep] u O [(@ep] Y I
[18OW] Y I [!*OW] T u
[6IQ] T Y Q T Y
[%OW] T Y [$ep] T Y
[%OW] T u W T u
[%OQ] t Y Q t Y
[!%0T] W T W T u
W T u [%W] T u %
[%1W] Y I W Y I
W Y I [%W] Y I %
[!%W] u T O u S
O f S [%H] f S %
[%s] D p s I p
Y I e [%et] W Q %
[!%0T] u T O u S
O f S [%H] f S %
[%s] D p s I p
Y I e [%et] W Q %
[!%0T] W T u T W

0 W T W 0
% * 0 W 0 *
% * % 3 % 3
!
[!%0TW]
[!%0TW]
]],

["MLight-Sonata-Beethoven(2).e.fil"] = [[
[iOS]-[OsY]--
[oPT]-[DOt]--
[*EiS]-[(OsY]--[(oPT]-
[OtW]--[GPS]-[gOS]--
[DIs]-[HiS]--
[GPQY]-[gOSW]--[DIsW]-
[iST]--[qSTW]-[(W]-
[st]-[*EPw]-[8tY]-D-
[*EiS]-[(OY]-s-[(oPT]-
[tW]-O-[EGIT]-[TW]-
[gi]-[DQtY]-[iOq]-H-
[GPQY]-[OSW]-g-[DIsW]-
[iT]-S-[iST]-[EiS]--
[iSW]-[SwY]-[sW]-
[aWY]-[aWY]--[aQY]-
[aqY]-[PQ]-[PQT]-[(IsW]--
[*iSW]-[8DIW]--
[IY]-[*W]-[iT]-[$EPQ] [(I]
[$iTW]-[tY]-[qSTW]-[(stW]--
[*EPw]-[8DtY]--
[*EiS]-[(OY]-s-[(oPT]-
[tW]-O-[EGIT]-[giTW]--
[DQtY]-[HOqT]--
[EGIT]-[TW]-[gi]-[DQtY]-
[HOqT]--[EGIT]-[TW]-
[gi]-[JPTuw]-[iTW]-[HO]--
[%Qt]--Y T
[!%qT]--[iST]-[EiS]--
[iSW]-[SwY]-[sW]-
[aWY]-[aWY]--[aQY]-
[aqY]-[PQ]-[PQT]-[(IsW]--
[*iSW]-[8DIW]--
[IY]-[W]-[iT]-[$EPQ] [(I]
[$iTW]-[tY]-[qSTW]-[(stW]--
[EPw]-[8DtY]--
[EiS]-[(OY]-s-[(oPT]-
[tW]-O-[EGIT]-[giTW]--
[DQtY]-[HOqT]--
[EGIT]-[TW]-[gi]-[DQtY]-
[HOqT]--[EGIT]-[TW]-
[gi]-[JPTuw]-[iTW]-[HO]--
[%Qt]--Y T
[!%qT]--[iq]-[!%]--
[IQ]-@--
[DY]-$-[st]-[OW]-
[4ST]-[gi]-[iq]-[!%]--
[IQ]-@--
[GI]-%-[JP]-[%st]-
[!DY]-[ST]-[iq]-[!%]--
[IQ]-@--
[DY]-$-[st]-[OW]-
[4ST]-[gi]-[iq]-[!%]--
[IQ]-@--
[GI]-%-[JP]-[%st]-
[!DY]-[ST]-[gi]-[9W]--
[EP]-[w]--
[DY]-[8Q]--[OW]-
[7q]--[ST]-[^]--
[IQ]-%--
[iq]-!-[4OW]-[%ar]-
$-[EP]-[ST]-[^]--
[IQ]-%--
[iq]-5--[0u]-
%--[iq]-[^]--
[IQ]-%--
[iq]-%-[IQ]-[%8t]-
[!T]--[gi]-[9W]--
[EP]-[w]--
[DY]-[8Q]--[OW]-
[7q]--[ST]-[^]--
[IQ]-%--
[iq]-!-[4OW]-[%ar]-
$-[EP]-[ST]-[^]--
[IQ]-%--
[iq]-5--[0u]-
%--[iq]-[^]--
[IQ]-%--
[iq]-%-[IQ]-[%8t]-
[!*T]--[iOS]-[OsY]--
[oPT]-[DOt]--
[*EiS]-[(OsY]--[(oPT]-
[OtW]--[GPS]-[gOS]--
[DIs]-[HiS]--
[GPQY]-[gOSW]--[DIsW]-
[iST]--[qSTW]-[(W]-
[st]-[*EPw]-[8tY]-D-
[*EiS]-[(OY]-s-[(oPT]-
[tW]-O-[EGIT]-[TW]-
[gi]-[DQtY]-[iOq]-H-
[GPQY]-[OSW]-g-[DIsW]-
[iT]-S-[iST]-[EiS]--
[iSW]-[SwY]-[sW]-
[aWY]-[aWY]--[aQY]-
[aqY]-[PQ]-[PQT]-[(IsW]--
[*iSW]-[8DIW]--
[IY]-[*W]-[iT]-[$EPQ] [(I]
[$iTW]-[tY]-[qSTW]-[(stW]--
[*EPw]-[8DtY]--
[*EiS]-[(OY]-s-[(oPT]-
[tW]-O-[EGIT]-[giTW]--
[DQtY]-[HOqT]--
[EGIT]-[TW]-[gi]-[DQtY]-
[HOqT]--[EGIT]-[TW]-
[gi]-[JPTuw]-[iTW]-[HO]--
[%Qt]--Y T
[!%qT]-
]],

["MLight-Sonata-Beethoven(3).e.(efil)3"] = [[
3 6 8 0 6 8 0 e 8 0 e t 0 e t
u e t u p t u p s u p s [upsf] [upsf]
3 % 7 0 % 7 0 W 7 0 W r 0 W r
u W r u O r u O a u O a [Ouaf] [Ouaf]
6 * 0 e * 0 e T 0 e T u e T u
p T u p S u p S f p S f [Spfj] [Spfj]
6 9 q e e y i p p d g [pdj] [pdj]
6 8 ( e e t Y p p s D [Dpj] [Dpj]
[OHf] u f u f I f O f p f a f O f
a f p f d f s f a f p f O f i D
u f u f u f I f O f p f a f O f
a f p f d f s f a f p f O f i D
u f i D u f i D u f i D u f i D
[uf] 0
3 6 8 0 6 8 0 e 8 0 e t 0 e t
u e t u p t u p s s f j [sl] [sl]
8 ( e t ( e t Y e t Y p t Y p
s Y p s D p s D j s D j [sl] [sl]
7 Q e r Q e r I e r I p r I p
a I p a G p a G j G a p G a p I
o a o u Y u I
u Y Y a Y
I u u a u
o I I a I
o [ak] [ak] [ak] [oh] [uf]
[uf] [YD] [YD] [YD] [ak] [YD]
[IG] [uf] [uf] [uf] [ak] [uf]
[oh] [IG] [IG] [IG] [ak] [IG]
[OH] [pj]
[IG] h G h G f G [oh]
[uf] [ig]
[YD] f D f D S D [uf]
[ipsg] s d f g h j h
g s d f g h j h g s d f g h j h g s d f g h j h
g s d f g h j J l k l k l j h g
f G h G h G h G h G h
f [qeti] t y u i o p o
i t y u i o p o i t y u i o p o
i t y u i o p o i t y u i o p o
i t y u i o p P s d f g h j J k
[sl] [uf]
[oh] [(Ye]
[wru] [ro] [ro] [ro] [ro] [ro] [Ir] [ru]
[Yr] [Ya] [Ya] [Ya] [Ya] [Ya] [ua] [Ia]
[oa] [ro] [ro] [ro] [ro] [ro] [Ir] [ru]
[Yr] [Ya] [Ya] [Ya] [Ya] [ua] [Ia]
[oa] [oa] [oa] [uo] [ps] [ps] [up]
[oa] [oa] [uo] [Ia] [Ia] [YI]
[uo] [oah] [oah] [oah] [oah] [oah] [IGp] [uof]
[YID] [Dsl] [Dsl] [Dsl] [Dsl] [Dsl] [Dak] [Dpj]
[ofh] [oah] [oah] [oah] [oah] [oah] [IGp] [uof]
[YID] [Dsl] [Dsl] [Dsl] [Dsl] [Dsl] [Dak] [Dpj]
[ofh] [fh] [fh] [hk] [fj] [fj] [jl]
[fh] [fh] [hk] [DG] [DG] [Gk]
[ah] [ah] [fk] [pg] [pg] [sj]
[of] [of] [ah] [ID] [ID] [Gp]
[of] o u
Y [Yea] [Yea] [Yea] w u
a h f
D [Dpk] [Dpk] [Dpk] o f
k p D k o f
k p D k
w u r u w u r u w u r u w u r u
W y r y W y r y W y r y W y r y
[80et] 3 6 8 0 6 8 0 e 8 0 e t 0 e t
u e t u p t u p s u p s [upsf] [upsf]
]],

["MLight-Sonata-Beethoven(3)orig.fil3"] = [[
!%[%]0[!W][%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]O[%S]f[!fHOS] [%fHOS]
1%[%8]([1W]8[(%]W[1t]([%W]t[1Y]W[%t]Y
[1O]t[%Y]O[1s]Y[%O]s[1D]O[%s]D[18DHOs] [%DHOs]
7[%q]W[7T]q[%W]T[7i]W[%T]i[7O]T[%i]O
[7S]i[%O]S[7g]O[%S]g[7H]S[%g]H[7gHLS] [%gHLS]
6*[6Q]e[6T]T[6I]p[6S]S[6G]j[6GLS] [6GLS]
6*[06]w[6T]T[6u]o[6S]S[6f]h[6hLS] [6hLS]
[%Hls] [OtW]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[Ot]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h
[HOtW]-[%W]----
!%[%]0[!W][%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]f[%H]L[!*fx] [%fx]
^0[*w]T[^u]w[*T]u[^o]T[*u]o[^S]u[*o]S
[^f]o[*S]f[^h]S[*f]h[^L]f[*h]L[^fx] [*fx]
5([(E]T[5Y]E[(T]Y[5P]T[(Y]P[5S]Y[(P]S
[5D]P[(S]D[5J]S[(D]J[5L]J[(D]S[5J]D[(S]P
[%a](7([%D](7(%(7([%a](7[(O]
[^o]O(P[O]([^o]((^([o]([^D]([(o]
[7P](7([7O](7(7([7O]([7D](7[(O]
[5a](5([5P](5(5([5P]([5D](5[(P]
[%a]([7DZ](%([7DZ](%([7DZ]([%ak]([7HO](
[^HO]([ho](^([ho](^([ho]([^DZ]([ho](
[7JP]([7HO](7([7HO](7([7HO]([7DZ]([7HO](
[5ak]([5JP](5([5JP](5([5JP]([5DZ]([5JP](
[$ls](%($(%([3LS]%3%
[3JP]kJk$JHJ[@ak]7$7@7$7@7$7
[2HO]7372737[!jp]636!636
[!ho]H^hH@hg^h[7HO]%@%7%@%7%@%
[!*36fjpS]----fGHjkLk
[jpTu]fGHjkLk[jpTu]fGHjkLk
[jpTu]fGH[jpTu]kLz[pTux]ZxZ[pTux]Lkj
[HY]aOaYaOa[JY]kSJkoJkSJkYJkSJkoJHSJ
[aHOu]-[!*36epTu]--uIOpaSa
puIO[*0ep]aSapuIO[*0ep]aSa
pu[*0eI]Opa[0eS]apu[0eI]Opa[0eS]a
[0ep]uIOpaSdfGHjkLzZ
[fx]e0ee0e[9HO]rqr9rqr
[(ak]rWr(rWr[@oTw](9(9(9(
[%OrW] [aWY] [aWY] [aWY] [aWY] [aWY] [EPY] [OrY]
[(oTY] [DoTY] [DoTY] [DoTY] [DoTY] [DOrY] [DEPY]
[%aDW] [aWY] [aWY] [aWY] [aWY] [EPY] [OrY]
[(oTY] [DoTY] [DoTY] [DoTY] [DoTY] [DOrY] [DEPY]
[%aD] [aDrW] [aDrW] [aOrY] * [fSTW] [fSTW] [OSTu]
( [aDrW] [aDrW] [aOrY] ( [DEPw] [DEPw] [EoPY]
[%aO] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(^JPS] [(7aHO]
[(@hoP] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(DhrZ] [(EhLS]
[%aHk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(^JPS] [(7aHO]
[(@hoP] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(DhrZ] [(EhLS]
[%aHkW] [HkrY] [HkrY] [krWZ] * [HLTu] [HLTu] [LTWx]
( [HkrY] [HkrY] [krWZ] * [EhJY] [EhJY] [EJwZ]
7 [DkOY] [DkOY] [HrYZ] * [jpSu] [jpSu] [fLTu]
( [aHOY] [aHOY] [DkrY] ( [hoPT] [hoPT] [EJST]
[%aH]W(W%W(W%W(W[%a]W([OW]
[%o]E(E[%DoT]E(E[%DoT]E(E[%DoT]E(E
[%r]OWD(W%W(W%W(W[%k]W([HW]
[%h]E(E[%hSZ]E(E[%hSZ]E(E
[%a]HWZ(W%W(W[%S]hEZ(E%E(E
[%a]HWZ(W%W(W[%S]hEZ(E%E(E
[%r][OW][(Y][OW][%r][OW][(Y][OW][%r][OW][(Y][OW][%r][OW][(Y][OW]
[%t][IQ][(Y][IQ][%t][IQ][(Y][IQ][%t][IQ][(Y][IQ][%t][IQ][(Y][IQ]
[!0TuW]%[%]0[!W][%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]O[%S]f[!fHOS] [%fHOS]
1%[%8]([1W]8[(%]W[1t]([%W]t[1Y]W[%t]Y
[1O]t[%Y]O[1s]Y[%O]s[1D]O[%s]D[18DHOs] [%DHOs]
7[%q]W[7T]q[%W]T[7i]W[%T]i[7O]T[%i]O
[7S]i[%O]S[7g]O[%S]g[7H]S[%g]H[7gHLS] [%gHLS]
6[6Q]e[6T]T[6I]p[6S]S[6G]j[6GLS] [6GLS]
6[06]w[6T]T[6u]o[6S]S[6f]h[6hLS] [6hLS]
[%Hls] [OtW]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h
[HOtW]-[%W]----
!%[%]0[!W][%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]f[%H]L[!*fx] [%fx]
^0[w]T[^u]w[T]u[^o]T[u]o[^S]u[o]S
[^f]o[S]f[^h]S[f]h[^L]f[h]L[^fx] [fx]
5([(E]T[5Y]E[(T]Y[5P]T[(Y]P[5S]Y[(P]S
[5D]P[(S]D[5J]S[(D]J[5L]J[(D]S[5J]D[(S]P
[%a](7([%D](7(%(7([%a](7[(O]
[^o]O(P[O]([^o]((^([o]([^D]([(o]
[7P](7([7O](7(7([7O]([7D](7[(O]
[5a](5([5P](5(5([5P]([5D](5[(P]
[%a]([7DZ](%([7DZ](%([7DZ]([%ak]([7HO](
[^HO]([ho](^([ho](^([ho]([^DZ]([ho](
[7JP]([7HO](7([7HO](7([7HO]([7DZ]([7HO](
[5ak]([5JP](5([5JP](5([5JP]([5DZ]([5JP](
[$ls](%($(%([3LS]%3%
[3JP]kJk$JHJ[@ak]7$7@7$7@7$7
[2HO]7372737[!jp]636!636
[!ho]H^hH@hg^h[7HO]%@%7%@%7%@%
[!36fjpS]----fGHjkLk
[jpTu]fGHjkLk[jpTu]fGHjkLk
[jpTu]fGH[jpTu]kLz[pTux]ZxZ[pTux]Lkj
[HY]aOaYaOa[JY]kSJkoJkSJkYJkSJkoJHSJ
[aHOu]-[!36epTu]--uIOpaSa
puIO[0ep]aSapuIO[0ep]aSa
pu[0eI]Opa[0eS]apu[0eI]Opa[0eS]a
[0ep]uIOpaSdfGHjkLzZ
[fx]e0ee0e[9HO]rqr9rqr
[(ak]rWr(rWr[@oTw](9(9(9(
[%OrW] [aWY] [aWY] [aWY] [aWY] [aWY] [EPY] [OrY]
[(oTY] [DoTY] [DoTY] [DoTY] [DoTY] [DoTY] [DOrY] [DEPY]
[%aDW] [aWY] [aWY] [aWY] [aWY] [aWY] [EPY] [OrY]
[(oTY] [DoTY] [DoTY] [DoTY] [DoTY] [DOrY] [DEPY]
[%aD] [aDrW] [aDrW] [aOrY] * [fSTW] [fSTW] [OSTu]
( [aDrW] [aDrW] [aOrY] ( [DEPw] [DEPw] [EoPY]
[%aO] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(^JPS] [(7aHO]
[(@hoP] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(DhrZ] [(EhLS]
[%aHk] [(%aDk] [(%aDk] [(%aDk] [(%aDk] [(^JPS] [(7aHO]
[(@hoP] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(fhTx] [(DhrZ] [(EhLS]
[%aHkW] [HkrY] [HkrY] [krWZ] * [HLTu] [HLTu] [LTWx]
( [HkrY] [HkrY] [krWZ] * [EhJY] [EhJY] [EJwZ]
7 [DkOY] [DkOY] [HrYZ] * [jpSu] [jpSu] [fLTu]
( [aHOY] [aHOY] [DkrY] ( [hoPT] [hoPT] [EJST]
[%aH]W(W%W(W%W(W[%a]W([OW]
[%o]E(E[%DoT]E(E[%DoT]E(E[%DoT]E(E
[%r]OWD(W%W(W%W(W[%k]W([HW]
[%h]E(E[%hSZ]E(E[%hSZ]E(E
[%a]HWZ(W%W(W[%S]hEZ(E%E(E
[%a]HWZ(W%W(W[%S]hEZ(E%E(E
[%r][OW][(Y][OW][%r][OW][(Y][OW][%r][OW][(Y][OW][%r][OW][(Y][OW]
[%t][IQ][(Y][IQ][%t][IQ][(Y][IQ][%t][IQ][(Y][IQ][%t][IQ][(Y][IQ]
[!iqTW][%q]W[!T]q[%W]T[!W] [%T]i[!O]T[%i]O
[!S]i[%O]S[!g]O[%S]g[!H]S[%g]H[!gHLS] [%gHLS]
7[%q]W[7T]q[%W]T[7i]W[%T]i[7O]T[%i]O
[7S]i[%O]S[7g]O[%S]g[7H]S[%g]H[7gHLS] [%gHLS]
6[6Q]e[6T]T[6I]p[6S]S[6G]j[6GjLS] [6GjLS]
4[4W]r[4T]T[4O]a[4S]S[4H]k[4HkLS] [4HkLS]
[$GjLS]TeT[QS]TeTQTeT[pQ]Te[IT]
[iW]ITO[Ir]T[iW]TrTWT[ir]T[SW]Tr[iT]
[eO]TeT[eI]TeTeT[eI]T[eS]Te[IT]
[pq]TqT[Oq]TqTqT[Oq]T[qS]Tq[OT]
[pQ]SpS[IT]SpSISpS[eI]Sp[QS]
[OQ]SaS[Oq]SaSOS[aq]S[OT]Sa[qS]
[IW]SpS[IQ]SpSIS[pQ]S[IT]Sp[QS]
[IQ]d[pQ]d[Iy]dp[dQ][pQ]d[Qs]d[py]ds[dQ]
[ow]dad[9o]dadodad[7o]da[5d]
[5p]dsd[$p]dsdpd[$s]d[9p]ds[$d]
[6o]dad[5o]dadod[5a]d[9o]da[5d]
[$O]dad[4O]SaSOS[4a]S[O]Sa[4S]
[$I]S[$p]S[6I]S[$p]S[2I]G[2p]G[$I]G[2p]G
[1I]G[DO]GIG[DO]GIG[1DO]G[@I]G[1DO]G
[!u]f[!S]f[3u]f[!S]f[6u]f[6S]f[!u]f[6S]f
[$Y]D[$S]D[6Y]D[$S]D[5Y]D[5S]D[^Y]D[5S]D
[%DsY]%%%[%O]%%%%%%%[%p]%[%O]%
[%eIT]%%%[%O]%[%I]%[%ruW]%%%[%I]%[%u]%
[%eQY]%%%[%u]%[%Y]%[%0TW]%%%[%Y]%[%T]%
[(%Qt]%%%%%%%[%0T]%%%%%%%
[%8][%W][%Y]%[%H]%%%%%[%H]%[%j]%[%H]%
[%G]%[%GpS]%[%aDH]%[%GpS]%[%afO]%[%afO]%[%GpS]%[%afO]%
[%DIp]%[%DIp]%[%afO]%[%DIp]%[%OSu]%[%OSu]%[%DIp]%[%OSu]%
[%IsY]%%%%%%%[%STu]%%%%%%%
[%t]I%D%%%%%%%%%%[%STu]%%%
[%IsY]%%%[%IsY]%%%[%STu]%%%[%STu]%%%
[%t]I%D%%%%%%%%%%[%Tu]%[%S]%
[%IY]%[%s]%[%IY]%[%s]%[%Tu]%[%S]%[%Tu]%[%S]%
[%It]%[%D]%[%It]%[%D]%[6Tu]6[6S]6[6Tu]6[6S]6
[$epTY]----
[%OtWY]----
!%[%]0[!W][%0]W[!T]0[%W]T[!u]W[%T]u
[!O]T[%u]O[!S]u[%O]S[!f]O[%S]f[!fHOS] [%fHOS]
1%[%8]([1W]8[(%]W[1t]([%W]t[1Y]W[%t]Y
[1O]t[%Y]O[1s]Y[%O]s[1D]O[%s]D[18DHOs] [%DHOs]
7[%q]W[7T]q[%W]T[7i]W[%T]i[7O]T[%i]O
[7S]i[%O]S[7g]O[%S]g[7H]S[%g]H[7gHLS] [%gHLS]
6[6Q]e[6T]T[6I]p[6S]S[6G]j[6GLS] [6GLS]
6[06]w[6T]T[6u]o[6S]S[6f]h[6hLS] [6hLS]
[%Hls] [OtW]H[Ot]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[OtW]H[PT]H[sY]H[Su]H[DI]H[sY]H
[DI]H[Su]H[Gp]H[fO]H[DI]H[Su]H[sY]H[pT]h
[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h[OtW]H[pTW]h
[HOtW]-[%W]----
W0W[O]W0WW0W[u]W0[TW]
[(t]TWY[QT]W[(t]WQW(W[Qt]W[(O]WQ[tW]
[0Y]W0W[0T]W0W0W[0T]W[0O]W0[TW]
[8u]W8W[8Y]W8W8W[8Y]W[8O]W8[WY]
[u]W[0HO]WW[0HO]WW[0HO]W[fu]W[0ST]W
[(ST]W[Qst]W(W[Qst]W(W[Qst]W[(HO]W[Qst]W
[0DY]W[0ST]W0W[0ST]W0W[0ST]W[0HO]W[0ST]W
[8fu]W[8DY]W8W[8DY]W8W[8DY]W[8HO]W[8DY]W
[7gi]WW7WW[6GI]QQ6QQ
[6DY]fQDf7DSQD[%fu]070%070%070
[5ST]0605060[$dy]969$969
[$st]S(sS%sP(s[3ST]%3%3%
[$69dIpQy]----paSdfGf
[deQy]paSdfGf[deQy]paSdfGf
[deQy]paS[deQy]fGh[ejQy]Hkj[ehQy]Gfd
[SW]uTuWuTu[DW]fIDftDfIDfWDfIDftDSID
[eSTu]-[$269eQy]--erTyuIu
yerT[$69y]uIuyerT[$69y]uIu
ye[$69r]Tyu[$69I]opa[$69S]dfG[$69h]H
[$jp]969$969[5ST]0^050^0
[%fu]00%00[%8Qt]%5%5%5%
[!0T] [uW] [uW] [uW] [uW] [uW] [(WY] [0TW]
[%QtW] [OQtW] [OQtW] [OQtW] [OQtW] [OQtW] [0OTW] [(OWY]
[!Ou] [uW] [uW] [uW] [uW] [uW] [(WY] [0TW]
[%QtW] [OQtW] [OQtW] [OQtW] [OQtW] [OQtW] [0OTW] [(OWY]
[!Ou] [0Ou] [0Ou] [0TuW] $ [IpQ] [IpQ] [eIQT]
% [0Ou] [0Ou] [0TuW] % [(8OY] [(8OY] [(tWY]
[!Tu] [fOuW] [fOuW] [fOuW] [fOuW] [fOuW] [(DIWY] [0STuW]
[%QstWY] [DIlsW] [DIlsW] [DIlsW] [DIlsW] [DIlsW] [fLSuW] [DGWYZ]
[!fHx] [fOuW] [fOuW] [fOuW] [fOuW] [fOuW] [(DIWY] [0STuW]
[%QstWY] [DIlsW] [DIlsW] [DIlsW] [DIlsW] [DIlsW] [fLSuW] [DGWYZ]
[!fHx] [HLTu] [HLTu] [fHOu] Q [IjLT] [IjLT] [GIjp]
W [fHTu] [fHTu] [fOSu] Q [DHtY] [DHtY] [DOsY]
0 [HSTW] [HSTW] [fOTu] $ [eGpQ] [eGpQ] [deIy]
% [0fOW] [0fOW] [STuW] % [(DIQ] [(DIQ] [QstY]
[!Su]%!%!%[!u]%[T]
[!t](%([!OQt](%([!OQt](%([!OQt](%(
[!0]TO%!%!%[!f]%[S]
[!s](%([!HIs](%([!HIs](%([!HIs](%(
[!u]SH%!%[!I]s(H%(!(%(
[!u]SH%!%[!I]s(H%(!(%(
[!0][T][%W][T][!0][T][%W][T][!0][T][%W][T][!0][T][%W][T]
[7q][7T][!W][7T][7q][7T][!W][7T][7q][7T][!W][7T][7q][7T][!W][7T]
[6eQT][$Q]e[6T]Q[$e]T[6I]e[$T]I[6p]T[$I]p
[6S]I[$p]S[6G]p[$S]G[6j]S[$G]j[6GjLS] [$GjLS]
%[03]W[%T]0[3W]T[%u]W[3T]u[%O]T[3u]O
[%S]u[3O]S[%f]O[3S]f[%H]S[3f]H[%fHLS] [3fHLS]
5 0wET 5^!35 TuoPS 5^0
w SfhJ[ELTuw]----
$ 68(Qe $61@$ etYIp $68(
QpsD[ejQtY]----
OuO[TW]OuOTOuO[0T]Ou[O]
[Y]OIO[8Y]OIOYO[8I]O[WY]OI[8O]
[(T]OuO[T]OuOTO[u]O[TW]Ou[O]
[0t]OIO[(t]OIOtO[(I]O[tW]OI[(O]
[0OTu]W0W[0HO]W0W0W0W[0fu]W0[STW]
[QST]WQW[Qst]WQWQW[Qst]W[HOQ]WQ[stW]
[0DY]W0W[0ST]W0W0W[0ST]W[0HO]W0[STW]
[8fu]W8W[8DY]W8W8W[8DY]W[8HO]W8[DWY]
[GI]W[fu]W[LS]W[fu]W[7GI][7gi][7LS][7gi]
[6HO][6GI][6LS][6GI][4jp][4HO][4LS][4HO]
[!$j]GSpITpITeQ
eQ6QeTIpSGjGSp
[$2j]GdpIypIyeQ9
eQ969QeyIpdGjGdp
[!5L]JhfSPfSPouTE
uTEw00wETuoPSfhJLJf
[!%x]LHfSOfSOuSOu
TOuTWuTW0TW0W0
%6^789(0qQwWeEr
tTyYuiIoOpPasSdDfgGhH
[IjtW]kjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjk
H G f D G S s D
p O I p u Y I T
t Y e W Q e 0 (
Q * 8 (-6-%-
[5]----
[%]----
[!]%!%!%[!u]
%[T][!t](%([!OQt](%([!OQt](%([!OQt](
%([!0]TO%!%!%[!f]
%[S][!s](%([!HIs](%([!HIs](%([!HIs](
%([!u]SH%!%[!I]s(H%(!(
%([!u]SH%!%[!I]s(H%(!(
%([!%Y]SH[0u][OW][ST][fu][OW][ST][fu][HO][ST][fu][HO][LS][fu]
[HO][LS][fx][LS][HO][fu][LS][HO][fu][ST][HO][fu][ST][OW][fu][ST]
[OW][0u][ST][OW][0u][*T][OW][0u][T][%W][0u][T][%W][03][T][%W]
[03][%W][!]--[!%3fHLS]--
[!%3OSTu]
]]
}

local KeyMap = {
[" "] = "Space",
["\n"] = "Return",
["\t"] = "Tab",

["0"] = "Zero",
["1"] = "One",
["2"] = "Two",
["3"] = "Three",
["4"] = "Four",
["5"] = "Five",
["6"] = "Six",
["7"] = "Seven",
["8"] = "Eight",
["9"] = "Nine",

["-"] = "Minus",
["="] = "Equals",
["["] = "LeftBracket",
["]"] = "RightBracket",
[""] = "BackSlash",
[";"] = "Semicolon",
["'"] = "Quote",
[","] = "Comma",
["."] = "Period",
["/"] = "Slash",
["`"] = "Backquote"

}

local ShiftChars = {
["!"] = "One",
["@"] = "Two",
["#"] = "Three",
["$"] = "Four",
["%"] = "Five",
["^"] = "Six",
["&"] = "Seven",
["*"] = "Eight",
["("] = "Nine",
[")"] = "Zero",
["_"] = "Minus",
["+"] = "Equals",
["{"] = "LeftBracket",
["}"] = "RightBracket",
["|"] = "BackSlash",
[":"] = "Semicolon",
['"'] = "Quote",
["<"] = "Comma",
[">"] = "Period",
["?"] = "Slash",
["~"] = "Backquote"
}

local function GetKeyCode(char)
if ShiftChars[char] then
return Enum.KeyCode[ShiftChars[char]], true
end

if KeyMap[char] then
return Enum.KeyCode[KeyMap[char]], false
end

if char:match("%a") then
return Enum.KeyCode[char:upper()], char ~= char:lower()
end

return nil, false

end

local function PressKey(char)
local KeyCode, Shift = GetKeyCode(char)

if not KeyCode then
return
end

if Shift then
VirtualInputManager:SendKeyEvent(
true,
Enum.KeyCode.LeftShift,
false,
game
)
end

VirtualInputManager:SendKeyEvent(
true,
KeyCode,
false,
game
)

VirtualInputManager:SendKeyEvent(
false,
KeyCode,
false,
game
)

if Shift then
VirtualInputManager:SendKeyEvent(
false,
Enum.KeyCode.LeftShift,
false,
game
)
end

end

local function PressChord(Text)
local Keys = {}

for Character in Text:gmatch(".") do
local KeyCode, Shift = GetKeyCode(Character)

if KeyCode then
table.insert(Keys, {
KeyCode = KeyCode,
Shift = Shift
})
end

end

local NeedsShift = false

for _, Key in ipairs(Keys) do
if Key.Shift then
NeedsShift = true
break
end
end

if NeedsShift then
VirtualInputManager:SendKeyEvent(
true,
Enum.KeyCode.LeftShift,
false,
game
)
end

for _, Key in ipairs(Keys) do
VirtualInputManager:SendKeyEvent(
true,
Key.KeyCode,
false,
game
)
end

for i = #Keys, 1, -1 do
VirtualInputManager:SendKeyEvent(
false,
Keys[i].KeyCode,
false,
game
)
end

if NeedsShift then
VirtualInputManager:SendKeyEvent(
false,
Enum.KeyCode.LeftShift,
false,
game
)
end

end

local function ParseSong(Text)
local Events = {}
local i = 1

while i <= #Text do
local Character = Text:sub(i, i)

if Character == "[" then
local Closing = Text:find("]", i + 1)

if Closing then        
    local Chord = Text:sub(i + 1, Closing - 1)        
    Chord = Chord:gsub("%s+", "")        

    if #Chord > 0 then        
        table.insert(Events, {        
            Type = "Chord",        
            Value = Chord        
        })        
    end        

    i = Closing + 1        
else        
    i += 1        
end

elseif Character == "-" then
table.insert(Events, {
Type = "Delay",
Value = 0.1
})

i += 1

elseif Character:match("%s") then
i += 1

else
table.insert(Events, {
Type = "Key",
Value = Character
})

i += 1

end

end

return Events

end

local function GetNoteDelay()
return 30 / CurrentBPM
end

local function PlaySong(Text)
local Events = ParseSong(Text)

for _, Event in ipairs(Events) do
if not Playing then
break
end

if Event.Type == "Key" then
PressKey(Event.Value)
task.wait(GetNoteDelay())

elseif Event.Type == "Chord" then
PressChord(Event.Value)
task.wait(GetNoteDelay())

elseif Event.Type == "Delay" then
task.wait(Event.Value)
end

end

end

local function GetSelectedSong()
if PlaybackMode == "Preset song" then
return PresetSongs[SelectedPreset] or ""
end

return SongText

end

MainTab:CreateDropdown({
Name = "Playback source",
Options = {
"Custom song",
"Preset song"
},
CurrentOption = {"Custom song"},
MultipleOptions = false,
Flag = "PlaybackSource",
Callback = function(Value)
if type(Value) == "table" then
PlaybackMode = Value[1] or "Custom song"
else
PlaybackMode = Value
end
end
})

MainTab:CreateInput({
Name = "Ur own song",
CurrentValue = "",
PlaceholderText = "[y e] a-s-d [q @]!",
RemoveTextAfterFocusLost = false,
Flag = "OwnSong",
Callback = function(Value)
SongText = Value
end
})

MainTab:CreateSlider({
Name = "Playback bpm",
Range = {50, 220},
Increment = 1,
Suffix = " BPM",
CurrentValue = 100,
Flag = "PlaybackBPM",
Callback = function(Value)
CurrentBPM = Value
end
})

MainTab:CreateToggle({
Name = "Auto Piano Playback",
CurrentValue = false,
Flag = "AutoPianoPlayback",
Callback = function(Value)
Playing = Value

if Value then
local SelectedSong = GetSelectedSong()

if SelectedSong ~= "" then
task.spawn(function()
PlaySong(SelectedSong)

if Playing then        
            Playing = false        
        end        
    end)        
else        
    Playing = false        
end

end

end

})

local SelectedSongLabel = PresetTab:CreateLabel(
"Currently selected: " .. SelectedPreset
)

PresetTab:CreateDropdown({
Name = "Choose Song",
Options = {
"Golden-brown-easy.fil3",
"Golden-Brown.fil3",
"tetris-theme.fil3",
"Meant-to-be-cutntsniffer.fil3",
"Fur-elis_easy.e.fil3",
"fur-elise.fil3",
"MLight-Sonata-Beethoven1.e.fil3",
"MLight-Sonata-Beethoven(1).e.fil3",
"MLight-Sonata-Beethoven(2).e.fil",
"MLight-Sonata-Beethoven(3).e.(efil)3",
"MLight-Sonata-Beethoven(3)orig.fil3",
"Rush-E.easy-fil.3",
"Rush-E.fil3"
},
CurrentOption = {"Golden-brown-easy.fil3"},
MultipleOptions = false,
Flag = "PresetSong",
Callback = function(Value)
if type(Value) == "table" then
SelectedPreset = Value[1] or SelectedPreset
else
SelectedPreset = Value
end

SelectedSongLabel:Set(
"Currently selected: " .. SelectedPreset
)
end

})

PresetTab:CreateParagraph({
Title = "Preset Playback",
Content = "Select a song here, choose 'Preset song' as the Playback source on the Main tab, then enable Auto Piano Playback. The BPM slider applies to every preset."
})
