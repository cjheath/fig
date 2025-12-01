#
# Vanilla makefile for FIG: Fact Interchange Grammar
#

CXX	=	g++
CXXFLAGS =	-std=c++11

STRPP	=	../strpp

COPT	=	-DHAVE_PTHREADS # -DPEG_TRACE

DEBUG	=	-O2 $(COPT)
# DEBUG	=	-g $(COPT) -DUTF8_ASSERT
# DEBUG	=	-O2 $(COPT) -lprofiler
# DEBUG	=	-g -DTRACK_RESULTS $(COPT)

HDRS	=	\

SRCS	=	\
		fig.cpp

OBJS	=	$(patsubst %,%,$(SRCS:.cpp=.o))

LIBS	=	-L$(STRPP) -lstrpp

vpath	%.h	.:$(STRPP)/include
vpath	%.a	$(STRPP)

all:	strpp fig doc

fig:	Makefile peg_ast.h $(HDRS) $(SRCS) fig_parser.cpp
	$(CXX) $(DEBUG) $(CXXFLAGS) -I. -I$(STRPP)/include -I$(STRPP)/test -o $@ $(SRCS) $(STRPP)/test/memory_monitor.cpp $(LIBS)

# Regenerate fig_parser from fig.px:
fig_parser.cpp: px fig.px
	../px/px fig.px >fig_parser.cpp

# make grammar documentation:
doc:	fig-rr.html
fig-rr.html: px fig.px
	../px/px -r -x s fig.px > fig-rr.html

strpp:	
	$(MAKE) -C $(STRPP) lib

px:
	cd ../px; $(MAKE)

test:

tests:

clean:
	rm -f fig $(OBJS)
	rm -rf *.dSYM

clobber:	clean

.PHONY:	all strpp clean test tests clean clobber px strpp
