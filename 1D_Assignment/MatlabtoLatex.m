clear input;
fprintf('\n\nExample 2: generate a LaTex file from your data\n\n');

% some data
input.data = S; 

% we want a complete LaTex document
input.makeCompleteLatexDocument = 1;

% generate LaTex code
latex = latexTable(input);

% save LaTex code as file
fid=fopen('MyLatex.tex','w');
[nrows,ncols] = size(latex);
for row = 1:nrows
    fprintf(fid,'%s\n',latex{row,:});
end
fclose(fid);
fprintf('\n... your LaTex code has been saved as ''MyLatex.tex'' in your working directory\n')