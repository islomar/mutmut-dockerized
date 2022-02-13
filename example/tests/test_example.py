# -*- coding: utf-8 -*-

class CalculatorTest():

    def test_add(self):
        calculator = Calculator()

        result = calculator.add(0, 0)

        assert result == 0