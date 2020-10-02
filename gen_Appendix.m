clc, clear
cd("C:/Users/Melker/github/Database_course")
st = ["construct_" "add_" "querie_"];

name = "appendix.sql";

% get dir content
disp("diectionary content:")
d = dir();
for i = 1:length(d)
    disp("   "+d(i).name)
end
disp ' '

fid = fopen(name, "w");
fwrite(fid, "/*"+newline+...
    "___"+upper("appendix") + "___"+newline+...
    date()+newline+"*/"+newline+newline);
fclose(fid);


for i = 1:length(st)
    disp("copying '"+st(i)+"'")
    
    for j = 1:length(d)
        if regexp(d(j).name, "^("+st(i)+")")
            disp("   "+d(j).name )
            str = fileread( d(j).name );
            
            fid = fopen(name, "a");
            title(fid, d(j).name) % add title
            fwrite(fid, str ); % copy text
            fwrite(fid, string(newline));
            fwrite(fid, string(newline));
            
            fclose(fid);
        end
    end
end


function []=title(fid, t)
fwrite(fid, "/*___"+upper(t) + "___*/"+newline+newline);
end
