# saved in the file app/models/rental_observer.rb
require 'my_logger'

class Rental_Observer < ActiveRecord::Observer
    
    def after_update(record)
        #use the myLogger instance method to retrieve the singleton / object
        @logger = MyLogger.instance
        # use the logger to log/record a message about the updated rental
        @logger.logInformation("###################Observer Demo:#")
        @logger.logInformation("+++ Rental_Observer: The Rental of #{record.name} has been updated. price #{record.price}")
        @logger.logInformation("###########################################")
    end
end