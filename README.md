# Kata: Phone Numbers

In a consistent phone list no number is a prefix of another. For example:

* Bob:91125426  
* Alice: 97 625 992  
* Emergency: 911  

In this case, it is not possible to call Bob because the phone exchange would direct your call to the emergency line as soon as you dialled the first three digits of Bob’s phone number, so this list would not be consistent.  

## Purpose

* Given a list of phone numbers, determine if it is consistent  
* Do this kata in a functional style, without using any loops  

# Retrospective Discussion

* Look at the algorithm you’ve chosen. How will it perform as the size of the phone book increases? Can you come up with a more efficient algorithm?
* Have you written functionality to look up someone’s phone number from their name?  
* Will your code still work if you change the order of the entries in the list?  

## Test Data

This repo contains some sample data you could use to help test your solution to the Phone Numbers kata. It also contains the python script used to create the sample data. You can tweak it to create data that suits your needs.  

To run the generate_data.py script, you'll need to install Python 3.  

The Names.csv file is from "Generating Random Names as Test Data", and that page says it is adapted from US census data. I have just converted his file from excel to csv to make it easier to handle.  

