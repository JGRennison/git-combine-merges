## git-combine-merges
**Combines a linear sequences of merges into a single merge**  

### Usage:

    git combine-merges [options] commit

This replaces a linear sequence of merges from *commit* to HEAD,
with a single merge of *commit* and HEAD's second parent.  
*commit* must be an ancestor of HEAD's first parent.  
HEAD must be a merge with two parents.  
The merges replaced are those given by `git log --ancestry-path <commit>..HEAD`.  
The new merge has the same tree as HEAD.  
The new merge's commit message is HEAD's, plus any conflict
messages from the replaced merges.  
This does not touch the index or working tree.  
A warning is output if a replaced merge has a parent not reachable
from the new merge.

### Options:
* -e, --edit  
  edit commit message
* -b, --branch *branch*  
  replace all uses of HEAD with *branch*
* -s, --second-parent *commit2*  
  use *commit2* as the new merge's second parent, it must have the  
  same tree as HEAD's current second parent, unless -f/--force is used
* -o, --octopus-parent *commitN*  
  use commitN as the new merge's Nth parent (starting from third),  
  this option may be used more than once, the commit is not checked
* -f, --force  
  perform fewer checks, see -s/--second-parent
* -n, --dry-run  
  print the new commit hash instead of resetting HEAD
* -v, --verbose  
  be verbose
* -h, -?, --help  
  show help

### Examples:
```
Starting from:            `git combine-merges B` produces:
  D---E---F                 D---E---F
 /     \   \     --->      /         \
A---B---C---@             A---B-------@'

Starting from:            `git combine-merges B` produces:
    F----
   /     \                  D---F
  D---E   \      --->      /     \
 /     \   \              A---B---@'
A---B---C---@             and a warning about E

Starting from:            `git combine-merges --branch H B` then:
                          `git combine-merges --second-parent H' C` produces:
A---D---G                 A---D---G
     \   \                         \
--B---E---H      --->     --B-------H'
       \   \                         \
----C---F---@             ----C-------@'
```

### Dependencies:
* Perl 5:  
  * Proc::Hevy  
  * Getopt::Long  
  * File::Temp  
  * File::Slurp

### Shell completion:
A bash completion script is also included.

### URLs:
This project is hosted at https://github.com/JGRennison/git-combine-merges

### License:
New BSD License, see LICENSE.txt
