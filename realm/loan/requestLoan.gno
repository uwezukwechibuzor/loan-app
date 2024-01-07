package loan

import (
	"gno.land/p/demo/ufmt"
	"gno.land/p/demo/loan"
)

// RequestLoan allows a borrower to request a new loan
func RequestLoan(amount, fee, collateral string, deadline time.Time, borrower std.Address) *Loan {

	// include checks for the borrower's collateral

	// Create a new instance
	requestLoan := loan.NewLoan{
		ID:         loanTree.Size(),
		Amount:     amount,
		Fee:        fee,
		Collateral: collateral,
		Deadline:   deadline,
		State:      "Pending",
		Borrower:   borrower,
	}

	// Add the loan to the AVL tree
	loanTree.Set(ufmt.Sprintf("%d", requestLoan.ID), requestLoan)

	return requestLoan
}