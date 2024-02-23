# get all movie
curl -X 'GET' 'http://host4:8080/api/movie'

# get movie by id
curl -X 'GET' 'http://host4:8080/api/movie/1'

# search
curl  -X 'GET'  'http://host4:8080/api/movie/search?t=barbie'
curl  -X 'GET'  'http://host4:8080/api/movie/search?t=barbie&y1=2023&y2=2055'
curl  -X 'GET'  'http://host4:8080/api/movie/search?t=barbie&y1=2023&y2=aaa'


# add movie
 curl -X 'POST' \
   'http://host4:8080/api/movie' \
   -H 'accept: */*' \
   -H 'Content-Type: application/json' \
   -d '{
   "title": "The Batman",
   "year": 2022,
   "duration": 120
 }'

  curl -v -X 'POST' \
    'http://host4:8080/api/movie' \
    -H 'accept: */*' \
    -H 'Content-Type: application/json' \
    -d '{
    "title": "The Batman 3",
    "year": 2033,
    "duration": 120
  }'

 #update
 curl -X 'PUT' \
   'http://host4:8080/api/movie' \
   -H 'accept: */*' \
   -H 'Content-Type: application/json' \
   -d '{
   "title": "The Batman",
   "year": 2021,
   "duration": null,
   "synopsis": "super movie with Batman",
   "posterUri": "url to poster",
   "id": 5
 }'

 # delete
 curl -X 'DELETE' \
   'http://host4:8080/api/movie/{id}?id=1' \
   -H 'accept: */*'

curl -X 'DELETE'  'http://host4:8080/api/movie/{id}?id=5'


# add person
 curl -X 'POST' \
    'http://host4:8080/api/person' \
    -H 'accept: */*' \
    -H 'Content-Type: application/json' \
    -d '{
    "name": "John Doe",
    "birthdate": "2003-12-15"
  }'

# ------------  Invalid data  ------------------

 curl -X 'POST' \
   'http://host4:8080/api/movie' \
   -H 'accept: */*' \
   -H 'Content-Type: application/json' \
   -d '{
   "title": "The Batman",
   "duration": 120
 }'

 curl -X 'POST' \
   'http://host4:8080/api/person' \
   -H 'accept: */*' \
   -H 'Content-Type: application/json' \
   -d '{
   "name": "John Doe",
   "birthdate": "aaaa"
 }'

curl -X 'POST' \
   'http://host4:8080/api/person' \
   -H 'accept: */*' \
   -H 'Content-Type: application/json' \
   -d '{
   "name": "John Doe",
   "birthdate": "2023-02-29"
 }'

 curl -X 'POST' \
    'http://host4:8080/api/person' \
    -H 'accept: */*' \
    -H 'Content-Type: application/json' \
    -d '{
    "name": "John Doe",
    "birthdate": "2023-12-15"
  }'


 curl -X 'POST' \
   'http://host4:8080/api/movie' \
   -H 'accept: */*' \
   -H 'Content-Type: application/json' \
   -d '{
   "title": "  ",
   "duration": 30
 }'

# bad setDirector
curl -X 'PATCH' \
  'http://host4:8080/api/movie/{idMovie}/setDirector/{idDirector}?idMovie=0&idDirector=1' \
  -H 'accept: */*'





