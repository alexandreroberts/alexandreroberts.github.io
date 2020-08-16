# List files to be made by finding all *.md files and appending .pdf
HTMLS := $(patsubst %.md,%.html,$(wildcard *.md))

# The all rule makes all the PDF files listed
all : $(HTMLS)

# Make HTMLs
%.html : %.md
	pandoc --standalone --email-obfuscation=javascript -c pubwebsite.css $< -o $@ 
#	md2html $< -o $@

# Remove all PDF outputs
clean :
	trash $(PDFS)

# Remove all PDF outputs then build them again
rebuild : clean all
