# frozen_string_literal: true

module ProfileHelper
  require 'benchmark'

  #################################################################################################
  # Function - Profile
  #
  # Description
  ### Profiles the memory, time and number of freed objects by the Garbage Collector from the begin
  ### and the finish of a script
  #################################################################################################
  def profile
    profile_memory do
      profile_time do
        yield
      end
    end
  end

  #################################################################################################
  # Function - Profile Memory
  #
  # Description
  ### Profiles the memory used from the begin and the finish of the script
  #################################################################################################
  def profile_memory
    memory_usage_before = `ps -o rss= -p #{Process.pid}`.to_i
    yield
    memory_usage_after = `ps -o rss= -p #{Process.pid}`.to_i

    used_memory = ((memory_usage_after - memory_usage_before) / 1024.0).round(2)
    puts "Memory usage: #{used_memory} MB"
  end

  #################################################################################################
  # Function - Profile Time
  #
  # Description
  ### Profiles the time taken in seconds from the begin and the finish of a script
  #################################################################################################
  def profile_time
    time_elapsed = Benchmark.realtime do
      yield
    end

    puts "Time: #{time_elapsed.round(3)} seconds"
  end
end
