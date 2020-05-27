# README

To simulate the admin interface for administering customer details from rails console:-

- use "User.new({:email => "<valid-email address>", :password => "password", :password_confirmation => "password", :username => "<users name>"}).save" in order to create a new customer

- use "Account.new({:balance => <amount>, :user_id => <user_id from above>}).save" to create an account for the above user (supports multiple accounts for a user)

- to replicate creation of a transaction you can use below, however transactions are available within the app for a logged in user.
	"Transaction.new({:amount => 50, :payee_id => <account.id of payee>, :payer_id => <account.id of payer>}).save"


App functionality:-
- supports log in and log out but not sign up 
- will show all accounts for a logged in user and for each account for a user displays a complete transaction history.
- allows a user to transfer funds to another user providing they have sufficient credit and amount is not negative.
- will not allow a users balance to be less than zero.

