# README

To simulate the admin interface for administering customer details from rails console:-

- use "User.new({:email => "<valid-email address>", :password => "password", :password_confirmation => "password", :username => "<users name>"}).save" in order to create a new customer

- use "Account.new({:balance => <amount>, :user_id => <user_id from above>}).save"

- to replicate creation of a transation you can use
	"Transaction.new({:amount => 50, :payee_id => <account.id of payee>, :payer_id => <account.id of payer>}).save"