@echo off

set file=C:\Users\Sunny\Desktop\title_basics.tsv

set members=for /f "tokens=1-9 delims=;" %%A in (%file) do (set members=!members! + "%%A")

for /f "tokens=1-9 delims=;" %%A in (%file%) do (
echo put table_imdb "%%A", "col1:titleType", "%%B"
echo put table_imdb "%%A", "col2:primaryTitle", "%%C"
echo put table_imd originalTitle:""%%D", isAdult:"%%E", startYear:"%%F", endYear:"%%G", runtimeMinutes:"%%H", genres:"%%I"
)