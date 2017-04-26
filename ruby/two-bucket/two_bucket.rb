class TwoBucket

  attr_reader :moves, :goal_bucket, :other_bucket
  
  def initialize(bucket_one_size, bucket_two_size, desired_liters, bucket_to_fill_first)
    
  	bucket_one_contents = 0
  	bucket_two_contents = 0
    if bucket_to_fill_first == "one"
      bucket_one_contents = bucket_one_size
    elsif bucket_to_fill_first == "two"
      bucket_two_contents = bucket_two_size
    end
    
  	@moves = 1
  	while bucket_to_fill_first == "one" && bucket_one_contents != desired_liters ||
  	      bucket_to_fill_first == "two" && bucket_two_contents != desired_liters
  	  if bucket_to_fill_first == "one"
  	    if bucket_two_contents == bucket_two_size
  	      bucket_two_contents = 0
  	    elsif bucket_one_contents == 0
  	      bucket_one_contents = bucket_one_size
  	    else
  	      transferred_liters = [bucket_one_contents, bucket_two_size - bucket_two_contents].min
  	      bucket_one_contents -= transferred_liters
  	      bucket_two_contents += transferred_liters
  	    end
  	  elsif bucket_to_fill_first == "two"
  	    if bucket_one_contents == bucket_one_size
  	      bucket_one_contents = 0
  	    elsif bucket_two_contents == 0
  	      bucket_two_contents = bucket_two_size
  	    else
  	      transferred_liters = [bucket_two_contents, bucket_one_size - bucket_one_contents].min
  	      bucket_two_contents -= transferred_liters
  	      bucket_one_contents += transferred_liters
  	    end
  	  end
  	  @moves += 1
  	end
  	
  	@goal_bucket = bucket_to_fill_first
  	
    if bucket_to_fill_first == "one"
      @other_bucket = bucket_two_contents
    elsif bucket_to_fill_first == "two"
      @other_bucket = bucket_one_contents
    end
  	
  end
  
end

module BookKeeping
  VERSION = 2
end