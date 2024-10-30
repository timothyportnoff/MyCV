.PHONY: src

CC = xelatex
SRC_DIR = src
RESUME_DIR = src/resume
CV_DIR = src/cv
CL_DIR = src/cl
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CL_SRCS = $(shell find $(CL_DIR) -name '*.tex')

src: $(foreach x, cl cv resume, $x.pdf)

resume.pdf: $(RESUME_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(RESUME_DIR) $<

# card.pdf: $(CARD_DIR)/card.tex $(CARD_SRCS)
# 	$(CC) -papersize=6in,4in -output-directory=$(CARD_DIR) $<

cv.pdf: $(CV_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(CV_DIR) $<

cl.pdf: $(CL_DIR)/cl.tex $(CL_SRCS)
	$(CC) -output-directory=$(CL_DIR) $<

clean:
	rm -rf $(SRC_DIR)/*.pdf  $(SRC_DIR)/$(RESUME_DIR)/*.pdf  $(SRC_DIR)/$(CV_DIR)/*.pdf  $(SRC_DIR)/$(CL_DIR)/*.pdf  
