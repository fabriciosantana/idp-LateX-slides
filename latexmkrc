$pdf_mode = 1;

$ENV{'TEXINPUTS'} = "$ENV{'PWD'}/common/theme//:$ENV{'PWD'}/common/assets//:" . ($ENV{'TEXINPUTS'} || '');

$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error %O %S';
$out_dir = "$ENV{'PWD'}/build/pdf";
$aux_dir = "$ENV{'PWD'}/build/aux";
$clean_ext = 'bbl bcf blg nav run.xml snm toc vrb';
