param($dir)

write-host 'extracting msi...' -nonewline

start msiexec -arg '/a', "$dir\setup.msi", '/qn' -wait
cp $dir\Windows32\* $dir -r -force
rm $dir\Windows32 -r -force

rm $dir\setup.msi

write-host 'done'
