.PHONY: src

CC = xelatex
SRC_DIR = .
RESUME_DIR = resume
CV_DIR = cv
CL_DIR = cl
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CL_SRCS = $(shell find $(CL_DIR) -name '*.tex')

src: $(foreach x, cl cv resume, $x.pdf)

# This is for making a business card? Probably for email signature purposes only 
# card.pdf: $(CARD_DIR)/card.tex $(CARD_SRCS)
#      $(CC) -papersize=6in,4in -output-directory=$(CARD_DIR) $<

resume.pdf: $(RESUME_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(RESUME_DIR) $<

cv.pdf: $(CV_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(CV_DIR) $<

cl.pdf: $(CL_DIR)/cl.tex $(CL_SRCS)
	$(CC) -output-directory=$(CL_DIR) $<

clean:
	rm -rf $(SRC_DIR)/*.pdf  $(SRC_DIR)/$(RESUME_DIR)/*.pdf  $(SRC_DIR)/$(CV_DIR)/*.pdf  $(SRC_DIR)/$(CL_DIR)/*.pdf  
