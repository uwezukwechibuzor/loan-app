package loan

import (
	"std"
	"gno.land/p/demo/avl"
	"time"
)

// LoanContract represents a smart contract for handling loan app
type LoanContract struct {
	// State variables for the smart contract
	loan avl.Tree // Loan
	// Additional state variables as needed
}

// Loan represents a loan instance
type Loan struct {
	ID         uint64
	Amount     string
	Fee        string
	Collateral string
	Deadline   time.Time
	State      string
	Borrower   std.Address
	Lender     std.Address
	Repaid     bool
}

// NewLoanContract creates a new instance of the LoanContract
func NewLoanContract() *LoanContract {
	return &LoanContract{
		loan: avl.Tree{},
		// Initialize other state variables as needed
	}
}

// RequestLoan allows a borrower to request a new loan
func (c *LoanContract) RequestLoan(amount, fee, collateral string, deadline time.Time, borrower std.Address) *Loan {

	// include checks for the borrower's collateral

	// Create a new loan
	requestLoan := &Loan{
		ID:         uint64(c.loan.Size() + 1),
		Amount:     amount,
		Fee:        fee,
		Collateral: collateral,
		Deadline:   deadline,
		State:      "Pending",
		Borrower:   borrower,
	}

	// Add the loan to the AVL tree
	c.loan.Set(requestLoan.ID, requestLoan)

	return requestLoan
}