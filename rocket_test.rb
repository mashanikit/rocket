require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test

  def setup
    @rocket = Rocket.new
  end

  def test_new_name
    # @rocket = Rocket.new
    @rocket.name = "apollo"
    assert @rocket.name == "apollo"
  end

  def test_new_colour
    # @rocket = Rocket.new
    @rocket.colour = "blue"
    assert @rocket.colour == "blue"
  end

  def test_flying_true
    @rocket = Rocket.new(flying: true)
    assert @rocket.flying?
  end

  def test_flying_false
    @rocket = Rocket.new
    refute @rocket.flying?
  end


  def test_lift_off_while_flying
    @rocket = Rocket.new(flying: true)
    refute @rocket.lift_off
  end

  def test_lift_off_not_flying
    @rocket = Rocket.new
    assert @rocket.lift_off
  end

  def test_land_if_flying
    @rocket = Rocket.new(flying: true)
    assert @rocket.land
  end

  def test_land_while_flying_grounds_rocket
    @rocket = Rocket.new(flying: true)
    @rocket.land
    refute @rocket.flying?

  end

  def test_land_if_not_flying
    @rocket = Rocket.new
    refute @rocket.land
  end

  def test_status_if_flying
    @rocket = Rocket.new(flying: true)
    name = @rocket.name
    assert_equal @rocket.status, "Rocket #{name} is flying through the sky!"
  end

  def test_status_not_flying
    @rocket = Rocket.new
    name = @rocket.name
    assert_equal @rocket.status, "Rocket #{name} is ready for lift off!"
  end




end
