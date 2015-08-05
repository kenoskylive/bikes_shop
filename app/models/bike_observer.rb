# saved in the file app/models/bike_observer.rb
require 'my_logger'

class Bike_Observer < ActiveRecord::Observer
    
    def after_update(record)
        #use the myLogger instance method to retrieve the singleton / object
        @logger = MyLogger.instance
        # use the logger to log/record a message about the updated bike
        @logger.logInformation("###################Observer Demo:#")
        @logger.logInformation("+++ Bike_Observer: The bike of #{record.name} has been updated. price #{record.price}")
        @logger.logInformation("###########################################")
    end
end