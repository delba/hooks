# Hooks

```ruby
class Person
  include Hooks

  before_talk :listen
  around_party :smile
  after_sleep :wake_up

  def talk
    puts 'talking'
  end

  def party
    puts 'partying'
  end

  def sleep
    puts 'sleeping'
  end

private

  def listen
    puts 'listening'
  end

  def smile
    puts 'smiling'
    yield
    puts 'smiling'
  end

  def wake_up
    puts 'waking up'
  end
end
```
