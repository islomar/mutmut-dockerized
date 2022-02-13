# mutmut-dockerized

Dockerized version of **mutmut**:

- https://github.com/boxed/mutmut
- https://mutmut.readthedocs.io/en/latest/
- https://github.com/boxed/mutmut/tags

## How to start

Run `make` to list all the possible actions to perform withing this repository.

## Python references for the dockerization

- https://github.com/docker-library/python
  - https://github.com/docker-library/python/blob/master/3.9/alpine3.15/Dockerfile
- https://github.com/tiangolo/fastapi

## Other references

- https://github.com/CodiumTeam/docker-training
- https://docs.docker.com/language/python/build-images/
- https://boscacci.medium.com/why-and-how-to-make-a-requirements-txt-f329c685181e

## Other mutation testing tools

- https://github.com/mutpy/mutpy
- https://github.com/EvanKepner/mutatest
- https://github.com/sixty-north/cosmic-ray

## TO DO
- Split in the Dockerfile running the tests to see that it works from the mutmut image
- Use expects for example test
- Change example test to something better
- Include/compare coverage: https://pypi.org/project/coverage/
- `pip freeze > requirements.txt`
