#Homework 3
#Prajakta C Deosthali
#1185340 
#Web programming I 
#Winter 2016 

#Global variable declaration 
%phonedata; 
$html2;

#calling subroutines  
readData(); 
buildSVG();
writeToHTML();

#read data from csv file
sub readData(){ 
#open the file 
 open (CELLPHONE, "cell-phones.csv") or die; 
#read file line by line 
 while ($line = <CELLPHONE>) {
      if (!($line =~ m/#/)){ 
	($university, $type, $count) = split (",", $line);    
    if (exists $phonedata{$type}){   
        $temp = $phonedata{$type};    
        $phonedata{$type} = $temp +  $count + 0.0;            
    }
    else{   
       $phonedata{$type} = $count ; 
    }
   }
} 
#close the file  
close(CELLPHONE);
}
  
sub buildSVG(){
#local variables 
$yTemp = 100;
$yTextTemp = 125;
$total;

#calculate total number of users 
while (($key, $value) = each %phonedata){
$total = $total + $value; 
}

#create svg rectangles 
while(($key, $value) = each %phonedata){

$html2 = $html2.'<rect height="50" width="'.$total.'" x="500" y="'.$yTemp.'" style="fill:gold" />
<rect height="50" width="'.$value.'" x="500" y="'.$yTemp.'" style="fill:goldenrod; opacity:0.5" />
<text  style="text-transform:uppercase; font-size:15px" x="425" y="'.$yTextTemp.'" fill="black">'.$key.'</text>';

$yTemp = $yTemp + 75;
$yTextTemp = $yTextTemp + 75;
}

} 
 
sub writeToHTML(){

#html element part 1
$html1 = qq {
<!DOCTYPE html>
<html>
<head><title>Cell-phone Usage</title></head>
<body style="background-color:gainsboro">
<h1 style="text-align:center">Cell-phone Usage</h1>
<svg width="2000" height="1000"> 
};

#html element part 3
$html3 = qq{
</svg>
</body>
</html>
};
#create a file 
open ( my $fh, '>',  "cell-phones_1185340.html") or die "Could not open the file";

#print all html parts in file 
print $fh $html1;
print $fh $html2;
print $fh $html3;

#close the file 
close($fh);
} 

   
    


