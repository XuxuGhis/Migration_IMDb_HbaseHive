@echo off

set file=C:\Users\Sunny\Desktop\title_basics.tsv

set members=for /f "tokens=1-9 delims=;" %%A in (%file) do (set members=!members! + "%%A")

for /f "tokens=1-9 delims=;" %%A in (%file%) do (
echo put table_imdb "%%F+%%I+%%D", "%%A:titleType", "%%B"
echo put table_imdb "%%F+%%I+%%D", "%%A:primaryTitle", "%%C"
echo put table_imdb "%%F+%%I+%%D", "%%A:originalTitle", "%%D"
echo put table_imdb "%%F+%%I+%%D", "%%A:colisAdult", "%%E"
echo put table_imdb "%%F+%%I+%%D", "%%A:startYear", "%%F"
echo put table_imdb "%%F+%%I+%%D", "%%A:endYear", "%%G"
echo put table_imdb "%%F+%%I+%%D", "%%A:runtimeMinutes", "%%H"
echo put table_imdb "%%F+%%I+%%D", "%%A:genres", "%%I"
)
