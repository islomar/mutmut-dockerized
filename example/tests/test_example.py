# -*- coding: utf-8 -*-

from example.src.example import Calculator


class TestCalculator:

    def test_add(self):
        calculator = Calculator()

        result = calculator.add(0, 0)

        assert result == 0