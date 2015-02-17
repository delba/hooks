# Hooks

A hooks library for ruby.

## Before hook

```ruby
class Person
  include Hooks

  before_talk :listen

  def talk
    puts 'talking'
  end

private

  def listen
    puts 'listening'
  end
end

person = Person.new
person.talk
# listening
# talking
```

## After hook

```ruby
class Person
  include Hooks

  after_sleep :wake_up

  def sleep
    puts 'sleeping'
  end

private

  def wake_up
    puts 'waking up'
  end
end

person = Person.new
person.sleep
# sleeping
# waking up
```

## Around hook

```ruby
class Person
  include Hooks

  around_party :smile

  def party
    puts 'partying'
  end

private

  def smile
    puts 'smiling'
    yield
    puts 'smiling'
  end
end

person = Person.new
person.party
# smiling
# partying
# smiling
```
