# Secrypto

A simple API that allow to encrypt/decrypt text. API store the data encrypted in the database and returns the key to access it.

## getting started

```
 git clone https://github.com/davidesantangelo/secrypto.git
 cd secrypto & bundle install
 rails s 
```

## encrypt

```
curl --data "text=i am a ruby developer" https://secrypto.herokuapp.com/api/encrypt
```

## decrypt

```
curl --data "key=<key received>" https://secrypto.herokuapp.com/api/decrypt
```
## license

Secrypto app is released under the MIT License.
