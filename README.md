Till Program
------------

A ruby program to produce receipts based on a json price list.

The receipt must calculate and show the correct amount of tax, as well as correct line totals and total amount.

To download and run tests:
```
$ git clone https://github.com/vickymg/till_program.git
$ cd till_program
$ bundle
$ rspec
```

Example receipt & user stories:

<img style="float:right" padding: 5px src="/images/receipt.jpg" />

```
As a coffee shop customer
So I can check the items I bought
I want to see a list of items purchased on a receipt

As a coffee shop customer
So I can see how many items I bought
I want to see the quantity of items purchased on a receipt

As a coffee shop customer
So I can see how much I spent on each item
I want to see the total cost spent on each one

As a coffee shop customer
So I can see how much tax I paid
I want to see tax calculated on the receipt

As a coffee shop customer
So I can see the total amount I spent overall
I want to see the total cost including tax

As a coffee shop customer
So I can see when I spent all my money
I want to see the date and time of purchase on the receipt

As a coffee shop customer
So I can see where I spent all my money
I want to see the location and details of the coffee shop on the receipt

As a coffee shop customer
So I can see how much change I received
I want to see the change total on the receipt

As a coffee shop customer
So I can see how much I saved on special offers
I want to see the discount total on the receipt
```
