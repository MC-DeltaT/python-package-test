from pytest import approx

from python_package_test.module import func


def test_func() -> None:
    assert func(10) == approx(55)
