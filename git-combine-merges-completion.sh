#!/bin/bash

############################################################################
# FILE:                git-combine-merges-completion                       #
# DESCRIPTION:         Bash completion for: git-combine-merges             #
# AUTHOR:              Jonathan G. Rennison <j.g.rennison@gmail.com>       #
# LICENSE:             New BSD License, see LICENSE.txt                    #
#                                                                          #
# Copyright © Jonathan G. Rennison 2016                                    #
############################################################################

_git_combine_merges ()
{
	case "$prev" in
	-b|--branch)
		__gitcomp_nl "$(__git_heads)" "" "${cur}"
		return
		;;
	esac
	case "$cur" in
	--branch=*)
		__gitcomp_nl "$(__git_heads)" "" "${cur#*=}"
		return
		;;
	--second-parent=*)
		__gitcomp_nl "$(__git_refs)" "" "${cur#*=}"
		return
		;;
	--*)
		__gitcomp "--edit --branch --second-parent --force --dry-run --help --verbose"
		;;
	*)
		__gitcomp_nl "$(__git_refs)"
		;;
	esac
}
