Rscript.exe --encoding=UTF-8 "..\..\01_R scripts\generate_html_summary.R"
Rscript.exe -e "rmarkdown::render('index.Rmd')"
Rscript.exe valuebox.R