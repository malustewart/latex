echo off


mkdir %1
chdir %1
mkdir extra
chdir extra
CALL:PREAMBLEFILE
CALL:FRONTPAGEFILE
chdir ..
CALL:MAINFILE %1



FOR %%A IN (%*) DO IF "%%A" == "%1" (
        echo.
    ) ELSE (
        CALL:SUBFILE %%A %1
        (
        echo.
        echo \let\oldinput=\input
        echo \def\input#1{\oldinput{%%A/#1}}	
        echo \subfile{%%A.tex}
        echo \let\input=\oldinput
        echo.
        )>>"%1.tex"
        (
        echo {%%A/figures/}{%%A/}
        ) >> "extra/preamble.tex"
    )

echo \end{document} >> "%1.tex"
echo } >> "extra/preamble.tex"



chdir ..

GOTO:EOF



::::::::::::::::::::::::::::::::::::::::::::::::
:SUBFILE
mkdir %1\figures

(
echo \documentclass[../%2.tex]{subfiles}
echo \begin{document}
echo Secci\'on %1
echo \end{document}
)>"%1\%1.tex"

GOTO:EOF




::::::::::::::::::::::::::::::::::::::::::::::::
:MAINFILE
(
echo \documentclass[spanish]{article}
echo \makeatletter 
echo \def\input@path{{../}} 
echo \makeatother
echo \input{extra/preamble.tex}
echo. 

echo \begin{document}
echo.

echo \input{extra/frontpage.tex}
echo.

)>%1.tex

GOTO:EOF




::::::::::::::::::::::::::::::::::::::::::::::::
:PREAMBLEFILE
(
echo \usepackage{graphicx}
echo \usepackage{subfiles}
echo \graphicspath{ ) > "preamble.tex"

GOTO:EOF

::::::::::::::::::::::::::::::::::::::::::::::::
:FRONTPAGEFILE
(
echo \begin{titlepage}
echo Car\'atula
echo \end{titlepage}
)>"frontpage.tex"

GOTO:EOF