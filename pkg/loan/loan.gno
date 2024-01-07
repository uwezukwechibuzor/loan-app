package loan

import (
	"std"
	"time"
)

// Loan represents a loan instance
type Loan struct {
	ID         uint64        // Loan identifier
	Amount     string        // Loan amount
	Fee        string        // Fee associated with the loan
	Collateral string        // Collateral for the loan
	Deadline   time.Time     // Loan repayment deadline
	State      string        // Current state of the loan (e.g., "pending", "approved", "repaid")
	Borrower   std.Address   // Address of the borrower
	Lender     std.Address   // Address of the lender
	Repaid     bool          // Flag indicating whether the loan has been repaid
}

// NewLoan creates a new Loan instance from arguments
func NewLoan(id uint64, amount, fee, collateral string, deadline time.Time, state string, borrower, lender std.Address, repaid bool) *Loan {
	return &Loan{
		ID:         id,
		Amount:     amount,
		Fee:        fee,
		Collateral: collateral,
		Deadline:   deadline,
		State:      state,
		Borrower:   borrower,
		Lender:     lender,
		Repaid:     repaid,
	}
}

// GetLoanID returns the ID of the loan
func (l *Loan) GetLoanID() uint64 {
	return l.ID
}

// GetLoanAmount returns the amount of the loan
func (l *Loan) GetLoanAmount() string {
	return l.Amount
}

// GetLoanFee returns the fee associated with the loan
func (l *Loan) GetLoanFee() string {
	return l.Fee
}

// GetLoanCollateral returns the collateral for the loan
func (l *Loan) GetLoanCollateral() string {
	return l.Collateral
}

// GetLoanDeadline returns the loan repayment deadline
func (l *Loan) GetLoanDeadline() time.Time {
	return l.Deadline
}

// GetLoanState returns the current state of the loan
func (l *Loan) GetLoanState() string {
	return l.State
}

// GetBorrowerAddress returns the address of the borrower
func (l *Loan) GetBorrowerAddress() std.Address {
	return l.Borrower
}

// GetLenderAddress returns the address of the lender
func (l *Loan) GetLenderAddress() std.Address {
	return l.Lender
}

// IsLoanRepaid checks if the loan has been repaid
func (l *Loan) IsLoanRepaid() bool {
	return strings.Compare(l.GetLoanState(), "REPAID") == 0 && l.Repaid
}

// IsLoanApproved checks if the loan has been approved
func (l *Loan) IsLoanApproved() bool {
	return strings.Compare(l.GetLoanState(), "APPROVED") == 0
}

// IsLoanPending checks if the loan is in a pending state
func (l *Loan) IsLoanPending() bool {
	return strings.Compare(l.GetLoanState(), "PENDING") == 0
}

// GetLoanByID returns the loan using the ID
func (l *Loan) GetLoanByID(id string) *Loan {
	loan, found := l.Get(id)
	if !found {
		return nil
	}

	return loan.(*loan)
}

// GetLoans returns all loan
func (l * Loan) GetLoans() []*Loan {
	loans := make([]*Loan, l.Size())

	index := 0
	l.Iterate("", "", func(n *avl.Node) bool {
		loans[index] = n.Value().(*Loan)

		return false
	})

	return loans
}