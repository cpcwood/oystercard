# Oystercard Challenge
--------

### Outline

Makers Academy pairs programming challenge to create an commandline ruby application which emulates an oystercard system, including adding balance, touching in and out, journey history, and penalty fares. The application must be created using TDD with the RSpec gem, testing for object behaviour, and covering edge cases.

### How to Install & Example

The application is run directly from the command line, so to install simply clone or fork the repository, change directory to the root folder, open irb, and paste the following code:
```
require './lib/oystercard.rb'
require './lib/station.rb'
```
Alternatively, run *rspec* to see the test documentation or the example script to see an overview of the program functionality.

### Customer Requirements

```
In order to use public transport
As a customer
I want money on my card
```
```
In order to keep using public transport
As a customer
I want to add money to my card
```
```
In order to protect my money
As a customer
I don't want to put too much money on my card
```
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
```
In order to get through the barriers
As a customer
I need to touch in and out
```
```
In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey
```
```
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete
```
```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```
```
In order to know where I have been
As a customer
I want to see to all my previous trips
```
```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in
```
```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out
```
```
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
--------

### Objects Attributes
* Oystercard
    - @balance         - money on card
    - @journeylog      - history of all journeys
    - MAX_LIMIT        - max limit of balance
    - MIN_LIMIT        - min limit to enter station
    - MIN_FARE         - min fare
    - PENALTY_FARE     - penalty fare if no touch in or out
* JourneyLog
    - @journey_class   - injected Journey class object
    - @current_journey - current instance of Journey class
    - @journeylist     - array of previous journey hashes
* Journey
    - @journey         - hash of entry and exit station
* Station
    - @name            - name of station
    - @zone            - zone of station
--------

### Object Public Interface
* Oystercard
    - new(value) - creates new instance with optional argument of balance
    - balance - displays balance
    - top_up(value) - tops up balance by value, providing doesn't breach max limit
    - touch_in(station) - records touch in, blocks if credit below min, charges penalty if already touched in
    - touch_out(station) - records touch out, charges fare
    - show_journeys - shows log of journeys
* Station
    - new('name', zone) - creates new instance with name and zone integer

--------

### Approach

* Followed Makers Academy challenge readme with various pairs in cohort. Challenge 15 & 16 were completed personally.
* Refactored, cleanup, extended readme, added example file.

### Reflect
* Second pair programming challenge, so the difficulty was higher than the boris bikes project.
* Pairs programming went well learned a few new techniques from my pairs.
* Learning about dependency injection was challenging, however after enough research and explaining between pairs it made sense why it is advantageous to implement. Need to nail down the techniques of OOD and create a process for implementing them in realtime as I create the scripts
* The challenge of extracting a class from a class then refactoring turned out very messy, however I believe this was the intention of the challenge since it could have easily been avoided with careful thought about the clients requirements and domain modelling prior to starting TDD.
* TDD through RSpec proved challenging since I am still new to the syntax, however towards the end and after research about testing for object behaviour the challenges it started to become easier. Need to create a process and list of common matchers in notes before next challenge.
