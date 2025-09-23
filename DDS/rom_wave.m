width=8; depth=256; 
x=linspace(0,2*pi,depth); 
y_cos=cos(x); 
y_cos=round(y_cos*(2^(width-1)-1)); 
fid = fopen('D:\Asor_FM\cos1.coe','wt');
fprintf(fid,'memory_initialization_radix=10;\nmemory_initialization_vector = ');
for i = 1 : depth
 if mod(i-1,8) == 0 
 fprintf(fid,'\n');
 end
 fprintf(fid,'%6d,',y_cos(i));
end
fclose(fid);