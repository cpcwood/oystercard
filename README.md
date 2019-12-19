# Oystercard Challenge
--------

## Outline

Makers Academy challenge to create an commandline ruby application which emulates an oystercard system, including adding balance, touching in and out, journey history, and penalty fares. The application must be created using TDD with the RSpec gem, testing for object behaviour, and covering edge cases.

## How to Install & Example

The application is run directly from the command line, so to install simply clone or fork the repository, change directory to the root folder, open irb, and paste the following code:
```
require './lib/oystercard.rb'
require './lib/station.rb'
```
Alternativly run the example script or *rspec* to see the test documentation.

## Customer Requirements

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

## Objects & Attributes
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

## Objects & Methods
* Oystercard
    -
* JourneyLog
    -
* Journey
    -
* Station
    -
