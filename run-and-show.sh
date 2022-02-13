#!/bin/sh

mutmut --paths-to-mutate=example/src/ --tests-dir=example/tests run
mutmut --paths-to-mutate=example/src/ --tests-dir=example/tests junitxml