from python_package_test.module import func


def test_func() -> None:
    assert func(10) == 20
    assert func(-10) == -20
