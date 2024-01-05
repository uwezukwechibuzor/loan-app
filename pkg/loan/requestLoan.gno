package loan

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