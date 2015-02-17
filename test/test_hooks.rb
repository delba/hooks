require 'minitest_helper'

class Person
  include Hooks

  before_talk :listen
  around_party :smile
  after_sleep :wake_up

  attr_reader :before, :around, :after

  def initialize
    @before = []
    @around = []
    @after  = []
  end

  def talk
    @before.push :talk
  end

  def party
    @around.push :party
  end

  def sleep
    @after.push :sleep
  end

private

  def listen
    @before.push :listen
  end

  def smile
    @around.push :smile_before
    yield
    @around.push :smile_after
  end

  def wake_up
    @after.push :wake_up
  end
end

class TestHooks < Minitest::Test
  def setup
    @person = Person.new
  end

  def test_before_hook
    @person.talk
    assert_equal [:listen, :talk], @person.before
  end

  def test_around_hook
    @person.party
    assert_equal [:smile_before, :party, :smile_after], @person.around
  end

  def test_after_hook
    @person.sleep
    assert_equal [:sleep, :wake_up], @person.after
  end
end
