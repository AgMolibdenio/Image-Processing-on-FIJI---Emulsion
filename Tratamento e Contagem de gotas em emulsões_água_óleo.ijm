//Macro: drop acount in Emulsions

//Plugin return: Area, perimeter and diameter max e min
//Input: Your imag
//Output: A summary table 
//        A data tabela
//        A makk with de drops acounted by Fiji
//        The processed image

run("RGB Color");
//Remember to set your scale in "knowm ="
run("Set Scale...", "distance=1 known=0.06815 unit=µm global");

//Pré-treatment
run("Median...", "radius=3");
run("Unsharp Mask...", "radius=5 mask=0.8");
run("Median...", "radius=3");
run("8-bit");

//Processing - evaluate the Threshold method
setAutoThreshold("Default dark no-reset");
setOption("BlackBackground", true);
run("Convert to Mask");
//setAutoThreshold("Huang dark no-reset");
//run("Convert to Mask");

//Post-Prossecing
//run("Dilate");
run("Erode");
run("Dilate");

//Data aquisition
run("Set Measurements...", "area perimeter feret's redirect=None decimal=3");
run("Analyze Particles...", 
	"size=0.07-Infinity circularity=0.80-1.00 show=Outlines display exclude clear summarize");
	
//Obs: Compare the mask, the processed and the original image and evaluate if the method is good
