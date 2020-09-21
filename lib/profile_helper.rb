# frozen_string_literal: true

# Profile Helper gives a set of functions to help evaluate the performance of
# each script by measuring memory and time consumed by each of them
module ProfileHelper
  require 'benchmark'

  def profile
    profile_memory do
      profile_time do
        yield
      end
    end
  end

  def profile_memory
    memory_usage_before = `ps -o rss= -p #{Process.pid}`.to_i
    yield
    memory_usage_after = `ps -o rss= -p #{Process.pid}`.to_i

    used_memory = ((memory_usage_after - memory_usage_before) / 1024.0).round(2)
    puts "Memory usage: #{used_memory} MB"
  end

  def profile_time
    time_elapsed = Benchmark.realtime do
      yield
    end

    puts "Time: #{time_elapsed.round(3)} seconds"
  end
end
