from example.src.example import Calculator


class CalculatorTest():

    def test_add(self):
        calculator = Calculator()

        result = calculator.add(2, 2)

        assert result == 4