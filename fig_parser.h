#if !defined(FIG_PARSER_H)
#define FIG_PARSER_H

#include	<strval.h>
#include	<variant.h>
#include	<peg.h>
#include	<peg_ast.h>

class FigParser
: public Peg<PegMemorySource, PegMatch, PegContext>
{
	static	Rule	rules[];
	static	int	num_rule;
public:
	FigParser() : Peg(rules, num_rule) {}
};
#endif // FIG_PARSER_H
