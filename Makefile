# Produce PDFs from all Markdown files in a directory
# Lincoln Mullen | http://lincolnmullen.com | lincoln@lincolnmullen.com
# AMR Monday, June 6, 2016 at 8:59:31 AM. Modified to use `md2pdf` instead of `pandoc` for producing pdf from syllabus files.

# List files to be made by finding all *.md files and appending .pdf
HTMLS := $(patsubst %.md,%.html,$(wildcard *.md))

# The all rule makes all the PDF files listed
all : $(HTMLS)

# Make HTMLs
%.html : %.md
	pandoc -c GitHub2.css $< -o $@ 
#	md2html $< -o $@

# Remove all PDF outputs
clean :
	trash $(PDFS)

# Remove all PDF outputs then build them again
rebuild : clean all
