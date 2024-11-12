from example_code import add_integers


def test_add():
    """Test the add function."""
    assert add_integers(2, 3) == 5
    assert add_integers(-1, 1) == 0
    assert add_integers(0, 0) == 0
    assert add_integers(100, -100) == 0
