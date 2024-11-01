.PHONY: src

# Compiler: XeTeX
CC = xelatex
CC_FLAGS = -quiet

# Document Directories
RESUME_DIR = resume
CARD_DIR = card
CV_DIR = cv
CL_DIR = cl

#Locate Document `.tex`
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CARD_SRCS = $(shell find $(CARD_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CL_SRCS = $(shell find $(CL_DIR) -name '*.tex')

# ?????? What this line do???
src: $(foreach x, cl cv resume card, $x.pdf)

card.pdf: $(CARD_DIR)/card.tex $(CARD_SRCS)
	$(CC) $(CC_FLAGS) -papersize=6in,4in -output-directory=$(CARD_DIR) $<

resume.pdf: $(RESUME_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) $(CC_FLAGS) -output-directory=$(RESUME_DIR) $<

cv.pdf: $(CV_DIR)/cv.tex $(CV_SRCS)
	$(CC) $(CC_FLAGS) -output-directory=$(CV_DIR) $<

cl.pdf: $(CL_DIR)/cl.tex $(CL_SRCS)
	$(CC) $(CC_FLAGS) -output-directory=$(CL_DIR) $<

#.pdf, .tex, and .aux files will be regenerated automatically.
clean:
	rm -rf $(RESUME_DIR)/*.pdf  $(CV_DIR)/*.pdf  $(CL_DIR)/*.pdf  $(CARD_DIR)/*.pdf 
	rm -rf $(RESUME_DIR)/*.log  $(CV_DIR)/*.log  $(CL_DIR)/*.log  $(CARD_DIR)/*.log
	rm -rf $(RESUME_DIR)/*.aux  $(CV_DIR)/*.aux  $(CL_DIR)/*.aux  $(CARD_DIR)/*.aux

