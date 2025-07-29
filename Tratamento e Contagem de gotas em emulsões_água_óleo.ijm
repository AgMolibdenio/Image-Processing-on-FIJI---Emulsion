//Macro de contagem de gotas em emulsões

//Plugin retorna: Área, perímetro e diametro max e min
//Será dado: Uma tabela de resumo 
//           Uma tabela com os dados
//           Uma máscara com as contagens feitas
//           A imagem tratada

run("RGB Color");
run("Set Scale...", "distance=1 known=0.06815 unit=µm global");

//Pré tratamento
run("Median...", "radius=3");
run("Unsharp Mask...", "radius=5 mask=0.8");
run("Median...", "radius=3");
run("8-bit");

//Segmentação
setAutoThreshold("Default dark no-reset");
setOption("BlackBackground", true);
run("Convert to Mask");
//setAutoThreshold("Huang dark no-reset");
//run("Convert to Mask");

//Pós tratamento
//run("Dilate");
run("Erode");
run("Dilate");

//Análise e aquisição de dados
run("Set Measurements...", "area perimeter feret's redirect=None decimal=3");
run("Analyze Particles...", 
	"size=0.07-Infinity circularity=0.80-1.00 show=Outlines display exclude clear summarize");
	
//Obs: Avaliar se o método foi bom para sua imagem