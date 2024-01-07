package loan

import (
	"gno.land/p/demo/avl"
)

// State variables
var (
	loanTree *avl.Tree
)

// Constructor
func init() {
	loanTree = avl.NewTree()
}