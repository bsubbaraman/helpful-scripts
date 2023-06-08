# make big pdfs smaller

# Pipe output to txt file.
exec 2>&1

# Enter the first file's directory.
current_path=$(dirname "$1")
cd "$current_path"

# For every selected file, compress it
for f in "$@"
do
	filenameNoExt=${f%.*}
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$filenameNoExt-small.pdf" "$f"
done

exit 0